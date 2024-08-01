node{

def mavenHome = tool name: 'maven3.9.8'


echo "The Job name is: ${env.JOB_NAME}"
echo "The node name is: ${env.NODE_NAME}"
echo "The Jenkins Home dir is: ${env.JENKINS_HOME}"

stage('CheckOutCode'){
git branch: 'development', credentialsId: '8c8f9770-b08f-44f2-be9d-45a77bb7e105', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
}

stage('Build'){
sh "${mavenHome}/bin/mvn clean package"
}
/*
stage('ExecuteSonarQubeReport'){
sh "${mavenHome}/bin/mvn clean sonar:sonar"
}

stage('UploadArtifactInotNexus'){
sh "${mavenHome}/bin/mvn clean deploy"
}

stage('DeployAppIntoTomcat'){
sshagent(['3223338a-9541-406a-9044-6e5109e2ce9e']) {
    sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.28.104:/opt/apache-tomcat-9.0.91/webapps/"
}
}

*/

}
