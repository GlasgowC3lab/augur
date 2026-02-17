#!/bin/bash

# install java, nextflow
sudo apt-add-repository multiverse
sudo apt-add-repository restricted
sudo apt install zip
sudo apt install unzip
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh" 
sdk version
sdk install java 17.0.6-tem 
curl -s https://get.nextflow.io | bash    
export PATH="$HOME:$PATH"
chmod +x nextflow
nextflow self-update

# install python if not already present with miniconda
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh
export PATH="$HOME/miniconda3/bin:$PATH"  # add conda to path

# install docker using convenience script (root permissions)
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh 
dockerd-rootless-setuptool.sh install  # rootless version

# gsutil
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz
tar -xf google-cloud-cli-linux-x86_64.tar.gz
./google-cloud-sdk/install.sh
gcloud auth init 

conda create -n use_py python=3.12
conda activate use_py
python -m pip install scipy==1.13.0 

# adjust for energy monitoring
sudo sysctl -w kernel.perf_event_paranoid=0  # allow perf

sudo apt install linux-tools-common  # check for turbostat, perf, cpupower (?)
sudo apt install build-essential  # make, other stuff needed to use turbostress

# install packages for benchmarking
sudo apt-get install stress-ng
sudo apt-get install turbostat
sudo apt-get install sysbench
sudo apt-get install fio
sudo apt-get install p7zip-full
sudo snap install go --channel=1.15/stable --classic

git clone https://github.com/teads/turbostress.git
cd turbostress
go build cmd/main.go
chown +x main
cd ../

python -m pip install wfcommons 

mkdir raw/ 
