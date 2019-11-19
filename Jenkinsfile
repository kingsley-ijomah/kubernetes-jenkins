pipeline {
    agent {
        label 'docker'
    }

    environment {
        DOCKER_IMAGE_NAME = "kingsleyijomah/kubernetes"
    }
    stages {
        stage('Docker node test') {
            agent {
                docker {
                    // Set both label and image
                    label 'docker'
                    image 'node:7-alpine'
                    args '--name docker-node' // list any args
                }
            }
          steps {
                // Steps run in node:7-alpine docker container on docker slave
                sh 'node --version'
          }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    app = docker.build(DOCKER_IMAGE_NAME)
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker_hub_login') {
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
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