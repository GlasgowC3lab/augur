import sys


def get_raw_data(filename):
    with open(filename, 'r') as f:
        data = [line.strip() for line in f.readlines() if line.strip()]

    return data


def convert_J_to_kWh(val):
    return val / 3600000


def parse_perf_data(raw):
    # 0 is a datetime, 1 is the summary
    energy_pkg = float(raw[2].split(' ')[0].replace(',', ''))
    energy_ram = float(raw[3].split(' ')[0].replace(',', ''))
    time = float(raw[4].split(' ')[0].replace(',', ''))

    return (convert_J_to_kWh(energy_pkg), convert_J_to_kWh(energy_ram), time)


if __name__ == '__main__':
    args = sys.argv[1:]
    filename = args[0]
    data = {}

    for iteration in range(1, 4):
        raw = get_raw_data(f'../../data/perf/{filename}-{iteration}.txt')
        vals = parse_perf_data(raw)

        if filename in data:
            data[filename].append(vals)
        else:
            data[filename] = [vals]

    print('(pkg (kWh), ram (kWh), time (s))')  # data in kWh
    for key in data.keys():
        for iter_data in data[key]:
            print(str(iter_data))
        # store average data in output file? 
