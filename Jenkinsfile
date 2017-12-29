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
    }
}
