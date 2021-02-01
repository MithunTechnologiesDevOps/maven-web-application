pipeline{

agent any

tools
{
  maven 'maven3.6.3'

}

triggers{
 pollSCM('* * * * *')
}

options{
    timestamps()
    buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '2', daysToKeepStr: '', numToKeepStr: '2'))
}

 stages{
   
   stage('CheckoutCode')
   {
     steps{
	 git branch: 'development', credentialsId: '8e348aa2-9531-4dbe-863d-1adb64897470', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
	 }
   }
   
   stage('Build')
   {
    steps{
	  sh "mvn clean package"
	 }
   }
   
    stage('ExecuteSonarQubeReport')
   {
     steps{
	  sh "mvn sonar:sonar"
	 }
   }
   
   stage('UploadArtifactintoNexus')
   {
     steps{
	  sh "mvn deploy"
	 }
   }
   
  stage('DeployAppIntoTomcat')
 {
   steps{
  sshagent(['2b7b0c6a-5eff-4f4a-82c3-3630f91c70b5']) {
  sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@3.1.222.74:/opt/apache-tomcat-9.0.41/webapps/"
  }
 }
 }
 
  
 
 }
 
 post{
 
 
 success{
 mail bcc: 'devopstrainingblr@gmail.com', body: '''BuildOver!....

 Regards,
 Mithun Technologies,
 9980923226''', cc: 'devopstrainingblr@gmail.com', from: '', replyTo: '', subject: 'BuildOver!!', to: 'devopstrainingblr@gmail.com'
 }
 
 failure{
 mail bcc: 'devopstrainingblr@gmail.com', body: '''BuildOver!....

 Regards,
 Mithun Technologies,
 9980923226''', cc: 'devopstrainingblr@gmail.com', from: '', replyTo: '', subject: 'BuildOver!!', to: 'devopstrainingblr@gmail.com'
 }
 
 }
}
