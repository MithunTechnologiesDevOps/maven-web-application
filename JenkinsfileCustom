node('nodes'){
 
  //echo "GitHub BranhName ${env.BRANCH_NAME}"
  //echo "Jenkins Job Number ${env.BUILD_NUMBER}"
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
 
 def mavenHome = tool name:"maven3.6.2"
 
 stage('Checkout'){
 git branch: 'development', credentialsId: 'e14ded32-a4da-421c-99b2-9f417175e8b3', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'   
 }
 
 /*
 stage('Build')
 {
  sh "${mavenHome}/bin/mvn clean package"
 }
 
  stage('SonarQubeReport')
 {
  sh "${mavenHome}/bin/mvn sonar:sonar"
 }
 
  stage('UploadArtifactintoNexus')
  {
   sh "${mavenHome}/bin/mvn deploy"
  } 
 
 stage('DeployAppintoTomcat')
 {
 sshagent(['c515e20b-3ee9-460d-9364-6556cc226b40']) {
  sh  "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@13.126.84.105:/opt/apache-tomcat-9.0.27/webapps/maven-web-application.war"
 }
 }
 */
 
 stage('SendEmailNotification')
 {
 
 emailext body: '''Build is over

 Regards,
 Mithun Technologies,
 9980923226''', subject: 'Buid is over', to: 'devopstrainingblr@gmail.com'
 }
    
}
