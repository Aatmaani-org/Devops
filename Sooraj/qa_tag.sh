#!/bin/bash

echo "------Storing the commit_id of image with dev-latest tag in a variable------"

commit_id=`aws ecr describe-images --repository-name new-nodejs | grep -2 dev-latest | awk 'NR==1{print $1}' | tr -d '"',`
image="883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs"

echo "------Pulling the image having dev-latest tags using its commit_id------"

docker pull $image:$commit_id

echo "------Tagging the image with qa-latest tag and pushing it to ECR------"

docker tag  $image:$commit_id $image:qa-latest
docker push $image:qa-latest
cd /var/lib/jenkins/workspace/Sooraj/node-app/warnerdevops/Devops/Sooraj/helm

echo "------Using the commit_id tag of the image in helm which qa-deployment having qa-latest tag------

helm upgrade --install --set image.tag=$commit_id warnerbro warnerbros -n qa -f values-qa.yaml
