pipeline {
    environment {
    registry = "kingsleyijomah/kubernetes:app"
    // appImageTag = "app:${env.BUILD_NUMBER}"
    // appImageTag = ":app"
    registryCredential = 'dockerhub'
  }

  agent any
  
  stages {
    stage('Building and tag image') {
      steps{
        sh 'docker build -t ' + registry .
      }
    }

    stage('Push Images to Registry') {
        steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            sh 'docker push ' + registry
          }
        }
      }
    }

    stage('DeployToProduction') {
        steps {
            input 'Deploy to Production?'
            milestone(1)
            //implement Kubernetes deployment here
        }
    }
  }
}