node{
{

  //http://JenkinsServerIPAddress:8080/pipeline-syntax/globals#currentBuild
  //Getting the  env  global varibale values

  echo "GitHub BranhName ${env.BRANCH_NAME}"
  echo "Jenkins Job Number ${env.BUILD_NUMBER}"
  echo "Jenkins Node Name ${env.NODE_NAME}"
  
  echo "Jenkins Home ${env.JENKINS_HOME}"
  echo "Jenkins URL ${env.JENKINS_URL}"
  echo "JOB Name ${env.JOB_NAME}"
  
  properties([
    buildDiscarder(logRotator(numToKeepStr: '3')),
    pipelineTriggers([
        pollSCM('* * * * *')
    ])
  ])
  
  def mavenHome=tool name: "mavenv3.1.1.1", type: "maven"
    
  stage('CheckouttheCode') {
   git branch: 'master', credentialsId: '4d6512c4-c101-4f43-aac5-5860f5d9e20c', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'  
 }
  /*
   stage('Checkout'){
     checkout scm
  }
  */
 
 stage('Build')
 {
  sh  "${mavenHome}/bin/mvn clean package"
 }

 /* 
 stage('Testing')
   {
    if(isUnix()){
     sh 'mvn test'
      }
      else{
       bat 'mvn test'   
      }
   }
 */

 stage('SonarQubeReport')
 {
  sh  "${mavenHome}/bin/mvn sonar:sonar"
 }

  stage('UploadArtifactsIntoNexus')
 {
  sh  "${mavenHome}/bin/mvn deploy"
 }
 /*
 stage('DeplotoTomcat'){
     
     sh "cp $WORKSPACE/target/*.war /opt/apache-tomcat-9.0.16/webapps/"
 }
 

stage('DeploytoTomcat'){

   sshagent(['f0ef3182-69ef-4169-8368-9ea18a5fe3af']) 
   {
     sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@13.126.135.88:/opt/apache-tomcat-9.0.22/webapps/maven-web-application.war"
   }
}
*/
 stage('EmailNotification'){
    mail to: 'devopstrainingblr@gmail.com',
         bcc: 'devopstrainingblr@gmail.com', 
         cc: 'devopstrainingblr@gmail.com', 
         from: 'devopstrainingblr@gmail.com', 
         replyTo: 'devopstrainingblr@gmail.com', 
         subject: 'Build Notification'
         body: '''Build Done, Please check the build log for more details..
         
                  Regards,
                  Mithun Technologies,
                  9980923226'''
 }
 
 
}
