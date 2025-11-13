pipeline
{
    agent any

    tools
    {
        maven 'Maven_3.9.7'
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
    }
}