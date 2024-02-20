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
                sh 'docker build -t testcapstoneimg .'
                sh 'docker tag testcapstoneimg:latest techomaniac83/testcapstoneimgaddbook:latest'
            }
        }

        stage('Docker login and push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub_cred', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                    sh "echo \$PASS | docker login -u \$USER --password-stdin"
                    sh 'docker push techomaniac83/testcapstoneimgaddbook:latest'
                }
            }
        }
        stage('Deploy') {
            steps {
                    sh 'docker run -itd --name insura -p 9090:80 techomaniac83/testcapstoneimgaddbook:latest'
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
