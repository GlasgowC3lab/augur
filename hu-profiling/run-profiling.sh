#!/bin/bash

#nextflow run nf-core/chipseq -r 2.0.0 -profile test_full -c nf-chipseq-e.config
#mv outdata/pipeline_info/* chipseq-out/e/
#mv null/pipeline_info/* chipseq-out/e/
#mkdir chipseq-out/a/
#mv outdata/*.csv chipseq-out/e/
#rm -rf null outdata work .nextflow*

nextflow run nf-core/chipseq -r 2.0.0 -profile test_full -c nf-chipseq-f.config
mv outdata/pipeline_info/* chipseq-out/f/
mv null/pipeline_info/* chipseq-out/f/
#mkdir chipseq-out/b/
mv outdata/*.csv chipseq-out/f/
rm -rf null outdata work .nextflow*

mkdir outdata
nextflow run nf-core/chipseq -r 2.0.0 -profile test_full -c nf-chipseq-g.config
mv outdata/pipeline_info/* chipseq-out/g/
mv null/pipeline_info/* chipseq-out/g/
#mkdir chipseq-out/c/
mv outdata/*.csv chipseq-out/g/
rm -rf null outdata work .nextflow*

mkdir outdata
nextflow run nf-core/chipseq -r 2.0.0 -profile test_full -c nf-chipseq-h.config
mv outdata/pipeline_info/* chipseq-out/h/
mv null/pipeline_info/* chipseq-out/h/
#mkdir chipseq-out/d/
mv outdata/*.csv chipseq-out/h/
rm -rf null outdata work .nextflow*


