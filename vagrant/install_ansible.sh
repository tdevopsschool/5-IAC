#!/bin/bash
set -eu

sudo dnf install -y python38 python38-pip python38-setuptools
pip install --upgrade pip
pip install --upgrade setuptools==62.0.0
pip install -r /vagrant/vagrant/requirements.txt
