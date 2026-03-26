node{

def mavenHome = tool name: 'maven3.9.14'

echo "The Build number is: ${BUILD_NUMBER}"
echo "The Job name is: ${JOB_NAME}"
echo "The Node name is: ${NODE_NAME}"
echo "The Jenkins Home dir is: ${JENKINS_HOME}"


properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), pipelineTriggers([pollSCM('* * * * *')])])


stage('CheckOutCode'){
git branch: 'development', credentialsId: 'eb0851ba-3050-45de-8516-aaaf0f001b66', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
}

stage('Build'){
sh "${mavenHome}/bin/mvn clean package"
}

/*
stage('ExecuteSonarQubeReport'){
sh "${mavenHome}/bin/mvn clean package sonar:sonar"
}

stage('UploadArtifactsIntoNexus'){
sh "${mavenHome}/bin/mvn clean package deploy"
}

stage('DeployAppIntoTomcatServer'){
sshagent(['497cf69f-e5d2-4e1b-936d-e90c73dcbf52']) {
sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.11.72:/opt/apache-tomcat-9.0.115/webapps/"
}
}
*/

}
