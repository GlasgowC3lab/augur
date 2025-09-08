#!/bin/bash

cleanFolder () {
    rm -rf work .nextflow*
}

python make-benchmark.py
cd benchmark

# run benchmark 3 times
perf stat -o perf-bench-1.txt -a -e power/energy-pkg/,power/energy-ram/ nextflow run workflow.nf --pwd `pwd` -c ../nextflow.config > wf-bench-1.log
mv trace.csv wf-benchmark-1.csv
cleanFolder
perf stat -o perf-bench-2.txt -a -e power/energy-pkg/,power/energy-ram/ nextflow run workflow.nf --pwd `pwd` -c ../nextflow.config > wf-bench-2.log
mv trace.csv wf-benchmark-2.csv
cleanFolder
perf stat -o perf-bench-3.txt -a -e power/energy-pkg/,power/energy-ram/ nextflow run workflow.nf --pwd `pwd` -c ../nextflow.config > wf-bench-3.log
mv trace.csv wf-benchmark-3.csv
cleanFolder

mv wf-bench-*.log ../raw/
mv wf-benchmark-*.csv ../raw/
mv perf-*.txt ../raw/

cd ../
rm -rf benchmark/
