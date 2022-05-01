def notifyBuild(String buildStatus = 'STARTED') {
  // build status of null means successful
  buildStatus =  buildStatus ?: 'SUCCESS'

  // Default values
  def colorName = 'RED'
  def colorCode = '#FF0000'
  def subject = "${buildStatus}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'"
  def summary = "${subject} (${env.BUILD_URL})"

  // Override default values based on build status
  if (buildStatus == 'STARTED') {
    color = 'YELLOW'
    colorCode = '#FFFF00'
  } else if (buildStatus == 'SUCCESS') {
    color = 'GREEN'
    colorCode = '#00FF00'
  } else {
    color = 'RED'
    colorCode = '#FF0000'
  }

  // Send notifications
  slackSend (color: colorCode, message: summary)
}

pipeline{
    
    agent any
    
    tools {
  maven 'Maven3.8.5'
}
options {
    timestamps()
  }
    
    stages{
        
        stage('CheckOutCode'){
            steps{
                git branch: 'development', credentialsId: '1bf7e1d8-c4f1-4c82-a915-c1c2523ecf5f', url: 'https://github.com/Manikantamarreddi/maven-web-application.git'
            }
        }
        stage('BuildPackage'){
            steps{
			     notifyBuild('STARTED')
                sh "mvn clean package"
            }
        }
        stage('SonarQubeReport'){
            steps{
                sh "mvn sonar:sonar"
            }
        }
        stage('UploadArtifactRepo'){
            steps{
                sh "mvn deploy"
            }
        }
        stage('DeployToTomcat'){
            steps{
                sshagent(['b181401b-82df-4004-888e-6927a60b9289']) {
            sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@3.111.213.53:/opt/apache-tomcat-9.0.62/webapps/"
            }
        }
        }
    }
	
	post {
  always {
    // One or more steps need to be included within each condition's block.
	 notifyBuild(currentBuild.result)
  }
  success {
   notifyBuild(currentBuild.result)
  }
  failure {
    // One or more steps need to be included within each condition's block.
	 notifyBuild(currentBuild.result)
  }
}

}
