node{

def mavenHome = tool name: 'maven3.9.2'

echo "Job name is: $JOB_NAME" 
echo "Node name is: $NODE_NAME"
echo "Jenkins Home url is: $JENKINS_HOME"

properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), [$class: 'JobLocalConfiguration', changeReasonComment: ''], pipelineTriggers([pollSCM('* * * * *')])])

stage('CheckOutCode'){
git branch: 'development', credentialsId: '7234a3b2-097a-4e4b-a14d-a9e98131fa2b', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
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
sshagent(['2d6c465d-3f2c-4356-83b4-6c4928ec54c6']) {
   sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.26.193:/opt/apache-tomcat-9.0.75/webapps/"
}
}
*/


}
