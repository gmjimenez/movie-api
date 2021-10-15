pipeline {
  agent any
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
    //}
    stage('Artifact') {
      steps {
          sh 'sudo docker build -t build_deb ${$(cd $(dirname $0); pwd)}'
          sh 'sudo docker run'
      }
    }
  }
}
