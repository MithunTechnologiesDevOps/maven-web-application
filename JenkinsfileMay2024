node{
    
echo "Job name is: ${env.JOB_NAME}"
echo "Build Number is: ${env.BUILD_NUMBER}"
echo "Jenkins Home is: ${env.JENKINS_HOME}"
echo "Build Number is: ${env.BUILD_NUMBER}"

    
properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), [$class: 'JobLocalConfiguration', changeReasonComment: ''], pipelineTriggers([pollSCM('* * * * *')])])
    
    def mavenHome = tool name: 'maven3.9.8'

stage('CheckOutCode'){
git branch: 'development', credentialsId: 'f52a7301-4cbc-4389-91fd-0e6ef69c493d', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
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
sshagent(['6c4f159b-13a1-403d-90c4-9957e4a42383']) {
 sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.2.201:/opt/apache-tomcat-9.0.89/webapps/"   
}
}
*/

}
