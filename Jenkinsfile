pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/prabhatraghav/test-Capstone-Project/', branch: "master"
            }
        }
        stage('Build') {
            steps {
                sh "mvn clean package"
            }
        }
        stage('Build Image') {
            steps {
                sh 'docker build -t insuraimg .'
                sh 'docker tag insuraimg:latest techomaniac83/insuraimgaddbook:latest'
            }
        }

        stage('Docker login and push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub_cred', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                    sh "echo \$PASS | docker login -u \$USER --password-stdin"
                    sh 'docker push techomaniac83/insuraimgaddbook:latest'
                }
            }
        }
        stage('Deploy') {
            steps {
                    sh 'docker run -itd --name insura -p 8089:8081 techomaniac83/insuraimgaddbook:latest'
                }
            }
    }
        post {
            success {
                echo 'Pipeline successfully executed!'
            }
            failure {
                echo 'Pipeline failed!'
            }
        }
}
