pipeline {
   agent {
        docker { image 'node:14-alpine' }
    }
  tools { nodejs 'nodejs' }
  environment {
        CI = 'true'
  }
  stages {
    stage('Build') {
      steps {
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

