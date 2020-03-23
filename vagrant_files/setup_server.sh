#!/usr/bin/env bash

# Put here the IP of the interfaces connected to the server and client
TEST_IF_IP="192.167.101.13"

TEST_ETH=$( ifconfig | sed -n "/addr:$TEST_IF_IP/{g;H;p};H;x" | awk '{print $1}' ) 

ip route add 192.167.100.0/24 via 192.167.101.12 dev $TEST_ETH

sudo apt update

curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt install -y nodejs
cd /home/vagrant/DASHStreamExample

npm install
npm start 


