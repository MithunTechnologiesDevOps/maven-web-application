node
{
  
  def mavenHome = tool name: "maven3.6.2"    
  properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5'))])
  
stage('getcode')
{
 git branch: 'development', credentialsId: 'b3f4781f-ce28-4583-8cef-c41847210068', url: 'https://github.com/sivaraasani/maven-web-application.git'
}

stage('build')
{
sh "${mavenHome}/bin/mvn clean package"
}

stage('Exicute sonarqube report')
{
 sh "${mavenHome}/bin/mvn sonar:sonar"
}

stage('uploadbuildartifactsintonexus')
{
 sh "${mavenHome}/bin/mvn deploy"
}

stage('DeployAppIntoTomcat')
{
sshagent(['1dbb18a8-82da-4df4-a062-f727520d115e']) 
{
 sh "scp -o strictHostkeychecking=no target/maven-web-application.war  ec2-user@54.90.201.116:/opt/apache-tomcat-9.0.65/webapps/"
}
}
}




