node
{
    
 def mavenHome = tool name: "maven-3.6.2"
 
 stage('CheckoutCode')
 {
 git branch: 'development', credentialsId: '14c900e6-6b3e-4475-94f5-f55245fb3f80', url: 'https://github.com/balajigajendran002/maven-web-application.git'
 }
 
 stage('Build')
 {
 sh "${mavenHome}/bin/mvn clean package" 
 }
 /*
 stage('QualityCheck')
 {
 sh "${mavenHome}/bin/mvn sonar:sonar"
 }
 
 stage('CodeDeoploy')
 {
 sh "${mavenHome}/bin/mvn deploy"
 }
 
 stage('DeolpyAppintoTomcat')
 {
  sshagent(['b0e1474a-7342-4fd6-8a2b-90c12e2de2f5']) 
   {
    sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@13.235.23.98:/opt/apache-tomcat-9.0.58/webapps/"
   }
 }
 
 stage('SendingEmailNotification')
 {
 mail bcc: '', body: 'Build Completed', cc: 'balajigajendrandevops@gmail.com', from: '', replyTo: '', subject: 'Build Completed', to: 'ijalab.21@gmail.com'
 }
 
*/ 
}
