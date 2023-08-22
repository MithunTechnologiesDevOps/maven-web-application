node{


echo "Jenkins Home dir is: ${env.JENKINS_HOME}"
echo "Job name is: ${env.JOB_NAME}"
echo "Build number is: ${env.BUILD_NUMBER}"

//properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), [$class: 'RebuildSettings', autoRebuild: false, rebuildDisabled: false], [$class: 'JobLocalConfiguration', changeReasonComment: ''], pipelineTriggers([pollSCM('* * * * *')])])


def mavenHome=tool name: 'maven3.9.3'

stage('CheckOutCode'){
git branch: 'development', credentialsId: 'c4900e7a-ccd3-4a5a-8604-b81f52bdc0f2', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
}

stage('Build'){
sh "${mavenHome}/bin/mvn clean package"
}
/*
stage('ExecuteSonarQubeReport'){
sh "${mavenHome}/bin/mvn clean sonar:sonar"
}

stage('UploadArtifactsInotNexus'){
sh "${mavenHome}/bin/mvn clean  deploy"
}


stage('DeploAppIntoTomcatServer'){
sshagent(['331ae6af-906c-4d4f-8317-0379a46b437e']) {
    sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.2.79:/opt/apache-tomcat-9.0.76/webapps/"
}
}
*/

}
