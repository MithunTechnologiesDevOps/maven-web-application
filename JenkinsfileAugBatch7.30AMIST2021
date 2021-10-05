node('wallmart-node')
{
  
  def mavenHome = tool name: "maven3.6.2"
  
  properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), pipelineTriggers([pollSCM('* * * * *')])])
    
  stage('CheckOutCode'){
  git branch: 'development', credentialsId: 'dd65bff1-b7fd-4c5b-9bc9-6c274df50095', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
  }
  
  stage('Build'){
  sh "${mavenHome}/bin/mvn clean package"
  }
/*
 stage('ExecuteSoanrQubeReport'){
  sh "${mavenHome}/bin/mvn clean sonar:sonar"
  }
  
  stage('UploadArtifactIntoNexusRepo'){
  sh "${mavenHome}/bin/mvn clean deploy"
  }
  
  stage('DeploytheAppintoTomcat')
  {
  sshagent(['b07d0aa5-2bef-49a7-9d56-940e56b6ba93']) {
 sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@13.233.67.194:/opt/apache-tomcat-9.0.53/webapps"     
  }
   }
  
 
  stage('SendEmailNotification'){
   mail bcc: 'devopstrainingblr@gmail.com', body: '''Build Over !!

   Regards,
   Mithun Technologies,
   9980923226''', cc: 'devopstrainingblr@gmail.com', from: '', replyTo: '', subject: 'Build Over!!', to: 'devopstrainingblr@gmail.com'
  }
  */
}//Closing brancket for Node 
