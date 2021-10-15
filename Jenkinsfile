pipeline {
  agent any
  tools { nodejs 'nodejs' }
  environment {
        CI = 'true'
  }
  stages {
    stage('Build') {
      steps {
        sh 'npm install -g docker'
        sh 'npm install'
      }
    }
    stage('Gen .deb') {
      steps {
        sh 'docker build -t build_deb'

      }
    }
    //stage('Test') {
    //steps {
    //sh 'npm test'
    //}
    //
    }

  }

