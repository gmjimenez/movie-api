pipeline {
  agent any
  tools {
    nodejs 'nodejs'
    dockerTool 'docker'
  }
  environment {
        CI = 'true'
  }
  stages {
    stage('Install docker') {
      steps {
        sh 'docker --version'
      }
    }

    stage('Build') {
      steps {
        sh 'npm install'
      }
    }
    stage('Gen .deb') {
      steps {
        
        sh 'docker build -t movie-api:latest'
      }
    }
    //stage('Test') {
    //steps {
    //sh 'npm test'
    //}
    //
    }
  }

