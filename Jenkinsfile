pipeline {
  agent { any { image 'node:12.16.2'} }
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
    stage('Gen .zip') {
      steps {
        sh 'zip -r api-latest.zip movie-api'
      }
    }
    //stage('Test') {
    //steps {
    //sh 'npm test'
    //}
    //
    }
  }

