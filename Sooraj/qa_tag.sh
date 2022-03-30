#!/bin/bash
a=`aws ecr describe-images --repository-name new-nodejs \
--query 'sort_by(imageDetails,& imagePushedAt)[-1].imageTags[1]' --output text`
echo $a
image="883195043912.dkr.ecr.us-west-2.amazonaws.com/new-nodejs"
docker pull $image:$a
docker tag  $image:$a $image:qa-latest
docker push $image:qa-latest
cd /var/lib/jenkins/workspace/Sooraj/node-app/warnerdevops/Devops/Sooraj/helm
helm upgrade --install --set image.tag=$a warnerbro warnerbros -n qa -f values-dev.yaml
