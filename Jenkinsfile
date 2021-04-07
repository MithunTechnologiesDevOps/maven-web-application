node ('master')
 {
  
  def mavenHome = tool name: "maven3.6.3"
  
      echo "GitHub BranhName ${env.BRANCH_NAME}"
      echo "Jenkins Job Number ${env.BUILD_NUMBER}"
      echo "Jenkins Node Name ${env.NODE_NAME}"
  
      echo "Jenkins Home ${env.JENKINS_HOME}"
      echo "Jenkins URL ${env.JENKINS_URL}"
      echo "JOB Name ${env.JOB_NAME}"
  
   //properties([[$class: 'JiraProjectProperty'], buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '2', daysToKeepStr: '', numToKeepStr: '2')), pipelineTriggers([pollSCM('* * * * *')])])
  
 stage('CheckOutthe Code')
{
git branch: 'development', credentialsId: 'c469656d-9f6d-4133-ad6a-ef3acebb6089', url: 'https://github.com/Nagendra216/maven-web-application.git'
}
stage('Build')
{
sh "${mavenHome}/bin/mvn clean package"
}
stage('Execute SonarQube Report')
{
sh "${mavenHome}/bin/mvn sonar:sonar"
}
stage('Upload Artifact in Nexus')
{
sh "${mavenHome}/bin/mvn deploy"
}
stage('Deploy Application into Tomcat Server')
{
sshagent(['89f44ff3-4911-422f-b62b-ab600a7700ef'])
{
 sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@3.17.146.238:/opt/apache-tomcat-9.0.44/webapps/"
}
}
 }
