#!/bin/bash
echo git clone
sudo  rm -rf *
git clone https://github.com/Aatmaani-org/Devops.git
pwd
echo helm run
cd  /var/lib/jenkins/workspace/sharan/nodejs-qa/Devops/Sharan
helm upgrade --install sharan-qa nodejs -n sharan-qa -f values-qa.yaml
