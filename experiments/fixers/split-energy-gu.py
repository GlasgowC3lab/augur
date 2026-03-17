import sys
import csv
from pathlib import Path


def is_ts(value):
    try:
        return int(value) > 1e12  # ts must be > January 1st 2020
    except ValueError:
        return False

def main(args):
    energy_file = Path(args[1])
    run_file = Path(args[2])

    # read runs
    runs = []
    with open(run_file) as f:
        reader = csv.DictReader(f)
        for row in reader:
            try:
                runs.append({
                    "run": str(row["run"]),
                    "start": int(row["start"]),
                    "end": int(row["end"]),
                    "data": []  
                })
            except ValueError:
                continue

    with open(energy_file) as f:
        lines = [line.strip() for line in f if line.strip()]

    readings = []
    i = 0

    while i < len(lines):
        if i + 2 < len(lines):
            try:
                item_1 = int(lines[i])
                item_2 = int(lines[i+1])
                item_3 = int(lines[i+2])

                if not is_ts(item_1) and not is_ts(item_2) and is_ts(item_3):
                    readings.append((item_3, item_1, item_2))
                    i += 3
                    continue

            except ValueError:
                pass

        found_sync = False
        for j in range(i, min(i + 10, len(lines))):  
            if is_ts(lines[j]):
                if j >= 2:
                    try:
                        energy_1 = int(lines[j-2])
                        energy_2 = int(lines[j-1])
                        if not is_ts(lines[j-2]) and not is_ts(lines[j-1]):
                            readings.append((int(lines[j]), energy_1, energy_2))
                            i = j + 1
                            found_sync = True
                            break
                    except ValueError:
                        pass
                i = j + 1
                found_sync = True
                break
        
        if not found_sync:
            i += 1

    # assign readings
    for ts, energy_1, energy_2 in readings:
        for run in runs:
            if run["start"] < ts < run["end"]:
                run["data"].append((ts, energy_1, energy_2))
                break  

    # write output
    for run in runs:
        out_file = f"run_{run['run']}_{args[3]}_{args[4]}.csv"
        with open(out_file, "w", newline="") as out:
            writer = csv.writer(out)
            writer.writerow(["timestamp", "energy_1", "energy_2"])
            writer.writerows(run["data"])

"""
Split energy readings into separate CSVs per run based on start/end times.

Usage:
    python split_energy_by_run.py energy_file.txt run-stamps.csv
"""
if __name__ == "__main__":
    if len(sys.argv) != 5:
        print("Usage: python split_energy_by_run.py <energy_file.txt> <run-stamps.csv> <node> <pkg|dram>")
        sys.exit(1)

    main(sys.argv)
