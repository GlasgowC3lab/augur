import sys
import numpy as np


def get_lines(filename, node):
    with open(f'raw/{node}/{filename}', 'r') as f:
        lines = [line.strip() for line in f if line.strip()]
    return lines


# no. of cores
def read_props(filename, node):
    raw = get_lines(filename, node)
    threads = int(raw[1].split(':')[1])
    cores_per_socket = int(raw[2].split(':')[1])
    sockets = int(raw[3].split(':')[1])
    return threads * cores_per_socket * sockets


# measured in instructions per second (read documentation) MIPS
def read_7z_run(filename, node):
    raw = get_lines(filename, node)
    return f'{raw[-1].split()[2]}'


# measured in events per second
def read_sysbench_run(filename, node):
    raw = get_lines(filename, node)
    ents_per_sec = raw[8].split(':')[1].strip()
    return f'{ents_per_sec}' 


# measured in MiB/s
def read_fio_run(filename, node):
    raw = get_lines(filename, node)

    for line in raw:
        if "READ: bw=" in line or "WRITE: bw=" in line:
            data_line = line
            break

    return data_line.split(',')[0].split(' ')[1].split('=')[1][:-5]


def convert_J_to_kWh(val):
    return val / 3600000


def read_benchmark_trace(filename, node):
    raw = get_lines(filename, node)

    # compute the difference --> 16 is start, 17 complete, memory is 13, 21 cpu%, 22 %mem, 26 peak_vmem, 31 read_bytes, 32 write_bytes
    first_record = raw[1].split(',')
    earliest_start = first_record[16]
    latest_complete = first_record[17]
    for line in raw[2:]:
        parts = line.split(',')
        if parts[16] < earliest_start:
            earliest_start = parts[16]
        if parts[17] > latest_complete:
            latest_complete = parts[17]

    makespan = (float(latest_complete) - float(earliest_start)) / 1000  # convert to seconds

    return makespan


def get_mean_and_std(arr):
    return np.mean(arr), np.std(arr)


def average_wf_benchmark(node):
    time_1 = read_benchmark_trace('wf-benchmark-1.csv', node)
    time_2 = read_benchmark_trace('wf-benchmark-2.csv', node)
    time_3 = read_benchmark_trace('wf-benchmark-3.csv', node)

    return get_mean_and_std([time_1, time_2, time_3])


def write_profile(data, node, memory):
    cores,io_read,io_write,bench,z7_bench,bench_time = data
    filename = f'profiles/{node}.csv'
    with open(filename, 'w') as f:
        f.write('node,ram,cores,io_read,io_write,sysbench,z7b,bench_time\n')
        f.write(f'{node},{memory},{cores},{io_read},{io_write},{bench},{z7_bench},{bench_time}\n')
    print(f'[ExportStats] profile created for {node} with {memory}GB in {filename}')


if __name__ == '__main__':
    args = sys.argv[1:]
    node = args[0].strip()
    memory = int(args[1].strip())

    props = read_props('props.txt', node)
    fio_read = read_fio_run('fio_read.txt', node)
    fio_write = read_fio_run('fio_write.txt', node)
    sysbench = read_sysbench_run('sysbench.txt', node)
    z7 = read_7z_run('7zb.txt', node)
    (bench_time, _) = average_wf_benchmark(node)

    write_profile((props, fio_read, fio_write, sysbench, z7, bench_time), node, memory)
