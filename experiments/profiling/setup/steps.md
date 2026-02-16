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
