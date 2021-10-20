pipeline {
  agent any
  tools {
    nodejs 'nodejs'
  }
  environment {
        CI = 'true'
  }
  stages {
    stage('Build') {
      steps {
        sh 'npm install'
      }
    }
    stage('Install docker') {
      steps {
        sh 'sudo apt update'
        sh 'sudo apt-get install apt-transport-https ca-certificates curl software-properties-common'
        sh 'curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -'
        sh 'sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable"'
        sh 'sudo apt update'
        sh 'sudo apt-get install docker-ce'
        sh 'docker --version'
      }
    }
    stage('Gen .deb') {
      steps {
        sh 'docker build -t build_deb'
        sh 'mkdir buildf'
        sh 'docker run -e NAME=movie-api -e UGID="65587" -v buildf/out:/deb -it build_deb'
      }
    }
    //stage('Test') {
    //steps {
    //sh 'npm test'
    //}
    //
    }
  }

