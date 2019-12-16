node('node1')
{
    echo "GitHub BranhName ${env.BRANCH_NAME}"
  echo "Jenkins Job Number ${env.BUILD_NUMBER}"
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
    
    def mavenHome=tool name:"maven"
    stage("codecheckout")
    {
    git credentialsId: 'f2423f19-dd9a-47f5-bce0-24d8c00448d7', url: 'https://github.com/maven-projects-mithun/maven-web-application.git'
    }
    stage("build")
    {
        sh "${mavenHome}/bin/mvn clean package"
    }
    /*
    stage("sonar")
    {
        sh "${mavenHome}/bin/mvn sonar:sonar"
    }
    stage("nexus")
    {
        sh "${mavenHome}/bin/mvn deploy"
    }
    stage("deploytotomcat")
    {
       sshagent(['15a71317-4944-483f-9444-ffd12e972604']) 
    {
        sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@52.66.247.50:/opt/apache-tomcat-9.0.29/webapps" 
    } 
    }
    stage("gmail")
    {
       emailext body: '''kwebfckjb
iugwef\'o''', subject: 'qubrfk', to: 'gypratapreddy@gmail.com' 
    }
    */
}
