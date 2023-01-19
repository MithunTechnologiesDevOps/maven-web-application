node{
    
   echo "The Job Name is: ${env.JOB_NAME}" 
echo "The Build number is: ${env.BUILD_NUMBER}" 
echo "The Node is name is: ${env.NODE_NAME}" 
echo "The Jenkins HD is: ${env.JENKINS_HOME}" 

properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), [$class: 'JobLocalConfiguration', changeReasonComment: ''], pipelineTriggers([pollSCM('* * * * *')])])


def mavenHome = tool name: 'maven3.8.6'

stage('CheckOutCode'){
git branch: 'development', credentialsId: 'c5d5e5d2-dd99-409b-a952-b8e9ae34f1bd', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
}

stage('Build'){
sh "${mavenHome}/bin/mvn clean package"
}
/*
stage('ExecuteSonarQubeReport'){
sh "${mavenHome}/bin/mvn clean sonar:sonar"
}

stage('UploadArtifcatsIntoNexus'){
sh "${mavenHome}/bin/mvn clean deploy"
}

stage('DeployAppIntoTomcatServer'){
sshagent(['34a51f9e-565d-4311-bf10-6c30e2434e5c']) {
 sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.27.111:/opt/apache-tomcat-9.0.70/webapps/"  
}
}
*/
  
  
}
