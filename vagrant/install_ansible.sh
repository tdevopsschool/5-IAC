#!/bin/bash
set -eu

sudo dnf install -y python38 python38-pip python38-setuptools
sudo -u vagrant pip3.8 install --user --upgrade pip
sudo -u vagrant pip3.8 install --user --upgrade setuptools==62.0.0
sudo -u vagrant pip3.8 install --user -r /vagrant/vagrant/requirements.txt
