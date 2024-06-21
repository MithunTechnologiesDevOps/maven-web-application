pipeline{

agent any

tools{
maven 'maven3.9.6'
}

echo "The Job name is: ${env.JOB_NAME}"
echo "The Nod ename is: ${env.NODE_NAME}"
echo "The Build Number is: ${env.BUILD_NUMBER}"
echo "The Jenkins Home directory is: ${JENKINS_HOME}"


//Checkout code
stages{
 stage('CheckOuteCode'){
 steps{
    sendSlackNotifications("STARTED")
 git branch: 'development', credentialsId: 'f4d44680-6f7c-4889-b836-5ce7015057f8', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
 }
 }
 //Build
 stage('Build'){
 steps{
 sh "mvn clean package"
 }
 }
  /*
 //Execute SonarQube Report
 stage('ExecuteSonarQubeReport'){
 steps{
 sh "mvn clean sonar:sonar"
 }
 }
 
 // Upload Artifcats into Nexus
 stage('UploadArtifcatsIntoNexus'){
 steps{
 sh "mvn clean deploy"
 }
 }

//Deploy App into Tomcat Server
stage('DeployAppIntoTomcat'){
 steps{
  sshagent(['ea56a0ef-94e7-43c1-99e3-d7e0947043a3']) {
    sh "scp  -o StrictHostKeyChecking=no target/maven-web-application.war   ec2-user@172.31.1.56:/opt/apache-tomcat-9.0.86/webapps/"
}
}
 }
*/
}//stages closing

post {
  success {
    sendSlackNotifications(currentBuild.result)
  }
  failure {
    sendSlackNotifications(currentBuild.result)
  }
}
}//pipeline closing


def sendSlackNotifications(String buildStatus = 'STARTED') {
  // build status of null means successful
  buildStatus =  buildStatus ?: 'SUCCESS'

  // Default values
  def colorName = 'RED'
  def colorCode = '#FF0000'
  def subject = "${buildStatus}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'"
  def summary = "${subject} (${env.BUILD_URL})"

  // Override default values based on build status
  if (buildStatus == 'STARTED') {
    colorName = 'YELLOW'
    colorCode = '#FFFF00'
  } else if (buildStatus == 'SUCCESS') {
    colorName = 'GREEN'
    colorCode = '#00FF00'
  } else {
    colorName = 'RED'
    colorCode = '#FF0000'
  }

  // Send notifications
  slackSend (color: colorCode, message: summary, channel: "citibank-project")
}



