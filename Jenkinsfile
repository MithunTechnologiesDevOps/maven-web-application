pipeline
{
    agent any

    tools
    {
        maven 'Maven_3.9.7'
    }
    
    environment
    {
        buildNumber = "${BUILD_NUMBER}"
    }

    stages
    {
        stage('Git Checkout')
        {
            steps()
            {
                git branch: 'DevOpsJulyBatch', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
            }
        }

        stage('Build Project')
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
                sh 'docker build -t mithuntechnologies/dockerpipeline:${buildNumber} .'
            }
        }

        stage('Push Docker Image to DockerHub Registry')
        {
            steps()
            {
                withCredentials([string(credentialsId: 'Docker_Hub_Password', variable: 'Docker_Hub_Password')])
                {
                    sh 'docker login -u mithuntechnologies -p ${Docker_Hub_Password}'
                }
                sh 'docker push mithuntechnologies/dockerpipeline:${buildNumber}'
            }
        }

        stage('Delete Docker Image Locally in Jenkins Build Server')
        {
            steps()
            {
                sh 'docker rmi -f mithuntechnologies/dockerpipeline:${buildNumber}'
            }
        }

        //Deleting Image Locally to Utilise Resources

        stage('Deploy Application to Docker Deployment Server')
        {
            steps()
            {
                sshagent(['DeploymentServer_SSH'])
                {
                    sh "ssh -o StrictHostKeyChecking=no ubuntu@65.0.6.89 docker rm -f mavenwebapplication || true"
                    sh "ssh -o StrictHostKeyChecking=no ubuntu@65.0.6.89 docker run -d --name mavenwebapplication -p 8080:8080 mithuntechnologies/dockerpipeline:${buildNumber}"
                }
            }
        }
    }
}