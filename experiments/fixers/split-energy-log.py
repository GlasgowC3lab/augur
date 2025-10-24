import sys
import csv
from pathlib import Path

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
                    "run": int(row["run"]),
                    "start": int(row["start"]),
                    "end": int(row["end"]),
                    "data": []  
                })
            except ValueError:
                continue

    with open(energy_file) as f:
        lines = [line.strip() for line in f if line.strip()]

    readings = []
    for i in range(0, len(lines), 2):
        if i + 1 < len(lines):
            try:
                energy = lines[i]
                ts = int(lines[i + 1])
                readings.append((ts, energy))
            except ValueError:
                continue

    # assign readings
    for ts, energy in readings:
        for run in runs:
            if run["start"] < ts < run["end"]:
                run["data"].append((ts, energy))
                break  

    # write output
    for run in runs:
        out_file = f"run_{run['run']}_{args[3]}_{args[4]}.csv"
        with open(out_file, "w", newline="") as out:
            writer = csv.writer(out)
            writer.writerow(["timestamp", "energy"])
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
