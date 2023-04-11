node{
    
    echo "The Job name is: ${JOB_NAME}"
echo "The buils number is: ${BUILD_NUMBER}"
echo "The node name is : ${NODE_NAME}"

properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), [$class: 'JobLocalConfiguration', changeReasonComment: ''], pipelineTriggers([pollSCM('* * * * *')])])

def mavenHome = tool name: 'maven3.8.8'

stage('CheckoutCode'){
git branch: 'development', credentialsId: '4768a632-7cb1-4a54-96e5-816d16a40c7f', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
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

stage('DeployAppintoTomcat'){
sshagent(['a2296f55-cf3b-4b3f-a5b5-17b11d8b83f2']) {
  sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.44.186:/opt/apache-tomcat-9.0.73/webapps/"
}
}
*/
  
}
