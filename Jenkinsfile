node
{
def mavenHome = tool name: "maven3.6.3"

 properties([[$class: 'JiraProjectProperty'], buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '3', daysToKeepStr: '', numToKeepStr: '3')), pipelineTriggers([pollSCM('* * * * *')])])


 stage('CheckoutCode')
 {
 git branch: 'development', credentialsId: '0fc2b8fe-0aa8-4d3d-be77-60b219ade16c', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
 }

 stage('Build')
 {
 sh "${mavenHome}/bin/mvn clean package"
 }
 
  /*
 stage('SonarQubeReport')
 {
 sh "${mavenHome}/bin/mvn sonar:sonar"
 }
 

 stage('UploadArtifactIntoNexus')
 {
 sh "${mavenHome}/bin/mvn deploy"
 }

 stage('DeployappIntoTomcatServer')
 {
 sshagent(['cb97b0ad-6067-42a4-a9c7-4de4cce322e9']) {
  sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@65.0.133.236:/opt/apache-tomcat-9.0.41/webapps/"  
 }
 }
  */
 stage('SendNotifications')
 {
 mail bcc: 'devopstrainingblr@gmail.com', body: '''Build Over...

 Regards,
 Mithun Technologies,
 9980923226''', cc: 'devopstrainingblr@gmail.com', from: '', replyTo: '', subject: 'Build Over...', to: 'devopstrainingblr@gmail.com'
 }
 
 
}
