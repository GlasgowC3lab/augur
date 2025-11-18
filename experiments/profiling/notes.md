# Running Profiling Experiments

For each profiling experiment, we gathered the following key files:
- input/output/summary .csv are files produced by nf-datatrail, and contain task records, linked to the data inputted -- we need this information to start making predictions
- trace.csv the workflow trace produced by nextflow, allowing for data input sizes to be lined up with the task runtime, and other metrics
- in execution_timeline.html, we can find the beginningMillis and endMillis for the overall workflow start and end timestamp, useful to have but not essential
- energy_log/energy_dram_log .txt -- depending on the system's availability, we log the energy consumed by the package and dram (dram not available on our AMD node), and this is needed to be able to attribute the energy consumed over the workflow's execution on a single node (not at a task level sadly)

If you run the following command, these files can be collated into a experimental trace, and a file for metadata to be updated like the node it ran on, runtime, system information, etc.
$ python combine.py ./trace.csv ./summary.csv tu-06

Trace excerpt:
```
task_id,hostname,tag,name,cpus,time,disk,memory,start,complete,duration,realtime,%cpu,%mem,rss,vmem,peak_rss,peak_vmem,rchar,wchar,syscr,syscw,read_bytes,write_bytes,vol_ctxt,inv_ctxt,cpu_model,task,inputs,inputSize,outputs,outputSize,usedBy
3,tu-06,sample_a,NFCORE_RNASEQ:RNASEQ:FASTQ_QC_TRIM_FILTER_SETSTRANDEDNESS:FQ_LINT (sample_a),2,14400000,-,12884901888,1763045562269,1763045571892,9692,5000,99.9,0.0,31318016,34975744,31318016,34975744,327865173,1910,40230,29,0,12288,1,14,AMD EPYC 7282 16-Core Processor,NFCORE_RNASEQ:RNASEQ:FASTQ_QC_TRIM_FILTER_SETSTRANDEDNESS:FQ_LINT (sample_a),2,220749189,2,1538,0
1,tu-06,genome.fa,NFCORE_RNASEQ:PREPARE_GENOME:CUSTOM_GETCHROMSIZES (genome.fa),1,14400000,-,6442450944,1763045562265,1763045579550,17362,9000,100.2,0.0,5103616,10977280,5103616,10977280,3147432608,5941,48280,20,0,12288,1,36,AMD EPYC 7282 16-Core Processor,NFCORE_RNASEQ:PREPARE_GENOME:CUSTOM_GETCHROMSIZES (genome.fa),1,3147288982,3,1094,5
2,tu-06,genome.fa,NFCORE_RNASEQ:PREPARE_GENOME:GTF_FILTER (genome.fa),1,14400000,-,6442450944,1763045562271,1763045581577,19370,14000,100.4,0.0,16265216,20824064,16265216,20828160,4064516915,838278831,496346,104478,0,838389760,58,20,AMD EPYC 7282 16-Core Processor,NFCORE_RNASEQ:PREPARE_GENOME:GTF_FILTER (genome.fa),2,4063383142,2,838278323,10
```

Metadata: 
```
tu-06
1 node
AMD EPYC 7282 16-Core Processor
```
