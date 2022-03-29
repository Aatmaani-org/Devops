#!/bin/bash
echo ----- pull image ---------
docker pull 883195043912.dkr.ecr.us-west-2.amazonaws.com/node-js:dev-latest

echo -------  tag and push ----------
docker tag node-js:qa-latest  883195043912.dkr.ecr.us-west-2.amazonaws.com/node-js:qa-latest
docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/node-js:qa-latest


echo ---------- helm run ------------
helm upgrade --install sharan-qa nodejs -n sharan-qa -f values-qa.yaml

