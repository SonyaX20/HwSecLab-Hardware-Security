#!/bin/bash

python -m venv SCA
source ./SCA/bin/activate
pip install -r requirements.txt
pip install --upgrade pip