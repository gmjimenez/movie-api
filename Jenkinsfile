pipeline {
  agent any
  tools { nodejs 'nodejs' }
  environment {
        CI = 'true'
  }
  stages {
    stage('Build') {
      steps {
        sh ' apt-get install -y docker.io '
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

