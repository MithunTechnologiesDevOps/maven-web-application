node{

def mavenHome = tool name: 'maven3.9.6'

properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), [$class: 'JobLocalConfiguration', changeReasonComment: ''], pipelineTriggers([pollSCM('* * * * *')])])

echo "Build Number is: ${env.BUILD_NUMBER}"
echo "Job name is: ${env.JOB_NAME}"
echo "Node name is: ${env.NODE_NAME}"
echo "Jenkins Home dir is: ${env.JENKINS_HOME}"
echo "Build url ${env.BUILD_URL}"
echo "Jenkins url is: ${env.JENKINS_URL}"


stage('CheckOutCode'){
git branch: 'development', credentialsId: 'c68807c4-06a5-4f79-9299-8983b1319a9a', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
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

stage('DeployAppIntoTomcat'){
sshagent(['24445bb8-9b6c-495a-ac51-6fdb43c228e0']) {
  sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.8.105:/opt/apache-tomcat-9.0.85/webapps/"  
}
}
*/


}
