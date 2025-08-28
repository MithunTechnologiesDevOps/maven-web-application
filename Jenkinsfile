node{

def mavenHome = tool name: "maven3.9.10"

echo "The Build Number is: ${env.BUILD_NUMBER}"
echo "The Node name is: ${env.NODE_NAME}"
echo "The workspace is: ${env.WORKSPACE}"
echo "The Jenkins URL: ${env.JENKINS_URL}"
echo "Jenkins Home dir is: ${env.JENKINS_HOME}"

properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), pipelineTriggers([pollSCM('* * * * *')])])


stage('CheckOutCode'){
git branch: 'development', credentialsId: 'f1f41658-2699-417d-bc6d-cb31bce0f131', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
}

stage('Build'){
sh "${mavenHome}/bin/mvn clean package"
}

  /*
stage('ExecuteSonarQubeReport'){
sh "${mavenHome}/bin/mvn clean sonar:sonar"
}

stage('UploadArtifactsIntoNexus'){
sh "${mavenHome}/bin/mvn clean deploy"
}

stage('DeployAppIntoTomcatServer'){
sshagent(['fa30aac3-6b0f-4212-b2a1-5eb458df4218']) {
  sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.43.194:/opt/apache-tomcat-9.0.108/webapps/"
}
}
*/

}
