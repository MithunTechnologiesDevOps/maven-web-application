node{  //node start
    
    properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), [$class: 'JobLocalConfiguration', changeReasonComment: ''], 
    
    pipelineTriggers([pollSCM('* * * * *')])])
    
    def mavenHome = tool name: "maven3.8.4"

//Get the code from GitHub Repo
stage('CheckoutCode'){
git branch: 'development', credentialsId: '21d33a3a-d695-49ea-a7e9-1640fb207568', url: 'https://github.com/krishnaprasadkeerthi/maven-web-application.git'
}

//Using Maven for performing the Build
stage('Build'){
sh "${mavenHome}/bin/mvn clean package"
}
/*
//This stage will execute the SonarQube Report
stage('ExecuteSonarQubeReport'){
sh "${mavenHome}/bin/mvn sonar:sonar"
}

//This stage will upload the build artifact in to Nexus Repository
stage('UploadArtifactIntoNexusRepo'){
sh "${mavenHome}/bin/mvn deploy"
}

//This stage will deploy the code to tomcat server
stage('DeplyApplicationIntoTomcatServer')
{
sshagent(['c34e4b81-93d8-4c0f-bb12-17bab3b05b2f']) 
{
sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@65.0.93.91:/opt/apache-tomcat-9.0.58/webapps/"    
}
}

*/
} //node close
