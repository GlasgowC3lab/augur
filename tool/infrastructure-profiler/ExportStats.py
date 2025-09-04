import sys


def get_lines(filename):
    with open(filename, 'r') as f:
        lines = [line.strip() for line in f if line.strip()]
    return lines


def read_7z_run(filename):
    raw = get_lines(filename)
    return f'{raw[-1].split()[2]}MIPS'


def read_sysbench_run(filename):
    raw = get_lines(filename)
    ents_per_sec = raw[8].split(':')[1].strip()
    return f'{ents_per_sec}e/s' 


def read_fio_run(filename):
    raw = get_lines(filename)
    bw = raw[-1].split(',')[0].split(' ')[1].split('=')[1]
    return bw


def read_workflow_benchmark_run(filename):
    return [] 


if __name__ == '__main__':
    args = sys.argv[1:]
    node = args[0].strip()
    memory = int(args[1].strip())
    print(f'[ExportStats] Running for {node} w/ {memory}GB')

    fio_read = read_fio_run('fio_read.txt')
    fio_write = read_fio_run('fio_write.txt')
    sysbench = read_sysbench_run('sysbench-run.txt')
    z7 = read_7z_run('7z-run.txt')

    print(fio_read, fio_write, sysbench, z7)
