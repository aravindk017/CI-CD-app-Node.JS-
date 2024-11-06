pipeline {
    agent any

    environment {
        // Define variables for Docker image name and tag
        IMAGE_NAME = 'node-app'
        IMAGE_TAG = 'latest'
        REGISTRY = 'your_dockerhub_account'
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository to the Jenkins workspace
                git 'https://github.com/yourusername/node-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image using the Dockerfile
                    docker.build("${REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}")
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    // Run tests inside a Docker container
                    docker.image("${REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}").inside {
                        sh 'npm test'
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Log in to Docker Hub (make sure credentials are set up in Jenkins)
                    docker.withRegistry('https://hub.docker.com', 'dockerhub-credentials-id') {
                        // Push the Docker image to the registry
                        docker.image("${REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}").push()
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Example deploy step (could be a Kubernetes, AWS, or Docker Compose deployment)
                    echo 'Deploying application...'
                    // In a real pipeline, this would deploy the image to a server or container orchestration platform
                }
            }
        }
    }

    post {
        always {
            // Cleanup after the pipeline (optional)
            echo 'Cleaning up...'
        }
    }
}
