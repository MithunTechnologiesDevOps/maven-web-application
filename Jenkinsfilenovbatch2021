node
{
    
 def mavenHome = tool name: "maven3.8.4"

 stage('CheckoutCode')
 {
 git branch: 'development', credentialsId: '87e4399d-5e09-4de8-b24d-926428729444', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
 }

 stage('Build'){
 sh "${mavenHome}/bin/mvn clean package"
 }
/*
 stage('ExecuteSonarQubeReport'){
 sh "${mavenHome}/bin/mvn clean sonar:sonar"
 }
 
 stage('UploadArtifactIntoNexus'){
 sh "${mavenHome}/bin/mvn clean deploy"
 }
 
 stage('DeployAppintoTomcat'){
 sshagent(['ff8e7c6e-91d1-46b7-a2ae-7b80841604c5']) {
     sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@3.108.42.78:/opt/apache-tomcat-9.0.56/webapps/"
 }
 
 }
 
 stage('SendNotifications'){
 emailext body: '''Build Over..

 Regards,
 Mithun Technologies,
 9980923226''', subject: 'Build Over..', to: 'devopstrainingblr@gmail.com'
 }
 */
 
}
