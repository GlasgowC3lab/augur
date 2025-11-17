#!/bin/bash

mkdir chipseq-sample-e
mkdir outdata

nextflow run chipseq/main.nf -profile test_full -c chipseq-conf-e.config

mv outdata/pipeline_info/* chipseq-sample-e
mv null/pipeline_info/* chipseq-sample-e
mv outdata/*.csv chipseq-sample-e

rm -rf null outdata work .nextflow*

mkdir chipseq-sample-f
mkdir outdata

nextflow run chipseq/main.nf -profile test_full -c chipseq-conf-f.config

mv outdata/pipeline_info/* chipseq-sample-f
mv null/pipeline_info/* chipseq-sample-f
mv outdata/*.csv chipseq-sample-f

rm -rf null outdata work .nextflow*

mkdir chipseq-sample-g
mkdir outdata

nextflow run chipseq/main.nf -profile test_full -c chipseq-conf-g.config

mv outdata/pipeline_info/* chipseq-sample-g
mv null/pipeline_info/* chipseq-sample-g
mv outdata/*.csv chipseq-sample-g

rm -rf null outdata work .nextflow*

mkdir chipseq-sample-h
mkdir outdata

nextflow run chipseq/main.nf -profile test_full -c chipseq-conf-h.config

mv outdata/pipeline_info/* chipseq-sample-h
mv null/pipeline_info/* chipseq-sample-h
mv outdata/*.csv chipseq-sample-h

rm -rf null outdata work .nextflow*
