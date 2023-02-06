pipeline {
    agent any
    tools{
        maven 'maven'
    }

    stages {
        stage('Build Maven') {
            steps {
                echo 'Build Maven started'
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/pkonda01/simple-java-maven-app']])
                sh 'mvn clean install'
                
            }
        }
    
       stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t pkonda01/devops-integration .'
                }
            }
        }
        
        stage('Push image to Hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u pkonda01 -p ${dockerhubpwd}'
                    }
                    sh 'docker push pkonda01/devops-integration'
                }
            }
        }
        stage('Pull image and run container'){
            steps{
                script{
                    sh 'docker run -idt -p 8001:80 pkonda01/devops-integration'
                }
            }
        }
}

}
