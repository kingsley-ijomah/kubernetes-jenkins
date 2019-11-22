pipeline {
    environment {
        registry = "kingsleyijomah/kubernetes:app"
        // appImageTag = "app:${env.BUILD_NUMBER}"
        // appImageTag = ":app"
        registryCredential = 'dockerhub_login'
    }

  agent any
  
    stages {
        // stage('Building and tag image') {
        //     steps{
        //         sh 'docker build -t ' + registry + ' .'
        //     }
        // }

        // stage('Push Images to Registry') {
        //     steps{
        //         script {
        //             docker.withRegistry( '', registryCredential ) {
        //                 sh 'docker push ' + registry
        //             }
        //         }
        //     }
        // }

        stage('DeployToProduction') {
            steps {
                //implement Kubernetes deployment here
                kubernetesDeploy(
                    kubeconfigId: 'kubeconfig',
                    configs: 'deployment-kube.yml',
                    enableConfigSubstitution: true
               )
            }
        }
    }
}
