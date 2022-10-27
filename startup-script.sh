#!/bin/bash

# [START startup_script]

sudo apt-get update
sudo apt-get install -y python3 python3-pip protobuf-compiler
pip3 install google-cloud-storage grpcio grpcio_tools
pip3 install grpc_tools
python3 -m pip install --user grpcio-tools
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade Pillow
pip3 install flask
pip3 install jsonpickle
<<<<<<< HEAD
sudo rm -rf CSCI5253-Lab6
git clone https://github.com/cara-spencer/DCSC_lab6.git
cd DCSC_lab6/
# [END startup_script]
