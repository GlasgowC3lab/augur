#!/bin/bash

cleanFolder () {
    rm -rf work .nextflow*
}

python make-benchmark.py
cd benchmark

# run benchmark 3 times
nextflow run workflow.nf --pwd `pwd` -c ../nextflow.config > wf-bench-1.log
mv trace.csv wf-benchmark-1.csv
cleanFolder
nextflow run workflow.nf --pwd `pwd` -c ../nextflow.config > wf-bench-2.log
mv trace.csv wf-benchmark-2.csv
cleanFolder
nextflow run workflow.nf --pwd `pwd` -c ../nextflow.config > wf-bench-3.log
mv trace.csv wf-benchmark-3.csv
cleanFolder

mv wf-bench-*.log ../raw/
mv wf-benchmark-*.csv ../raw/

cd ../

# fix error
# sed -i 's|benchmark/bin/wfbench|/root/infra-profiling/benchmark/bin/wfbench|g' /root/infra-profiling/benchmark/bin/script_*.sh
