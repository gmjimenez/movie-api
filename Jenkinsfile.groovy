#!/usr/bin/env groovy

pipeline {
  agent any
    
  tools {nodejs "node"}
    
  stages {
        
    stage('Git') {
      steps {
        git 'https://github.com/gmjimenez/movie-api.git'
      }
    }
     
    stage('Build') {
      steps {
        sh 'npm install'
         sh 'node server'
      }
    }  
    
            
    stage('Test') {
      steps {
        sh 'node test'
      }
    }
  }
}