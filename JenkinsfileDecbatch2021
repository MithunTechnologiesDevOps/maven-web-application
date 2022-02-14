node('nodes'){
    
    properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), [$class: 'JobLocalConfiguration', changeReasonComment: ''], 

pipelineTriggers([pollSCM('* * * * *')])])


    
    def mavenHome = tool name: "maven3.8.3"

stage('CheckoutCode'){

git branch: 'development', credentialsId: '352cc3f6-7324-4a22-8c47-1424e7b2efd0', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
}


stage('Build'){
sh "${mavenHome}/bin/mvn clean package"
}

 /*
stage('ExecuteSonarQubeReport'){
sh "${mavenHome}/bin/mvn sonar:sonar"
}
stage('UploadArtifcatIntoNexusRepo'){
sh "${mavenHome}/bin/mvn deploy"
}

stage('DeployAppintoTomcatServer')
{
sshagent(['c29671b1-f627-4b75-a391-49155466e661']) {
 sh  "scp -o StrictHostKeyChecking=no target/maven-web-application.war  ec2-user@65.0.27.170:/opt/apache-tomcat-9.0.56/webapps/"
}

}
*/
}
