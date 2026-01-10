#!/bin/bash

mkdir WORKFLOW-INPUT
mkdir outdata

nextflow run WORKFLOW -c WORKFLOW-CONF.config

mv outdata/pipeline_info/* WORKFLOW-INPUT
mv null/pipeline_info/* WORKFLOW-INPUT
mv outdata/*.csv WORKFLOW-INPUT

rm -rf null outdata work .nextflow*
