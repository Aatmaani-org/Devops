#!/bin/bash
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 883195043912.dkr.ecr.us-west-2.amazonaws.com
echo ----- pull image ---------
docker pull 883195043912.dkr.ecr.us-west-2.amazonaws.com/node-js:dev-latest
echo -------  tag and push ----------
docker tag 883195043912.dkr.ecr.us-west-2.amazonaws.com/node-js:dev-latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/node-js:qa-latest
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/node-js:qa-latest
latest_id=`aws ecr describe-images --repository-name node-js | grep -2 qa-latest |awk 'NR==1{print $1}'| tr -d '"',`
echo $latest_id
echo ---------- helm run ------------
helm upgrade --install --set image.tag=$latest_id nodejss nodejs -n qa -f values-qa.yaml
#helm upgrade --install --set image.tag=$git_commit nodejss nodejs -n
#################
