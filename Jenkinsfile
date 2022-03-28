node
{

  def mavenHome = tool name: "maven3.8.5"
  
  stage('CheckoutCode')
  {
  git branch: 'development', credentialsId: '1a45899f-9350-4d96-9894-42c222d595e3', url: 'https://github.com/mss-ec-apps-novbatchanil/maven-web-application.git'
  }

  stage('Build')
  {
  sh "${mavenHome}/bin/mvn clean package"
  }
  
  stage('ExecuteSonarqubeReport')
  {
  sh "${mavenHome}/bin/mvn clean sonar:sonar"
  }
  
  stage('UploadArtifactintoNexus')
  {
  sh "${mavenHome}/bin/mvn clean deploy"
  }
  
  stage('DeployAppIntoTomcat')
  {
  sshagent(['5c9bd688-00af-4114-b318-ed985664fcae']) {
    sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@13.127.17.200:/opt/apache-tomcat-9.0.59/webapps"
}
  }
  
  stage('SendNotifications')
  {
    emailext body: 'By Anil...', subject: 'Build Over', to: 'anil8069@gmail.com'  
  }

}
