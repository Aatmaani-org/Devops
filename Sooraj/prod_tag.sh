#!/bin/bash
commit_id=`aws ecr describe-images --repository-name new-nodejs | grep -2 qa-latest | awk 'NR==1{print $1}' | tr -d '"',`
image="883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs"
docker pull $image:$commit_id
docker tag  $image:$commit_id $image:prod-latest
docker push $image:prod-latest
cd /var/lib/jenkins/workspace/Sooraj/node-app/warnerdevops/Devops/Sooraj/helm
helm upgrade --install --set image.tag=$commit_id warnerbro warnerbros -n qa -f values-prod.yaml
