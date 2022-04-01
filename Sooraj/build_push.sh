#!/bin/bash
echo "------Building the Image------"

cd /var/lib/jenkins/workspace/Sooraj/Node-app-dev/warnerproduction/Production

docker build -t new-nodejs --build-arg GIT_COMMIT=$(git log -1 --format=%h) .

echo "------Tagging the image with commit_id and dev_latest------"

docker tag new-nodejs:latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs:$(git log -1 --format=%h)
docker tag new-nodejs:latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs:dev-latest

echo "------Pushing the image to ECR------"

docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs:$(git log -1 --format=%h)
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs:dev-latest

echo "------Taking the commit_id of dev_latest image and using that image in helm"

commit_id=`aws ecr describe-images --repository-name new-nodejs | grep -1 dev-latest | awk 'NR==3{print $1}' | tr -d '"',`

cd /var/lib/jenkins/workspace/Sooraj/node-app/warnerdevops/Devops/Sooraj/helm

helm upgrade --install --set image.tag=$commit_id warnerbro warnerbros -n dev -f values-dev.yaml

kubectl rollout status deployment warnerbro-warnerbros -n dev


