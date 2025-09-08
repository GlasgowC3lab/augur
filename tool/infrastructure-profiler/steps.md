# Infrastructure Profiling - Steps

chmod +x install-tools.sh energy-readings.sh benchmark.sh wf-benchmark.sh 

0) Install packages for infrastructure profiling

$ ./install-tools.sh

1) Take Turbostress readings

We use turbostress to stress the CPU and memory, which in turn uses stress-ng and turbostat to perform power measurements.

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

$ ./wf-benchmark.sh

5) Export data
Finally, we want to take the output of all profiling stages and produce a record summarising the node's performance statistics.

$ python ExportStats.py <node-identifier> <memory in GB>

The script will create a profile file: <node-identifier>-profile.csv
