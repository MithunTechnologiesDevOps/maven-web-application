node{

def mavenHome = tool name: 'maven3.9.9'

echo "The Job name is: ${env.JOB_NAME}"
echo "Node name is: ${env.NODE_NAME} "
echo "Jenkins Home dir  is: ${env.JENKINS_HOME}"
echo "Jenkins URL is: ${env.JENKINS_URL}"


stage('CheckOutCode'){
git branch: 'development', credentialsId: 'c3b748b8-2f4c-4889-a563-6ecdbc0d0fd5', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
}

stage('Build'){
sh "${mavenHome}/bin/mvn clean package"
}
/*
stage('ExecuteSonarQubeReport'){
sh "${mavenHome}/bin/mvn clean sonar:sonar"
}

stage('UploadArtifactIntoNexusRepo'){
sh "${mavenHome}/bin/mvn clean deploy"
}

stage('DeployAppIntoTomcatServer'){
sshagent(['9f705349-1a24-4624-a6d6-432e9be2e53f']) {
 sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.44.240:/opt/apache-tomcat-9.0.105/webapps/"   
}
}
*/
}
