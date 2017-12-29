pipeline {
    agent {
        docker {
            image 'maven:alpine'
        }
    }
    environment {
        CI = 'true'
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn package'
            }
        }
        stage('Test'){
            steps{
                sh 'mvn test'
            }
        }
    }
}
