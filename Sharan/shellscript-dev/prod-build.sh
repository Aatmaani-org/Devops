#!/bin/bash
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 883195043912.dkr.ecr.us-west-2.amazonaws.com
echo ----- pull image ---------
docker pull 883195043912.dkr.ecr.us-west-2.amazonaws.com/node-js:qa-latest
echo -------  tag and push ----------
docker tag 883195043912.dkr.ecr.us-west-2.amazonaws.com/node-js:qa-latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/node-js:prod-latest
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/node-js:prod-latest
latest_id=`aws ecr describe-images --repository-name node-js | grep -2 qa-latest |awk 'NR==4{print $1}'| tr -d '"',`
echo $latest_id
echo ---------- helm run ------------
cd  /var/lib/jenkins/workspace/sharan/prod-depl/Devops/Sharan
#helm upgrade --install --atmoic --timeout 20s --set image.tag=$latest_id nodejss nodejs -n prod -f values-prod.yaml
helm upgrade --install --atomic --timeout 40s --set image.tag=$latest_id nodejss nodejs  -n prod -f values-prod.yaml
#helm upgrade --install --atomic --timeout 20s --set image.tag=$latest_id nodejs
