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
                    args '-v build.dev:/build.dev -p 8081:8080'
                }
            }
            when {
                branch 'development'
            }
            steps{
                sh 'cp /home/sandbox/vanhack-techproject-forum/target/*.war /usr/local/tomcat/webapps'
                sh '/usr/local/tomcat/bin/startup.sh'
                input message: 'Should I have proceed with the web site shutdown?'
            }
        }
        stage('Deploy') {
            when {
                branch 'master'
            }
            steps{
//               sh 'cp /home/sandbox/vanhack-techproject-forum/target/*.war /build'
                sh 'docker exec vanhack-forum cp /build/forum-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps'
            }
        }
    }
}

