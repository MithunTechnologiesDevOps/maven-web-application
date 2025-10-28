node{

def mavenHome = tool name: 'maven3.9.10'

echo "The Build Number is: ${env.BUILD_NUMBER}"
echo "The Node name is: ${env.NODE_NAME}"
echo "The Job name is: ${env.JOB_NAME}"
echo "The Jenkins Home is: ${env.JENKINS_HOME}"


stage('CheckOutCode'){
git branch: 'development', credentialsId: '35356d01-f1a5-4f26-b999-130cde19e026', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
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
sshagent(['ae079faf-1ae7-4a91-8c34-a77951ecbd3d']) {
sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.15.155:/opt/apache-tomcat-9.0.109/webapps/"
}
}
*/

}
