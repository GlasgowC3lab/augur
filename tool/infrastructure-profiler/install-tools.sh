#!/bin/bash

# assumes git, python and 7z are already installed

sudo apt-get install stress-ng
sudo apt-get install turbostat
sudo apt-get install sysbench
sudo apt-get install fio
sudo snap install go --channel=1.15/stable --classic

python -m pip install wfcommons 

git clone https://github.com/teads/turbostress.git
cd turbostress
go build cmd/main.go
chown +x main
cd ../

mkdir raw/ 
