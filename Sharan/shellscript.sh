#!/bin/bash
echo git clone
git clone https://github.com/Aatmaani-org/Devops.git

echo helm run
cd Sharan
helm install sharan-qa nodejs -n sharan-qa -f values-qa.yaml
