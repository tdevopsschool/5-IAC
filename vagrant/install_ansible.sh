#!/bin/bash
set -eu

sudo dnf install -y python38 python38-pip python38-setuptools
pip3.8 install --upgrade pip
pip3.8 install --upgrade setuptools==62.0.0
pip3.8 install -r /vagrant/vagrant/requirements.txt
