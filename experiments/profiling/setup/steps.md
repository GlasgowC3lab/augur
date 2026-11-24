# setup workflow data
- download data 
  $ gsutil cp -r gs://BUCKET/rnaseq/full/STARIndex/ .
- create input data files
  - "rnaseq-input-a.csv"
- update config to point to input file
  - "nf-rnaseq.config"

# run energy collection script
$ nohup collect_energy_data.sh /root/rnaseq-mini/energy-logs/energy_log_c40.txt /root/rnaseq-mini/energy-logs/energy_DRAM_log_c40.txt &
- file must be present

# run the profiling
$ ./run-profiling.sh

# example setup for profiling
- download the accession from ncbi, wget or alternative from url
- use fasterq-dump to split into parts, with --gzip so that the format is correct
- split into 8, 10, 12, 14 and 16 parts -- named _aa/_ab/_ac/_ad/_ae for sarek

seqkit split2 -1 SRR11452471_1.fastq.gz -2 SRR11452471_2.fastq.gz -p 8 -O split-8/ -f
seqkit split2 -1 SRR11452471_1.fastq.gz -2 SRR11452471_2.fastq.gz -p 10 -O split-10/ -f
seqkit split2 -1 SRR11452471_1.fastq.gz -2 SRR11452471_2.fastq.gz -p 12 -O split-12/ -f
seqkit split2 -1 SRR11452471_1.fastq.gz -2 SRR11452471_2.fastq.gz -p 14 -O split-14/ -f
seqkit split2 -1 SRR11452471_1.fastq.gz -2 SRR11452471_2.fastq.gz -p 16 -O split-16/ -f

- execute workflow profiling run using each set of sample data
  $ NXF_VER=25.10.3 nextflow run nf-core/sarek -r 3.5.1 -profile test_full -c nf-sarek-aa.config --tools mutect2 -bg 
