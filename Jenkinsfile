node{

echo "The Job name is: ${env.JOB_NAME}"
echo "The build number is: ${env.BUILD_NUMBER}"
echo "The Node name is: ${env.NODE_NAME}"
echo "The Home Dir is: ${env.JENKINS_HOME}"

properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), [$class: 'JobLocalConfiguration', changeReasonComment: ''], pipelineTriggers([pollSCM('* * * * *')])])


def mavenHome  = tool name: "maven3.9.4"

stage('CheckoutCode'){
git branch: 'development', credentialsId: '713a50f7-b157-4eb3-8f67-026f0249e5f3', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
}

stage('Build'){

sh "${mavenHome}/bin/mvn clean package"
}

/*
stage('ExecuteSonarQubeReport'){
sh "${mavenHome}/bin/mvn clean sonar:sonar"
}

stage('UploadIntoNexus'){
sh "${mavenHome}/bin/mvn clean deploy"
}

stage('DeployAppIntoTomcat'){
sshagent(['ea9ee369-daff-4af0-9f08-b8bbe168a9b2']) {
    sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.6.39:/opt/apache-tomcat-9.0.82/webapps/ "
}
}

*/
}
