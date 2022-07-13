node
{
    
 def mavenHome = tool name: "maven3.8.5"
  properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), [$class: 'JobLocalConfiguration', changeReasonComment: ''], pipelineTriggers([pollSCM('* * * * *')])])
 
 echo "The Job name is: ${env.JOB_NAME}"
 echo "The node name is: ${env.NODE_NAME}"
 echo "The workspace path is: ${env.WORKSPACE}"
 echo "The node label is: ${env.NODE_LABELS}"
 echo "Th ebuild number is: ${env.BUILD_NUMBER}"
    
stage('CheckoutCode'){
git branch: 'development', credentialsId: '4368c281-f352-4495-89c1-730c9742fca9', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
}

stage('Build'){
sh "${mavenHome}/bin/mvn clean package"
}

  /*
stage('ExecuteSonarQubeReport'){
sh "${mavenHome}/bin/mvn sonar:sonar"
}

stage('UploadArtifcatsIntoNexus')
{
sh "${mavenHome}/bin/mvn deploy"
}

stage('DeployAppIntoTomcatServer'){
sshagent(['85c7b4b3-39bf-4d52-be98-32f11ec4310a']) {
  sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@15.206.173.240:/opt/apache-tomcat-9.0.64/webapps/"
}
}

*/

}
