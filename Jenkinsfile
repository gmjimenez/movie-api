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
    stage('Gen .deb') {
      steps {
        sh 'docker build -t movie-api:latest .'

      //sudo docker run -e NAME=${NAME} -e UGID="${UID}:$(id -u)" -v ${WORKDIR}/out:/deb -it build_deb
      //-e set environment variables
      //-v Bind mount a volume
      //-u Username or UID (format: <name|uid>[:<group|gid>])
      //-it instructs Docker to allocate a pseudo-TTY connected to the container’s stdin; creating an interactive bash shell in the container
      }
    }
    stage('push artifact') {
      steps {
        sh 'cd /var/lib/jenkins/workspace/'
        sh 'mkdir api-artifacts'
        sh 'cp movie-api.deb api-artifacts/'
        sh 'cd api-artifacts/'
        sh 'echo "# api-artifacts" >> README.md'
        sh'git init'
        sh'git add README.md'  
        sh'git commit -m "first commit"'
        sh'git branch -M main'
        sh'git remote add origin https://github.com/gmjimenez/api-artifacts.git'
        sh'git push -u origin main'

      //sudo docker run -e NAME=${NAME} -e UGID="${UID}:$(id -u)" -v ${WORKDIR}/out:/deb -it build_deb
      //-e set environment variables
      //-v Bind mount a volume
      //-u Username or UID (format: <name|uid>[:<group|gid>])
      //-it instructs Docker to allocate a pseudo-TTY connected to the container’s stdin; creating an interactive bash shell in the container
      }
    }
    //stage('Test') {
    //steps {
    //sh 'npm test'
    //}
    //
    }
  }

