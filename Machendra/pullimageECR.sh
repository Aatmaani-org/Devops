#!/bin/bash
echo "---- Pull the Image to the ECR ----"

docker pull 883195043912.dkr.ecr.us-west-2.amazonaws.com/nodejs-repository-dev:dev-latest

echo "---- Tagging the Image and Push Image to ECR ----"

docker tag 883195043912.dkr.ecr.us-west-2.amazonaws.com/nodejs-repository-dev:dev-latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/nodejs-repository-dev:qa-latest
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/nodejs-repository-dev:qa-latest

commit_id=`aws ecr describe-images --repository-name nodejs-repository-dev --output json | grep -1 dev-latest | awk 'NR==1{print $1}'`

echo "---- Creating the Pods using HELM ----"

cd helm
helm install --set image.tag=$commit_id node-qa marvel -n qa -f values-qa.yaml

