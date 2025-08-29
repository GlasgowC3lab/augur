#!/bin/bash

## MANUAL USER SETUP
## must have go, git

## clone turbostress and cd into dir
# git clone https://github.com/teads/turbostress.git
# cd turbostress
# go build cmd/main.go
# chown +x main

## setup and adjust for governor and min + max frequency
# sudo cpupower frequency-set -g ondemand
# sudo cpupower frequency-set -c all -d 1400MHz
# sudo cpupower frequency-set -c all -u 2400MHz

prefix=$1

mkdir output

## generate ts reports for ondemand governor
sudo ./main --load-step 10 | tee $prefix-ts-1.csv
sudo ./main --load-step 10 | tee $prefix-ts-2.csv
sudo ./main --load-step 10 | tee $prefix-ts-3.csv


for source_file in $prefix-ts-1 $prefix-ts-2.csv $prefix-ts-3.csv
do
  tail -n 15 ./$source_file >> ./output/$source_file
done

# 25 is for load step of 5, if this is set to 10, it should then be 15
