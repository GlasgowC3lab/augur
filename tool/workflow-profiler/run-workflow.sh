#!/bin/bash


for each workflow we need to run in the same directory


workflows/ 
  wf-config -- full trace data, k8s
  rnaseq/ 
    profiling/
      1/ 
        download-data.sh
        run-workflow.sh
        wf-specific-config?
      2/ 
      ...
      3/ 
      ...
    entire/
      1/ 
      ...
      2/ 
      ...
      3/ 
      ...
  ... 
