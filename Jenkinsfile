pipeline {
  agent {dockerfile true}
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
    /*stage('Gen .deb') {
      steps {
        sh 'docker build -t build_deb'
        sh 'mkdir buildf'
        sh 'docker run -e NAME=movie-api -e UGID="65587" -v buildf/out:/deb -it build_deb'
      }
    }*/
    //stage('Test') {
    //steps {
    //sh 'npm test'
    //}
    //
    }
    post {
        always {
      archiveArtifacts artifacts: 'build_deb', onlyIfSuccessful: true
        }
    }
  }

