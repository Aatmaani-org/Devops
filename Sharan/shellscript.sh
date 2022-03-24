#!/bin/bash
echo ------- git clone   Devops---------
sudo  rm -rf *
git clone https://github.com/Aatmaani-org/Devops.git

echo  ----------  git clone  prod  -------
git clone https://github.com/Aatmaani-org/Production.git

cd Production
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 883195043912.dkr.ecr.us-west-2.amazonaws.com
docker build -t new-nodejs .
docker tag new-nodejs:latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs:brocode
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs:brocode

echo -------- helm run ---------
cd  /var/lib/jenkins/workspace/sharan/nodejs-qa/Devops/Sharan

helm upgrade --install sharan-qa nodejs -n sharan-qa -f values-qa.yaml
