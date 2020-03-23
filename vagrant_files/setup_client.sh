#!/usr/bin/env bash
# shellcheck disable=SC1068
HOMEDIR = "/home/vagrant/DASH-setup"


# Put here the IP of the interface connected to the shaping/netem host.
TEST_IF_IP="192.167.100.11"

TEST_ETH=$( ifconfig | sed -n "/addr:$TEST_IF_IP/{g;H;p};H;x" | awk '{print $1}' )

ip route add 192.167.101.0/24 via 192.167.100.12 dev $TEST_ETH

sudo apt update

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install -y google-chrome-stable

curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt install -y nodejs

cd DASH-setup
npm install

sudo apt-get install -y xauth