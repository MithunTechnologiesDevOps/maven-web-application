node{

def mavenHome = tool name: "maven3.8.5"

echo "Build number: ${env.BUILD_NUMBER}" 
//echo "Job name is: ${env.JOB_NAME}"
echo "Node name is: ${env.NODE_NAME}"


properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), [$class: 'JobLocalConfiguration', changeReasonComment: ''], pipelineTriggers([pollSCM('* * * * *')])])



stage('CheckoutCode'){
git branch: 'development', credentialsId: 'd282f55b-fad5-4318-87d4-7ae8a1bf92b2', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
}

stage('Build'){
sh "${mavenHome}/bin/mvn clean package"
}

  /*
stage('ExecuteSonarQubeReport'){
sh "${mavenHome}/bin/mvn sonar:sonar"
}

stage('UploadArtifactintoNexus')
{
sh "${mavenHome}/bin/mvn deploy"
}

stage('DeployAppIntoTomcatServer'){
sshagent(['edb68cd9-21f4-4bb5-a6ae-2bd936f65b53']) {
  sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.16.144:/opt/apache-tomcat-9.0.68/webapps/"  
}
}
*/

}
