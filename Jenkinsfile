pipeline {
    agent {
        docker {
            image 'maven:alpine'
            additionalBuildArgs '-v /root/.m2:/root/.m2'
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

