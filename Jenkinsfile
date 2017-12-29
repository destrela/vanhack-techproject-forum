pipeline {
    agent {
        docker {
            image 'maven:alpine'
            args '-v /root/.m2:/root/.m2'
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
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
    }

    agent {
        docker {
            image 'tomcat:alpine'
            args '-v build.dev:/build.dev -v build:/build'
        }
    }
    stages{
        stage('Staging') {
            when {
                branch 'development'
            }
            steps{
                sh 'cp /home/sandbox/vanhack-techproject-forum/target/*.war /usr/local/tomcat/webapps'
                input message: 'Should I have to proceed with production deploy?'
            }
        }
    }
}

