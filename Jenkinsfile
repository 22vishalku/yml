pipeline {
    agent any

    environment {
        REGISTRY = 'ghcr.io'
        IMAGE_NAME = 'asgfoodbyte'
        REPO_OWNER = 'vishalkumar'  // Change this to your GitHub username if different
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Login to GitHub Container Registry') {
            steps {
                withCredentials([string(credentialsId: 'ghcr-token', variable: 'GHCR_TOKEN')]) {
                    sh '''
                        echo $GHCR_TOKEN | docker login $REGISTRY -u $REPO_OWNER --password-stdin
                    '''
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $REGISTRY/$REPO_OWNER/$IMAGE_NAME:latest .'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push $REGISTRY/$REPO_OWNER/$IMAGE_NAME:latest'
            }
        }
    }
}
