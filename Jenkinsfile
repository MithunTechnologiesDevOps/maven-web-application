pipeline {
    agent any
    tools {
    maven 'Maven-3.6.3'
    }
    stages {
        stage("Scm_Checkout") {
            steps {
                git credentialsId: 'github_ID', url: 'https://github.com/Kubernetesjigalooru/maven-web-application.git'
            }
        }
        stage("Build_Artifact") {
            steps {
                sh 'mvn clean package'
	   }
	}
        stage("Build_Image") {
            steps {
                sh 'docker build -t 172.31.11.146:8083/mavenapp:v2 .'
           }
        }
    }
}
