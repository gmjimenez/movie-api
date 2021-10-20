pipeline {
  agent {
    docker {
      image 'node:12.16.2'
    }
  }
  tools {
    nodejs 'nodejs'
    'org.jenkinsci.plugins.docker.commons.tools.DockerTool' '18.09'
  }
  environment {
        CI = 'true'
  }
  stages {
    stage('Install docker') {
      steps {
        sh 'docker version'
      }
    }

    stage('Build') {
      steps {
        sh 'npm install'
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

