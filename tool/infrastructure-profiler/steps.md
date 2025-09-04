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


4) Run workflow benchmark


5) Export data
Finally, we want to take the output of all profiling stages and produce a record summarising the node's performance statistics.

$ python ExportStats.py <node-identifier> <memory in GB>
