node
{
  def mavenHome = tool name: "maven3"
 stage('CheckoutCode') 
 {
  git branch: 'development', credentialsId: 'd32f6fa5-3dd2-449b-8105-0891983517e3', url: 'https://github.com/deepaus/maven-web-application.git'
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
 
 stage('DeployAppIntoTomcat')
 {
 sshagent(['df9fda0c-33be-4e21-a778-2433ff4971ad']) 
 {
 sh "scp -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/pipelinescript-project/target/maven-web-application.war ec2-user@3.110.90.181:/opt/apache-tomcat-9.0.65/webapps/"
 }                                                                  
 }
 
 stage('Send E-Mail notivicateion')
 {
 
   mail bcc: '', body: 'success', cc: '', from: '', replyTo: '', subject: 'success', to: 'prasannagarla@gmail.com'
 }
 */
}

