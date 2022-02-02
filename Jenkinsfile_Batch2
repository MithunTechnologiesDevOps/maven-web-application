node
{
def mavenHome=tool name: 'Maven-3.8.3'
  echo "GitHub BranhName ${env.BRANCH_NAME}"
      echo "Jenkins Job Number ${env.BUILD_NUMBER}"
      echo "Jenkins Node Name ${env.NODE_NAME}"
  
      echo "Jenkins Home ${env.JENKINS_HOME}"
      echo "Jenkins URL ${env.JENKINS_URL}"
      echo "JOB Name ${env.JOB_NAME}"
      properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '5', artifactNumToKeepStr: '5', daysToKeepStr: '5', numToKeepStr: '5')), pipelineTriggers([pollSCM('* * * * *')])])
stage('CheckoutCode')
{
git credentialsId: 'c0d39c29-0aea-4a23-9a16-e1932aee858e', url: 'https://github.com/ClassDev-Org/maven-web-application.git'
}
stage('Build'){

sh "${mavenHome}/bin/mvn clean package"

}

stage('CodeQualityCheck'){

sh "${mavenHome}/bin/mvn sonar:sonar"

}
stage('DeploytoRepo'){

sh "${mavenHome}/bin/mvn deploy"

}

stage('DeploytoTomcat'){
sshagent(['42e13c61-6d30-418e-acba-048d29cb4921']) {
sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@13.235.70.255:/opt/apache-tomcat-9.0.53/webapps/"
}

}
stage('EmailNotification')
{
emailext body: '''Build-over 

Regards,
Jeevan''', subject: 'Maven-Web-Application status', to: 'djeevan12@gmail.com'
}

}
