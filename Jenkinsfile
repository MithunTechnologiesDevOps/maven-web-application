pipeline
{
    agent any

    tools{
        maven 'Maven_3.9.16'
    }

    environment
    {
        buildNumber = "${BUILD_NUMBER}"
    }

    stages
    {
        stage('Checkout Code')
        {
            steps()
            {
                git branch: 'DevOpsMayBatch', url: 'https://github.com/MithunTechnologiesDevOps/Maven-Web-Application.git'
            }
        }

        stage('Build Project using Maven')
        {
            steps()
            {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image')
        {
            steps()
            {
                sh 'docker build -t 210447604094.dkr.ecr.ap-south-1.amazonaws.com/maven-web-application:${buildNumber} .'
            }
        }

        stage('Push Docker Image to ECR')
        {
            steps()
            {
                sh 'aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 210447604094.dkr.ecr.ap-south-1.amazonaws.com'
                sh 'docker push 210447604094.dkr.ecr.ap-south-1.amazonaws.com/maven-web-application:${buildNumber}'
            }
        }

        stage('Remove Docker Images from Jenkins Locally')
        {
            steps()
            {
                sh 'docker rmi -f 210447604094.dkr.ecr.ap-south-1.amazonaws.com/maven-web-application:${buildNumber}'
            }
        }
    }
}