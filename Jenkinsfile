node
 {

def mavenHome = tool name: "maven3.8.1"
  
  echo "GitHub BranhName ${env.BRANCH_NAME}"
      echo "Jenkins Job Number ${env.BUILD_NUMBER}"
      echo "Jenkins Node Name ${env.NODE_NAME}"
  
      echo "Jenkins Home ${env.JENKINS_HOME}"
      echo "Jenkins URL ${env.JENKINS_URL}"
      echo "JOB Name ${env.JOB_NAME}"
  
  properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '5', artifactNumToKeepStr: '5', daysToKeepStr: '5', numToKeepStr: '5')), [$class: 'JobLocalConfiguration', changeReasonComment: ''], pipelineTriggers([pollSCM('* * * * *')])])

stage( ' CheckoutCode ' )
{
git credentialsId: 'GitHub Credentials', url: 'https://github.com/ClassDev-Org/maven-web-application.git'
}
stage(  ' Build ' )
{
sh "${mavenHome}/bin/mvn clean package"
}

stage ( ' GenerateSonarQubeReport ' )

{
sh "${mavenHome}/bin/mvn clean sonar:sonar"
}
stage ( ' uploadingArtifactsIntoNexus ' )

{
sh "${mavenHome}/bin/mvn deploy"
}

stage ( ' DeployAppIntoTomcat ' )

{
sh "cp target/maven-web-application.war /opt/apache-tomcat-9.0.50/webapps/"
}


/*
stage ( ' DeployToTomcatRemoteServer ')
{
    sshagent(['cc5ff398-1347-492a-b6a3-e06d9a664551']) {
    sh " scp -o StrictHostKeyCheck=no target/maven-web-application.war Test123@10.106.19.120:/opt/apache-tomcat-9.0.50/webapps/ "

}
*/

stage ( ' SendMailNotification ')
{
    emailext body: '''Build Over - Flipkart-ScripyedWay
No issues we got.

Regards,
Jeevan''', subject: 'Build Over - Flipkart-ScripyedWay', to: 'djeevand140@gmail.com'

}

}

