pipeline {
    agent none
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'maven:3.5.4'
                    args '-v /root/.m2:/root/.m2'
                }
            }
            steps {
                sh 'docker rmi ruoyi:latest'
                echo 'rm image successfully'
                sh 'mvn -B -DskipTests clean package dockerfile:build'
            }
        }
        stage('docker run'){
            agent any
            steps{
                sh 'docker run -d --name ruoyi -p 8081:80 ruoyi:latest'
            }
        }
    }
}
