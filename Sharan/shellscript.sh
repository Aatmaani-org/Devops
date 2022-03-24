#!/bin/bash
echo git clone
sudo  rm -rf *
git clone https://github.com/Aatmaani-org/Devops.git

echo helm run
cd /Devops/Sharan
helm upgrade --install sharan-qa nodejs -n sharan-qa -f values-qa.yaml
