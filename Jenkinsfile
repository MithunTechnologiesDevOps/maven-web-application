node
 {
 
  def mavenHome = tool name: "maven3.8.4"
  
  stage('CheckoutCode')
  {
  git branch: 'development', credentialsId: 'c0890c36-4dc1-424c-b6d0-c3ad5606eca5', url: 'https://github.com/mss-ec-apps-novbatchanil/maven-web-application.git'
  }
  
  stage('Build')
  {
  sh "${mavenHome}/bin/mvn clean package"
  }
  /*
  stage('ExecuteSonarQubeReport')
  {
  sh "${mavenHome}/bin/mvn clean sonar:sonar"
  }
  
  stage('UploadArtifactintoNexus')
  {
  sh "${mavenHome}/bin/mvn clean deploy"
  }
  
  stage('DeployAppintoTomcat')
  {
  sshagent(['5c9fafae-069d-457b-99cf-462b2c9095b4']) {
    sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@13.233.245.126:/opt/apache-tomcat-9.0.58/webapps"
}
  }
  
  stage('SendNotifications')
  {
  emailext body: '''Build Over

Regards
     Anil...''', subject: 'Build Over', to: 'anilkumar.artik82@gmail.com'
  }
  */
 }
