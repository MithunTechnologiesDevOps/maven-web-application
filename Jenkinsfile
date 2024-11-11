node{
    
echo "The Job name is: ${env.JOB_NAME}"
echo "The Node name is: ${env.NODE_NAME}"
echo "The build number is: ${env.BUILD_NUMBER}"

properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), pipelineTriggers([pollSCM('* * * * *')])])


def mavenHome = tool name: 'maven3.9.8'

stage('CheckOutCode'){
git branch: 'development', credentialsId: '52d61b39-b2dc-4ce5-a7e6-b0033b6e4d2f', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
}

stage('Build'){
sh "${mavenHome}/bin/mvn clean package"
}

  /*
stage('ExecuteSonarqubeReport'){
sh "${mavenHome}/bin/mvn clean sonar:sonar"
}

stage('UploadArtifactsInotNexus'){
sh "${mavenHome}/bin/mvn clean deploy"
}

stage('DeployAppIntoTomcatServer'){
sshagent(['b12eb970-18b1-4fb1-a861-7c04af376ccd']) {
 sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.2.185:/opt/apache-tomcat-9.0.96/webapps/"   
}
}
*/
  
}
