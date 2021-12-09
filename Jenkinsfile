def dockerContainerName = "api-book-prepod"
def dockerImageTag = "${dockerContainerName}:latest"
pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
                sh 'echo "this is the clone stage"'
                checkout scm
            }
        }
        stage('Build') {
            steps {
                sh 'chmod u+x mvnw'
                sh './mvnw clean package -DskipTests'
            }
        }
        stage('Test') {
            steps {
                sh './mvnw test'
            }
        }
        stage('Image Build') {
            steps {
                script {
                    def bookApiImage = docker.build("${dockerImageTag}")
                }
            }
        }
        stage ('Secrete') {
        environment {
            MAR1_SECRETS = credentials('mar1-preprod-secret')
        }
        steps {
            echo 'pass ${MAR1_SECRETS_USR}'
            echo 'pass ${MAR1_SECRETS_PSW}'
            }
        }
        stage('run the application') {
            steps {
                sh ("chmod u+x deploy.sh")
                sh ("./deploy.sh ${dockerContainerName} ${dockerImageTag} 9012")
            }
        }
    }
}
