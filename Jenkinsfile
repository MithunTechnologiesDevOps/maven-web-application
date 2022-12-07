node{

def MavenHome=tool name: "Maven 3.8.6"

echo "GitHub BranhName ${env.BRANCH_NAME}"
      echo "Jenkins Job Number ${env.BUILD_NUMBER}"
      echo "Jenkins Node Name ${env.NODE_NAME}"
  
      echo "Jenkins Home ${env.JENKINS_HOME}"
      echo "Jenkins URL ${env.JENKINS_URL}"
      echo "JOB Name ${env.JOB_NAME}"
      
stage('ChechoutCodeFromGitHub')
{
git credentialsId: 'cb901893-bbfa-4279-adec-50d76c639eee', url: 'https://github.com/ClassDev-Org/maven-web-application.git'
}

stage('build')
{
sh "${MavenHome}/bin/mvn clean package "
}

stage('SonaQubeReport')
{
sh "${MavenHome}/bin/mvn sonar:sonar "
}

stage('uploadToNexus')
{
sh "${MavenHome}/bin/mvn clean deploy"
}

stage('DepoyTOTomcat')
{
sshagent(['4aff5c91-7294-448d-97f3-43499dc17dc1']) {
sh "scp -o StrictHostkeyChecking=no target/maven-web-application.war ec2-user@43.205.232.250:/opt/apache-tomcat-9.0.69/webapps/"
}
}

stage('email notification')
{
emailext body: '''Hi team,

flipkart build got compted.

thanks & regards
jeevan''', subject: 'build status', to: 'djeevan140@gmail.com'
}

}
