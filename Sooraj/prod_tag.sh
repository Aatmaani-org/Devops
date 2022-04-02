#!/bin/bash
commit_id=`aws ecr describe-images --repository-name new-nodejs | grep -3 qa-latest | awk 'NR==2{print $1}' | tr -d '"',`
image="883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs"

echo "------Pulling the image using commit_id having the qa_latest tag------"
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 883195043912.dkr.ecr.us-west-2.amazonaws.com
docker pull $image:$commit_id

echo "------Tagging the image with prod-latest and pushing it to ECR------"

docker tag  $image:$commit_id $image:prod-latest
docker push $image:prod-latest
cd /var/lib/jenkins/workspace/Sooraj/node-app/warnerdevops/Devops/Sooraj/helm

echo "------Deploying the image having prod-latest tag using its commit-id as a tag in helm------"

helm upgrade --install --set image.tag=$commit_id warnerbro warnerbros -n prod -f values-prod.yaml
