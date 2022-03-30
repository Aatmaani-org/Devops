#!/bin/bash
cd /var/lib/jenkins/workspace/Sooraj/node-app/warnerproduction/Production
docker build -t new-nodejs --build-arg GIT_COMMIT=$(git log -1 --format=%h) .
docker tag new-nodejs:latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs:$(git log -1 --format=%h)
docker tag new-nodejs:latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs:dev-latest
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs:$(git log -1 --format=%h)
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs:dev-latest
commit_id=`aws ecr describe-images --repository-name new-nodejs | grep -2 dev-latest | awk 'NR==1{print $1}' | tr -d '"',`
cd /var/lib/jenkins/workspace/Sooraj/node-app/warnerdevops/Devops/Sooraj/helm
helm upgrade --install --set image.tag=$commit_id warnerbro warnerbros -n dev -f values-dev.yaml

