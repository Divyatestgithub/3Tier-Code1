#!/bin/bash


sudo apt-get install -y python3-pip
sudo apt-get install build-essential libssl-dev libffi-dev python-dev

# creating python virtual enviornment & activating.
pip3 install virtualenv
python3 -m venv /var/wwww/app/venv
source /var/wwww/app/venv/bin/activate

pip install -r /var/wwww/app/requirements.txt

python /var/wwww/app/app.py