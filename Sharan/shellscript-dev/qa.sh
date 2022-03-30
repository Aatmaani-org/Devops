#!/bin/bash
echo ----- pull image ---------
docker pull 883195043912.dkr.ecr.us-west-2.amazonaws.com/node-js:dev-latest

echo -------  tag and push ----------
docker tag 883195043912.dkr.ecr.us-west-2.amazonaws.com/node-js:dev-latest 883195043912.dkr.ecr.us-west-2.amazonaws.com/node-js:qa-latest
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/node-js:qa-latest


echo ---------- helm run ------------
helm upgrade --install --set image.tag=dev-latest gost nodejs -n qa -f values-qa.yaml

