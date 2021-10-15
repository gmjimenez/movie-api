#!/bin/groovy
pipeline {
   agent {
    docker { image 'node:14-alpine' }
  }
  tools {nodejs 'nodejs'}  
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
        script{
          sh 'WORKDIR=$(cd $(dirname $0); pwd)'
          sh 'NAME=base-files-11ubuntu4'
          sh 'sudo docker build -t build_deb ${WORKDIR}'
          sh 'sudo docker run -e NAME=${NAME} -e UGID="${UID}:$(id -u)" -v ${WORKDIR}/out:/deb -it build_deb'
        }
      }
    }    
  }
}