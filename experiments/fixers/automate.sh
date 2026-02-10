# convert stamps
# python convert-stamps.py rnaseq-hu/energy_log_c40.txt 2025-10-22 2 

# divide energy 
python split-energy-log.py temp/runs-nov/energy_log_c40.txt temp/runs-nov/rnaseq/stamps.csv c40 pkg
python split-energy-log.py temp/runs-nov/energy_log_c42.txt temp/runs-nov/rnaseq/stamps.csv c42 pkg
python split-energy-log.py temp/runs-nov/energy_log_c44.txt temp/runs-nov/rnaseq/stamps.csv c44 pkg
python split-energy-log.py temp/runs-nov/energy_log_c45.txt temp/runs-nov/rnaseq/stamps.csv c45 pkg

python split-energy-log.py temp/runs-nov/energy_DRAM_log_c40.txt temp/runs-nov/rnaseq/stamps.csv c40 dram
python split-energy-log.py temp/runs-nov/energy_DRAM_log_c42.txt temp/runs-nov/rnaseq/stamps.csv c42 dram
python split-energy-log.py temp/runs-nov/energy_DRAM_log_c44.txt temp/runs-nov/rnaseq/stamps.csv c44 dram
python split-energy-log.py temp/runs-nov/energy_DRAM_log_c45.txt temp/runs-nov/rnaseq/stamps.csv c45 dram

