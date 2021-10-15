pipeline {
  agent any
  tools { nodejs 'nodejs' }
  environment {
        CI = 'true'
  }
  stages {
    stage('Build') {
      steps {
        sh 'sudo apt-get install docker-ce docker-ce-cli containerd.io'
        sh 'npm install'
      }
    }
    //stage('Test') {
    //steps {
    //sh 'npm test'
    //}
    //
    }
  }

