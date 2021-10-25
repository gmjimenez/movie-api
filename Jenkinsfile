pipeline {
  agent {
    label 'master'
  }
  tools {
    nodejs 'nodejs'
    dockerTool 'docker'
  }
  environment {
        CI = 'true'
  }
  stages {
    stage('tree') {
      steps {
        sh 'tree'
        sh 'pwd'
      }
    }
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
  /*   stage('Gen .deb') {
      steps {
        sh 'docker build -t movie-api:latest .'
        
      }
    } */
    stage('push artifact') {
      steps {
        sh 'chmod +x deb.sh'
        sh './deb.sh'
        dir('/var/lib/jenkins/workspace/') {
          sh 'pwd'
          sh 'mkdir api-artifacts'
          sh 'ls'
          sh 'cp movie-api.deb api-artifacts/'
        }

        dir('/var/lib/jenkins/workspace/api-artifacts') {
          sh 'echo "# api-artifacts" >> README.md'
          sh'git init'
          sh'git add README.md'
          sh'git commit -m "first commit"'
          sh'git branch -M main'
          sh'git remote add origin https://github.com/gmjimenez/api-artifacts.git'
          sh'git push -u origin main'
        }
      }
    }
    //stage('Test') {
    //steps {
    //sh 'npm test'
    //}
    //
    }
  }

