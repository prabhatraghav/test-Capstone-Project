pipeline {
    agent any
    tools {
        nodejs 'nodejs'
    }
    stages {
        stage('checkout') {
            steps {
                git url:'https://github.com/prabhatraghav/test-Capstone-Project/', branch: "Dev"
            }
        }
        stage('Build') {
            steps {
                sh 'npm install'
                // sh 'npm run build'
            }
        }
        stage('Test') {
            steps {
                // sh 'npm run test'
                echo "Test"
            }
        }
        stage('Build Image') {
            steps {
                sh 'docker build -t reactimage .'
                sh 'docker tag reactimage:latest techomaniac83/reactimgapp:latest'
            }
        }
        stage('Docker login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub_cred', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                    sh "echo $PASS | docker login -u $USER --password-stdin"
                    sh 'docker push techomaniac83/reactimgapp:latest'
                }
            }
        }
        stage('Deploy') {
            steps {
                    sh 'docker run -itd --name insura -p 8089:9095 techomaniac83/reactimgapp:latest'
                }
            }
       // stage('Deploy') {
           // steps {
              //  script {
                  // def dockerCmd = 'docker run -itd --name My-first-container -p 80:5000 techomaniac83/dev:latest'
                    //sshagent(['sshkeypair']) {
                      //  sh "ssh -o StrictHostKeyChecking=no ubuntu@51.20.192.244 ${dockerCmd}"
                    //}
                //}
            //}
        //}
    }
}
