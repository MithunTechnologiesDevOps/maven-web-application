pipeline {
    agent any

    stages {

        stage('SCM') {
            steps {
                git branch: 'main',
                    credentialsId: 'mvn',
                    url: 'https://github.com/MANISH-GIT-25/maven-web-application.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Image Build') {
            steps {
                sh """
                docker build -t java-repo:${BUILD_TAG} .
                docker tag java-repo:${BUILD_TAG} saipur/pipeline-java:${BUILD_TAG}
                """
            }
        }

        stage('Docker Login & Push') {
            steps {
                withCredentials([string(credentialsId: 'password', variable: 'DOCKER_PASS')]) {
                    sh """
                    echo $DOCKER_PASS | docker login -u saipur --password-stdin
                    docker push saipur/pipeline-java:${BUILD_TAG}
                    """
                }
            }
        }

        stage('Test Website') {
            steps {
                sh 'sleep 20'
                sh 'curl --ipv4 http://localhost:8090'
            }
        }
    }
}
