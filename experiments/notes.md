# Workflow Experiments

Execute at least 5 workflows, representing as many domains as possible, beyond bioinformatics - though that is well represented on nf-core.

Current Plan:
- rnaseq
- rangeland
- mag/chipseq/sarek
- sopa/montage/pangenome

Current config is found in `experiments/nf-exp.config` - where it is important that the trace files are generated, with raw values and that the hostname is present for looking at which k8s node tasks may run on. 

Each workflow must be run a minimum of 3 times, recording the following data:
- workflow trace generated, enabled by the config file with RAW VALUES
- workflow timeline - found in the workflow output folder 'pipeline_info' for official start and stop times
- energy consumption data - log of energy consumed over time, using turbostat/powercap tools to monitor, at every second, ideally this data will be available per task, as we aim to predict the energy consumed by a workflow task
  - see example files in experiments/hu-cluster/rnaseq/full/1/run_1_c40_pkg.csv where we log the timestamp and RAPL value
- data used as workflow input should be persisted, either in a drive, or cloud storage -- main thing is to have the file names and the file sizes, measured in bytes, for the uncompressed data sizes e.g. using gzip -l FILE to get the uncompressed data

Where possible, data should be in csv/txt files, and tracked e.g. workflow/iteration, e.g. rnaseq/1 in folders. 

As long as the workflow traces use raw values, the start and end milliseconds are known, and energy data is present, the only other requirement would be for results from the `tool/infrastructure-profiler` scripts -- i.e. a power model for a node that a workflow would run on, and the results of the benchmark tools. Instructions for the profiling phase are found in `tool/infrastructure/steps.md`. 

Feel free to add workflow traces and document as many additional details as possible! Once we have traces, we can run the profiling phase -- where we take a subset of the full dataset and run this on local machines to kick-off our performance prediction phase.
