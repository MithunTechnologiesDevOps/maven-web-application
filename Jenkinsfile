node{
 def mavenHome = tool name: "maven3.8.4"
  
       echo "GitHub BranhName ${env.BRANCH_NAME}"
       echo "Jenkins Job Number ${env.BUILD_NUMBER}"
       echo "Jenkins Node Name ${env.NODE_NAME}"
  
       echo "Jenkins Home ${env.JENKINS_HOME}"
       echo "Jenkins URL ${env.JENKINS_URL}"
       echo "JOB Name ${env.JOB_NAME}"
         
 stage('CheckOutCode')
 {
 git branch: 'development', credentialsId: '96c6080f-1e06-4350-af82-16c85f5e4276', url:'https://github.com/surendradevops-ec-project/maven-web-application.git'
 }


 stage('Build')
 {
  sh "${mavenHome}/bin/mvn clean package"
 }
 
 stage('SonarQubeReport'){
 sh "${mavenHome}/bin/mvn clean sonar:sonar"
 }
 
 stage('UploadArtifactIntoNexus'){
 sh "${mavenHome}/bin/mvn clean deploy"
 }
 
 stage(DeployAppIntoTomcatServer)
 {
 sshagent(['899273e7-406b-48eb-9f5d-5db3b4a39599']) {
  sh "scp -o  StrictHostKeyChecking=no target/maven-web-application.war ec2-user@13.232.77.125:/opt/apache-tomcat-9.0.56/webapps/"
 } 
 }
 
 stage('SendEmailNotification'){
   emailext body: '''Build is over!!

   Regards,
   Surendra.
   6300658304''', subject: 'Build Over..!!', to: 'reddysurendra8304@gmail.com'
 }
 
  
}
