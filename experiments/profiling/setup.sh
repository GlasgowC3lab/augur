#!/bin/bash

mkdir profiling
cd profiling

# download samples
gsutil cp gs://augur-data-kw/rnaseq/mini/*.fastq.gz .
gsutil cp gs://augur-data-kw/chipseq/mini/*.fastq.gz .

# download ref
mkdir ref
cd ref
gsutil cp -r gs://augur-data-kw/rnaseq/full/STARIndex/ .
gsutil cp gs://augur-data-kw/rnaseq/full/genes.bed .
gsutil cp gs://augur-data-kw/rnaseq/full/genes.gtf .
gsutil cp gs://augur-data-kw/rnaseq/full/genome.fa .

cd ../

# download specific version of chipseq (same as in experiments)
# download specific version of rnaseq (same as in experiments)

# setup input csv
cp rnaseq-input-base.csv rnaseq-input-a.csv
cp rnaseq-input-base.csv rnaseq-input-b.csv
cp rnaseq-input-base.csv rnaseq-input-c.csv
cp rnaseq-input-base.csv rnaseq-input-d.csv

cp chipseq-input-base.csv chipseq-input-e.csv
cp chipseq-input-base.csv chipseq-input-f.csv
cp chipseq-input-base.csv chipseq-input-g.csv
cp chipseq-input-base.csv chipseq-input-h.csv

# setup config files for wf runs
cp rnaseq-conf-base.config rnaseq-conf-a.config
cp rnaseq-conf-base.config rnaseq-conf-b.config
cp rnaseq-conf-base.config rnaseq-conf-c.config
cp rnaseq-conf-base.config rnaseq-conf-d.config

cp chipseq-conf-base.config chipseq-conf-e.config
cp chipseq-conf-base.config chipseq-conf-f.config
cp chipseq-conf-base.config chipseq-conf-g.config
cp chipseq-conf-base.config chipseq-conf-h.config

