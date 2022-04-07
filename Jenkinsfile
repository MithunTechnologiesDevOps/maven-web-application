node{
def mavenHome = tool name: "maven3.8.5"
//Build description and buildname   
buildDescription 'PIPELINE scriptedway '
buildName 'Develop -${BUILD_NUMBER}'
//Project name and Branch   
echo "The branch name is:  ${env.BRANCH_NAME} "
echo  " The job name:  ${env.JOB_NAME} "
   
properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '3', daysToKeepStr: '', numToKeepStr: '3'))])  
properties([pipelineTriggers([pollSCM('* * * * *')])])   
   
stage('checkout'){
  echo "The branch name is:  ${env.BRANCH_NAME} "
git branch: 'development', credentialsId: '9c5b52be-ec0b-4b3d-8350-fe86cd3811b9', url: 'https://github.com/MBS-developements/maven-web-application.git'
}// Get code from SCM

stage("build"){
    sh "$mavenHome/bin/mvn clean package"
}//Build code

stage("Report gen"){
    sh"$mavenHome/bin/mvn sonar:sonar"
}//create sonar report..

stage("upload artifact into artifactory repo"){
    sh"$mavenHome/bin/mvn deploy"
}//uploaded
//Deploy app into Tomcat server
stage('deploy app into tomcat server'){
sshagent(['17d61311-f1e0-4eea-802f-c02ba3d7751e']) {
    sh"scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@3.110.88.64:/opt/apache-tomcat-9.0.60/webapps"
}
}
}//end
