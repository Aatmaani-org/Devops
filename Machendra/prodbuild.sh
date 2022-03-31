#!/bin/bash
echo "---- Pull the Image to the ECR ----"

docker pull 883195043912.dkr.ecr.us-west-2.amazonaws.com/nodejs-repository-dev:qa-latest

echo "---- Tagging the Image and Push Image to ECR ----"

docker tag 883195043912.dkr.ecr.us-west-2.amazonaws.com/nodejs-repository-dev:qa-latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/nodejs-repository-dev:prod-latest
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/nodejs-repository-dev:prod-latest

commit_id=`aws ecr describe-images --repository-name nodejs-repository-dev --output json | grep -1 qa-latest | awk 'NR==3{print $1}' | tr -d '"',`

echo "---- Creating the Pods using HELM ----"

cd helm
helm upgrade --install --set image.tag=$commit_id node-prod marvel -n prod -f values-prod.yaml
