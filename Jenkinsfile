pipeline {
  agent any

   environment {
        CI = 'true' 
    }
  tools {nodejs "nodejs"}  

  
  stages {
        
     
    stage('Build') {
      steps {
        sh 'npm install'
         
      }
    }  
    
            
    stage('Test') {
      steps {
        sh 'npm test'
      }
    }
     stage('Example') {
            steps { 
                echo 'Hello World'
            }
        }
  }
}