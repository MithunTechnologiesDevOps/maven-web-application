node{
    
def mavenHome = tool name: 'maven3.9.6'

echo "Job Name is: ${env.JOB_NAME}"
echo "Node name is: ${env.NODE_NAME}"
echo "Jenkins Home is: ${env.JENKINS_HOME}"
echo "Jenkins URL: ${env.JENKINS_URL}"


properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), [$class: 'JobLocalConfiguration', changeReasonComment: ''], pipelineTriggers([pollSCM('* * * * *')])])

    
try{
stage('CheckOutCode'){
    sendSlackNotifications("STARTED")
git branch: 'development', credentialsId: 'f4d4cd21-a88b-47f1-9fd3-113028034791', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
}

stage('Build'){
sh "${mavenHome}/bin/mvn clean package"
}
/*
stage('ExecuteSonarQubeReport'){
sh "${mavenHome}/bin/mvn clean sonar:sonar"
}

stage('UploadArtifactIntoNexus'){
sh "${mavenHome}/bin/mvn clean deploy"
}

stage('DeployAppIntoTomcatServer'){
sshagent(['4ca524cf-56e2-47f7-a073-721da2ac9f53']) {
   sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.40.148:/opt/apache-tomcat-9.0.84/webapps/"
}
}
*/
}
catch(e){
currentBuild.result = "FAILURE"
    throw e
}
finally{
sendSlackNotifications(currentBuild.result)
}
}//node closing


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
  slackSend (color: colorCode, message: summary)
}

