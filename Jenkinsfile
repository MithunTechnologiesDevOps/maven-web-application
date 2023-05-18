node{
echo "Jobe name is: ${env.JOB_NAME}"
echo "Build number is: ${env.BUILD_NUMBER}"
echo "Node name is: ${env.NODE_NAME}"
echo "Jenkins home dir is: ${env.JENKINS_HOME}"

def mavenHome = tool name:"maven3.9.0"

stage('CheckoutCode'){
git branch: 'development', credentialsId: '574d246f-ad12-492a-a3ca-822099444c99', url: 'https://github.com/sharma08153/maven-web-application.git'
}

stage('Build'){
sh "${mavenHome}/bin/mvn clean package"  
}
/*
stage('ExecuteSonarQubeReport')
{
 sh "${mavenHome}/bin/mvn clean sonar:sonar"
}

stage('UploadArtifactIntoNexus')
{
 sh "${mavenHome}/bin/mvn clean deploy"
}

stage('UploadArtifactIntoTomcatServer')
{
sshagent(['28e5f9eb-62ee-4a05-b74a-4d84ff54047b']) {
 sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.5.200:/opt/apache-tomcat-9.0.74/webapps/"
}
}
*/
}
