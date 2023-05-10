pipeline {
    agent any
    tools {
        maven 'maven'
    }
    stages {
        stage('Build maven') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/bymounib/CI-pipeline-using-jenkins']])
                bat 'mvn clean install'
            }
        }
        stage('Build docker image') {
            steps {
                bat 'docker build -t demo .'
            }
        }
        stage('Push image to hub') {
            steps {
                withCredentials([string(credentialsId: 'test', variable: 'test')]) {
                    bat "docker login -u bymounib -p ${test}"
                    bat 'docker tag demo bymounib/demo'
                    bat 'docker push bymounib/demo'
                }
            }
        }
    }
}