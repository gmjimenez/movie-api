pipeline {
   agent {
    docker { image 'node:14-alpine' }
  }

  
  tools {nodejs "nodejs"}  
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
          sh '#!/bin/bash
set -e
if [[ $UID == 0 ]]; then
    echo "You must not run this as root." 1>&2
    exit 1
fi

if !(type docker >/dev/null); then
    echo "Docker is not installing on this machine." 1>&2
    exit 1
fi

#Click here for the processing to be performed before building the docker container
WORKDIR=$(cd $(dirname $0); pwd)
NAME=base-files-11ubuntu4
#Described so far

#Image name build_deb is rewritten by the deb file to build
#Example: build_base-files
sudo docker build -t build_deb ${WORKDIR}
sudo docker run -e NAME=${NAME} -e UGID="${UID}:$(id -u)" -v ${WORKDIR}/out:/deb -it build_deb'
        }
         
      }
    }  
     
  }
}