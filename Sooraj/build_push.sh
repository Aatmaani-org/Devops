#!/bin/bash
cd /var/lib/jenkins/workspace/Sooraj/node-app/warnerproduction/Production
docker build -t new-nodejs --build-arg GIT_COMMIT=$(git log -1 --format=%h) .
docker tag new-nodejs:latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs:$(git log -1 --format=%h)
docker tag new-nodejs:latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs:dev-latest
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs:$(git log -1 --format=%h)
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs:dev-latest
a=`aws ecr describe-images --repository-name new-nodejs \
--query 'sort_by(imageDetails,& imagePushedAt)[-1].imageTags[1]' --output text`
echo $a
cd /var/lib/jenkins/workspace/Sooraj/node-app/warnerdevops/Devops/Sooraj/helm
helm upgrade --install --set image.tag=$a warnerbro warnerbros -n dev -f values-dev.yaml
