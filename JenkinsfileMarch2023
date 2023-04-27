node{
    
    
properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), [$class: 'JobLocalConfiguration', changeReasonComment: ''], pipelineTriggers([pollSCM('* * * * *')])])

def mavenHome  = tool name: 'maven3.9.1'

echo "The Job name is: ${JOB_NAME} " 
echo "The Node name is:  ${NODE_NAME}"
echo "The Build Number is:  ${BUILD_NUMBER}"
echo "Jenkins Home path is: ${JENKINS_HOME}" 


stage('CheckoutCode'){
git branch: 'development', credentialsId: 'aaa8e2c0-226a-40ba-85eb-259762d67c15', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
}

stage('Build')
{
sh "${mavenHome}/bin/mvn clean package"
}

  /*
stage('SonarQubeReport'){
sh "${mavenHome}/bin/mvn clean sonar:sonar"
}

stage('UploadArtifactsIntoNexus'){
sh "${mavenHome}/bin/mvn clean deploy"
}

stage('DeployAppIntoTomcat'){
sshagent(['dd085870-ab36-4a86-9f5b-a915e179d45d']) {
   sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.40.86:/opt/apache-tomcat-9.0.73/webapps/"
}
}
*/

}//node closing
