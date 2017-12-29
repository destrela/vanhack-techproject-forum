pipeline {
    agent any
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'maven:alpine'
                    args '-v /root/.m2:/root/.m2 -v /Work/daniel:/home -w /home/sandbox/vanhack-techproject-forum'
                }
            }
            environment {
                CI = 'true'
            }
            steps {
                sh 'mvn package'
            }
        }
 /*       stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
*/
        stage('Staging') {
            agent {
                docker {
                    image 'tomcat:alpine'
                    args '-v build.dev:/build.dev -v build:/build'
                }
            }
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

