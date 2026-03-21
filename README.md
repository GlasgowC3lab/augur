# Augur: Pre-Execution Energy Prediction for Workflow Tasks in Heterogeneous Clusters

Augur is an approach proposed to predict workflow task energy consumption, prior to the workflow's execution, by efficiently profiling the targeted cluster infrastructure, and the selected workflow. 

## Reproducing Paper Results
All data used in our evaluation is stored in this repository, and the notebook (experiments/profiling/evaluation.ipynb) can be used to re-create the results.

## Repository
```
- tool/infrastructure-profiler: the set-up and execution scripts necessary to profile infrastructure
- experiments/
  - *-cluster: workflow execution data from two local clusters
  - measure-energy: scripts used to monitor energy consumption by reading RAPL counters
  - fixers: utility scripts used to process workflow and energy log data
  - profiling/: workflow profiling execution data from nodes used in the evaluation
    - evaluation.ipynb: the code and analysis used in our evaluation, implementing workflow task energy consumption prediction
```
