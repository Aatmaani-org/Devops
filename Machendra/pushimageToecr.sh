#!/bin/bash
echo "---- Pushing Image to the ECR ----"
ls
docker tag node-app:latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/nodejs-repository-dev:node-app-$(git log -1 --format=%h)
docker tag node-app:latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/nodejs-repository-dev:node-demo
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 883195043912.dkr.ecr.us-west-2.amazonaws.com
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/nodejs-repository-dev:node-app-$(git log -1 --format=%h)
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/nodejs-repository-dev:node-demo
cd
ls
echo "---- Creating pod using Helm ----"
mkdir jenkins
ls
#cd jenkins
#git clone https://github.com/Aatmaani-org/Devops.git

#cd /Devops/Machendra/helm/
#helm upgrade --install --set image.tag=node-app-$(git log -1 --format=%h) node-dev marvel -n dev -f values-dev.yaml
#helm upgrade --install node-qa marvel -n qa -f values-qa.yaml
