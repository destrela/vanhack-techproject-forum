pipeline {
    agent any
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'maven:alpine'
                    args '-v /root/.m2:/root/.m2 -v /Work/daniel:/home'
                }
            }
            environment {
                CI = 'true'
            }
            steps {
                sh '(cd /home/sandbox/vanhack-techproject-forum; mvn package)'
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
                    args '-v build.dev:/build.dev -v build:/build -p 8081:8080'
                }
            }
            when {
                branch 'development'
            }
            steps{
                sh 'cp /home/sandbox/vanhack-techproject-forum/target/*.war /usr/local/tomcat/webapps'
                sh '/usr/local/tomcat/bin/startup.sh'
                input message: 'Should I have to proceed with production deploy?'
            }
        }
    }
}

