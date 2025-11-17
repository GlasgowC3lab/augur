#!/bin/bash

mkdir rnaseq-sample-a
mkdir outdata

nextflow run rnaseq/main.nf -profile test_full -c rnaseq-conf-a.config

mv outdata/pipeline_info/* rnaseq-sample-a
mv null/pipeline_info/* rnaseq-sample-a
mv outdata/*.csv rnaseq-sample-a

rm -rf null outdata work .nextflow*

mkdir rnaseq-sample-b
mkdir outdata

nextflow run rnaseq/main.nf -profile test_full -c rnaseq-conf-f.config

mv outdata/pipeline_info/* rnaseq-sample-b
mv null/pipeline_info/* rnaseq-sample-b
mv outdata/*.csv rnaseq-sample-b

rm -rf null outdata work .nextflow*

mkdir rnaseq-sample-c
mkdir outdata

nextflow run rnaseq/main.nf -profile test_full -c rnaseq-conf-c.config

mv outdata/pipeline_info/* rnaseq-sample-c
mv null/pipeline_info/* rnaseq-sample-c
mv outdata/*.csv rnaseq-sample-c

rm -rf null outdata work .nextflow*

mkdir rnaseq-sample-d
mkdir outdata

nextflow run rnaseq/main.nf -profile test_full -c rnaseq-conf-d.config

mv outdata/pipeline_info/* rnaseq-sample-d
mv null/pipeline_info/* rnaseq-sample-d
mv outdata/*.csv rnaseq-sample-d

rm -rf null outdata work .nextflow*
