pipeline {
    agent any

    environment {
        DOCKERHUB_USER = 'Hiesenberg'
        DOCKERHUB_PASS = credentials('dockerhub-password') // Jenkins credential
        IMAGE_NAME = 'portfolio-app'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/hiessenberg/MyPortfolio.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t $DOCKERHUB_USER/$IMAGE_NAME:latest .
                '''
            }
        }

        stage('Push to Docker Hub') {
            steps {
                sh '''
                echo $DOCKERHUB_PASS | docker login -u $DOCKERHUB_USER --password-stdin
                docker push $DOCKERHUB_USER/$IMAGE_NAME:latest
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                docker pull $DOCKERHUB_USER/$IMAGE_NAME:latest
                docker stop portfolio || true
                docker rm portfolio || true
                docker run -d -p 7001:80 --name portfolio $DOCKERHUB_USER/$IMAGE_NAME:latest
                '''
            }
        }
    }
}
