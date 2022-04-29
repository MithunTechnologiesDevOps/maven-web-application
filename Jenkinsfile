def slackNotifications(String buildStatus = 'STARTED') {
  // build status of null means success
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


node{
echo "build nuber is: ${env.BUILD_NUMBER}"
echo "job name is:  ${env.JOB_NAME}"
echo "node name is:  ${env.NODE_NAME}"
 properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), [$class: 'JobLocalConfiguration', changeReasonComment: ''], pipelineTriggers([pollSCM('* * * * *')])])
def mavenHome = tool name: 'maven3.8.5'   
//get the code from github repo
stage('checkoutcode'){
git branch: 'development', credentialsId: 'fe3bb905-fc53-495e-95fd-8e5f0cde5900', url: 'https://github.com/sujitha-devops-learning/maven-web-application.git'
}

//do the build
stage('build'){
sh "${mavenHome}/bin/mvn clean package"

}

//generating sonarqube report
stage('sonarqube report'){
sh "${mavenHome}/bin/mvn sonar:sonar"
}
//uploading artifactory repo by using Nexus
stage('artifactory repo'){
sh "${mavenHome}/bin/mvn deploy"
}
//deploy in to the tomcat
stage('deploy application'){
sshagent(['856229cf-3769-4ddb-b86e-75ea3527834e']) {
sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@3.108.223.91:/opt/apache-tomcat-9.0.62/webapps/"

}
    
}


}//node closes

