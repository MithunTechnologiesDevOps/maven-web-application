node{
    
def mavenHome = tool name: 'maven3.9.5'

echo "The Job name is : ${env.JOB_NAME}"
echo "Jenkins Home dir is: ${env.JENKINS_HOME}"
echo "THe Jenkins node name is: ${env.NODE_NAME}"
echo "The Build number is: ${env.BUILD_NUMBER}"


properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), [$class: 'RebuildSettings', autoRebuild: false, rebuildDisabled: false], [$class: 'JobLocalConfiguration', changeReasonComment: ''], pipelineTriggers([pollSCM('* * * * *')])])

stage('CheckoutCode'){
git branch: 'development', credentialsId: 'd6df2d94-c538-42c5-9f24-fe8f34e2d3ed', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
}

stage('Build'){
sh "${mavenHome}/bin/mvn clean package"
}
/*
stage('ExecuteSonarQubeReport'){
sh "${mavenHome}/bin/mvn clean sonar:sonar"
}

stage('UploadArtifactIntoNexus'){
sh "${mavenHome}/bin/mvn clean deploy"
}

stage('DeployAppIntoTomcat'){
sshagent(['d6426027-80c3-4552-8996-88b0e796f475']) {
 sh "scp -o StrictHostKeyChecking=no  target/maven-web-application.war ec2-user@172.31.41.45:/opt/apache-tomcat-9.0.86/webapps/"
}
}
*/

}
