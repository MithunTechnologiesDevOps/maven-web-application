pipeline{

agent any

triggers{
 pollSCM('* * * * *')
}

options{
timestamps()
buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5'))
}

tools{
maven "maven3.6.3"
}

stages{

 stage('CheckoutCode'){
 steps{
   git branch: 'development', credentialsId: '6a6dfb50-0907-46a0-9303-c9c87db27742', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
 }
 }
 
 stage('Build'){
  steps{
  sh "mvn clean package"
  }
 }

/*
  stage('ExecuteSonarQubeReport'){
  steps{
  sh "mvn clean sonar:sonar"
  }
 }
 
 stage('UploadArtifactIntoNexus'){
  steps{
  sh "mvn clean deploy"
  }
 }
 stage('DeployAppIntoTomcatServer'){
  steps{
   sshagent(['c00595ae-6d80-4938-a41e-cf3c55674816']) {
    sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@13.233.212.189:/opt/apache-tomcat-9.0.46/webapps/"
   }
  }
 }
*/

}//Stages Closing

post{

 success{
 emailext body: '''Build is Over - Success!!

 Regards,
 Mithun Technologies,
 9980923226''', subject: 'Build is Over - Scuess!!', to: 'devopstrainingblr@gmail.com'
 }
 failure{
 emailext body: '''Build is Over - Failed!!

 Regards,
 Mithun Technologies,
 9980923226''', subject: 'Build is Over - Failed!!', to: 'devopstrainingblr@gmail.com'
 }
 
}
}
