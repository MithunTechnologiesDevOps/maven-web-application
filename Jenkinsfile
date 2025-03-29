node{
    
echo "The Build number is: ${env.BUILD_NUMBER}"
echo "The Job name is: ${env.JOB_NAME}"
echo "The Node is name is: ${env.NODE_NAME}"
echo "The workspace is: ${env.WORKSPACE}"
echo "The Jenkins Home directory is: ${env.JENKINS_HOME}"
echo "The Jenkins url is: ${env.JENKINS_URL}"


def mavenHome = tool name: 'maven3.9.9'

try{
stage('CheckOutCode'){
sendSlackNotifications('STARTED')
git branch: 'development', credentialsId: '9e2aca48-edfd-4dd9-acc9-b352ab51a722', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
}

stage('Build'){
sh "${mavenHome}/bin/mvn clean packag"
}

  /*
stage('ExecuteSonarQubeReport'){
sh "${mavenHome}/bin/mvn clean sonar:sonar"
}

stage('UploadArtifactsIntoNexus'){
sh "${mavenHome}/bin/mvn clean deploy"
}

stage('DeployAppIntoTomcatServer'){
sshagent(['bfb6d86a-3ded-460b-8b79-f23379a48bb9']) {
sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.4.134:/opt/apache-tomcat-9.0.102/webapps/"  
}
}
*/
}
catch(e){
 currentBuild.result = "FAILED"
 throw e
}
finally{
 sendSlackNotifications(currentBuild.result)
}

}//node closing

def sendSlackNotifications(String buildStatus = 'STARTED') {
  // build status of null means successful
  buildStatus =  buildStatus ?: 'SUCCESS'

  // Default values
  def colorName = 'RED'
  def colorCode = '#FF0000'
  def subject = "${buildStatus}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'"
  def summary = "${subject} (${env.BUILD_URL})"

  // Override default values based on build status
  if (buildStatus == 'STARTED') {
    colorName = 'YELLOW'
    colorCode = '#FFFF00'
  } else if (buildStatus == 'SUCCESS') {
    colorName = 'GREEN'
    colorCode = '#00FF00'
  } else {
    colorName = 'RED'
    colorCode = '#FF0000'
  }

  // Send notifications
  slackSend (color: colorCode, message: summary, channel: '#icicibankteam')
}



