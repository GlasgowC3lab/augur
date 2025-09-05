# Infrastructure Profiling - Steps

Machine Requirements:
- stress-ng command
- turbostat command
- golang 1.15+
- python 
- 7z / sysbench
- fio

1) Take Turbostress readings

We use turbostress to stress the CPU and memory, which in turn uses stress-ng and turbostat to perform power measurements.

Once installed:
$ git clone https://github.com/teads/turbostress.git
$ cd turbostress
$ go build cmd/main.go
$ chown +x main
$ cd ../

From the folder containing turbostress and the infrastructure profiling files:
$ ./energy-readings.sh

2) Generate a power model
Next, we use python to fit a power model for the node.

$ python FitPowerModels.py <node-identifier> <memory in GB>
$ python FitPowerModels.py edge-server 32

3) Run generic benchmarks
Execute the generic benchmark script.

$ ./benchmark.sh

4) Run workflow benchmark (WIP development)
We also use a workflow benchmark, generated using the WfBench project.

-- message Fabian/reach out to Friedrich - ask about the benchmark workflows - how did they use the tool, any extra steps, the ones i generate are very fast and tasks take like 5-6s, which isn't ideal, plus i get the impression you need to have already installed wfchef etc, which is not great? can i make a custom container with wfchef installed?
-- alternative lightweight approach is to use the pre-existing workflow test configuration as a benchmark -- this could be really cool? how long would the tasks run for though, how long is reasonable?

kathleen@gpgnode-16:~/benchmark-test$ perf stat -o perf-rnaseq-1.txt -a -e power/energy-pkg/,power/energy-ram/ nextflow run nf-core/rnaseq --outdir out -c nextflow.config -profile test > rnaseq-1.log

find one where it takes ~5 minutes to run on the old GPG node, should be a reasonable workload?
what is a good length of time, has philipp tried the wf benchmark before, is friedrich still around?

5) Export data
Finally, we want to take the output of all profiling stages and produce a record summarising the node's performance statistics.

$ python ExportStats.py <node-identifier> <memory in GB>
