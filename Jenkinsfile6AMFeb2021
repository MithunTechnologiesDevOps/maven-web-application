node
{
 def mavenHome = tool name: "maven3.6.3"
 
 stage('CheckoutCode')
 {
  git branch: 'development', credentialsId: '05d44367-ae8e-4ef8-88f3-330b9e349310', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
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
 
 stage('UploadArtifactintoNexus')
 {
 sh "${mavenHome}/bin/mvn deploy"
 }
 
 stage('DeployAppIntoTomcatServer')
 {
  sshagent(['80459334-5776-471c-90c6-277f3fbdd727']) {
  sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@3.25.69.97:/opt/apache-tomcat-9.0.44/webapps/"
  }
 }
 */
 stage('SendEmailNotification')
 {
 emailext body: '''Build Over - Scriptedway

 Regards,
 Mithun Software Solutions,
 9980923226''', subject: 'Build Over - Scriptedway', to: 'devopstrainingblr@gmail.com'
 }
 
}
