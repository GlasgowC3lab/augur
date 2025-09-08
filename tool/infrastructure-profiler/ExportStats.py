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
    bw = raw[-1].split(',')[0].split(' ')[1].split('=')[1][:-5]
    return bw


def convert_J_to_kWh(val):
    return val / 3600000


def read_perf_output(filename, node):
    raw = get_lines(filename, node)

    # 0 is a datetime, 1 is the summary
    energy_pkg = float(raw[2].split(' ')[0].replace(',', ''))
    energy_ram = float(raw[3].split(' ')[0].replace(',', ''))
    time = float(raw[4].split(' ')[0].replace(',', ''))

    return (convert_J_to_kWh(energy_pkg), convert_J_to_kWh(energy_ram), time)


def get_mean_and_std(arr):
    return np.mean(arr), np.std(arr)


def average_wf_benchmark(node):
    (cpu_1, ram_1, time_1) = read_perf_output('perf-bench-1.txt', node)
    (cpu_2, ram_2, time_2) = read_perf_output('perf-bench-2.txt', node)
    (cpu_3, ram_3, time_3) = read_perf_output('perf-bench-3.txt', node)

    cpu_mean, cpu_std = get_mean_and_std([cpu_1, cpu_2, cpu_3])
    ram_mean, ram_std = get_mean_and_std([ram_1, ram_2, ram_3])
    time_mean, time_std = get_mean_and_std([time_1, time_2, time_3])

    return (cpu_mean + ram_mean, time_mean)


def write_profile(data, node, memory):
    cores,io_read,io_write,bench,z7_bench,bench_time,bench_energy = data
    filename = f'profiles/{node}.csv'
    with open(filename, 'w') as f:
        f.write('node,ram,cores,io_read,io_write,sysbench,z7b,bench_time,bench_energy\n')
        f.write(f'{node},{memory},{cores},{io_read},{io_write},{bench},{z7_bench},{bench_time},{bench_energy}\n')
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
    bench_energy, bench_time = average_wf_benchmark(node)

    write_profile((props, fio_read, fio_write, sysbench, z7, bench_time, bench_energy), node, memory)
