node
{
    properties([[$class: 'JiraProjectProperty'], buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), pipelineTriggers([pollSCM('* * * * *')])])


def mavenHome = tool name: "mavan3.6.3"

stage('CheckoutCode')
{
 git branch: 'development', credentialsId: '6b6cc262-f6e1-4b20-9418-80220b0077b6', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
}

stage('Build')
{
sh "${mavenHome}/bin/mvn clean package"
}

 /*
stage('ExecuteSonarQubeReport')
{
sh "${mavenHome}/bin/mvn sonar:sonar"
}

stage('UploadArtifactIntoNexus')
{
sh "${mavenHome}/bin/mvn deploy"
}

stage('DeployAppIntoTomcatServer')
{
sshagent(['d0e21efb-68d1-4829-938e-d8a7a01b293c'])
 {
  sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@3.128.192.122:/opt/apache-tomcat-9.0.39/webapps/"   
 }
}

stage('SendEmailNotification')
{
mail bcc: 'devopstrainingblr@gmail.com', body: '''Build Over...

Regards,
Mithun Technologies,
9980923226''', cc: 'devopstrainingblr@gmail.com', from: '', replyTo: '', subject: 'Build Over!!', to: 'devopstrainingblr@gmail.com'
}
*/

}
