pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t myportfolio-app:latest .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d --name portfolio -p 8081:80 myportfolio-app:latest'
            }
        }
    }
}
