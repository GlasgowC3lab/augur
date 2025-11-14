import pandas as pd
import sys 


def open_file(trace, delim=','):
    with open(trace) as file:
        stripped_lines = [line.rstrip().split(delim) for line in file.readlines()]
        header = stripped_lines[0]
        data = stripped_lines[1:]

    return pd.DataFrame(data, columns=header)


# example use of combine.py script
# $ python combine.py tu-06/chipseq-profiling-runs/chipseq-sample-e
if __name__ == '__main__':
    args = sys.argv[1:]
    trace_filename = f'{args[0]}/trace.csv'
    task_data_filename = args[1]
    hostname = args[2]
    output_file = f'{args[0]}/trace-combined.csv'

    # process data
    trace_data = open_file(trace_filename)
    trace_data['hostname'] = hostname
    trace_data = trace_data.drop(['native_id', 'exit', 'status', 'module', 
                     'container', 'attempt', 'submit', 'queue', 'workdir', 
                     'scratch', 'error_action', 'process'], axis=1)
    summary_data = open_file(task_data_filename, ';')
    summary_data = summary_data.drop(['hash'], axis=1)
    combined_data = pd.merge(trace_data, summary_data, left_on=['name'], right_on=['task'], how ='left')
    combined_data.to_csv(output_file, index=False)
