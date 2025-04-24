node{

properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), pipelineTriggers([pollSCM('* * * * *')])])


echo "The Job name is: ${env.JOB_NAME}"
echo "The Build number is: ${env.BUILD_NUMBER}"
echo "The node name is: ${env.NODE_NAME}"
echo "The Jenkins URL is: ${env.JENKINS_URL}"
echo "The Jenkins home is : ${env.JENKINS_HOME}"

def mavenHome = tool name: 'maven3.9.9'

stage('CheckOutCode'){
git branch: 'development', credentialsId: '2a0195f8-1c2e-4585-a6a6-86bb4c223159', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
}

stage('Build'){
sh "${mavenHome}/bin/mvn clean package"
}
/*
stage('SonarQubeReport'){
sh "${mavenHome}/bin/mvn clean sonar:sonar"
}

stage('UploadArtifactsIntonexus'){
sh "${mavenHome}/bin/mvn clean deploy"
}

stage('DeployAppIntoTomcatServer'){
sshagent(['b1d28235-19c6-4c2e-bf1b-25f5afc8c950']) {
sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.22.163:/opt/apache-tomcat-9.0.102/webapps/"    
}
}
*/

}
