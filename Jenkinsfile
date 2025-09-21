pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                bat 'docker build -t myportfolio-app:latest .'
            }
        }

        stage('Run Container') {
            steps {
                bat 'docker run -d --name portfolio -p 8081:80 myportfolio-app:latest'
            }
        }
    }
}
