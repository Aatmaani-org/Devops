pipeline {
  agent any

  stages {
    stage ('Git clone') {
      steps{
        git 'https://github.com/Aatmaani-org/Production.git'
      }
    }
    stage ('Build-Image') {
      steps{
        sh 'docker build -t node-app .'
      }
    }
    stage ('Push image to ECR') {
      steps{
        sh ''' docker tag node-app 883195043912.dkr.ecr.us-west-2.amazonaws.com/nodejs-repository:node-app
        aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 883195043912.dkr.ecr.us-west-2.amazonaws.com
        docker push 883195043912.dkr.ecr.us-west-2.amazonaws.com/nodejs-repository:node-app
        cd
        '''
      }
    }
    stage ('Git Clone') {
      steps{
        git 'https://github.com/Aatmaani-org/Devops.git'
      }
    }
    stage ('Creating pod using Helm') {
      steps{
        sh 'cd helm' 
        sh 'ls'
        sh 'helm install node-dev nodejs-project -n dev -f values-dev.yaml'
       }
    }
  }
}
