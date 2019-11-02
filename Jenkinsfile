node
{
	echo "GitHub BranhName ${env.BRANCH_NAME}"
	 echo  "Jenkins Job Number ${env.BUILD_NUMBER}"
	  echo "Jenkins Node Name ${env.NODE_NAME}"
  
	  echo "Jenkins Home ${env.JENKINS_HOME}"
	  echo "Jenkins URL ${env.JENKINS_URL}"
	  echo "JOB Name ${env.JOB_NAME}"
	  
	  properties([
    buildDiscarder(logRotator(numToKeepStr: '3')),
    pipelineTriggers([
        pollSCM('* * * * *')
    ])
  ])
  
  def mavenHome = tool name: "maven3.6.2"
  
  stage('CheckoutCode')
  {
   git branch: 'development', credentialsId: 'c68e5748-bf4d-4a14-a25d-2af5c3efe5a0', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
  }
  
  stage('Build')
  {
   sh "${mavenHome}/bin/mvn clean package"
  }
  
  stage('SonarQubeReport')
  {
   sh "${mavenHome}/bin/mvn sonar:sonar"
  }
  
  stage('UploadArtifactsintoNexus')
  {
   sh "${mavenHome}/bin/mvn deploy"
  }
  
  stage('DeployAppintoTomcat')
  {
  sshagent(['31879477-4b08-4332-be9e-b8175f49b1a5']) 
  {
    sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@13.234.202.78:/opt/apache-tomcat-9.0.27/webapps/"  
  }
  }
  
  stage('SendEmailNotification')
  {
  emailext body: '''Build is over!!

  Regards,
  Mithun technologies,
  9980923226.
  ''', subject: 'Build is over!!!', to: 'devopstrainingblr@gmail.com'
  
  }

}
