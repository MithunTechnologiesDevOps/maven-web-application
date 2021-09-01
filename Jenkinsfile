node{
    
    def  mavenHome = tool name: "maven3.8.2"
    
     
    
       echo "GitHub BranhName ${env.BRANCH_NAME}"
       echo "Jenkins Job Number ${env.BUILD_NUMBER}"
       echo "Jenkins Node Name ${env.NODE_NAME}"
  
       echo "Jenkins Home ${env.JENKINS_HOME}"
       echo "Jenkins URL ${env.JENKINS_URL}"
       echo "JOB Name ${env.JOB_NAME}"
    
    
    
    stage('checkoutcode')
    {
     git branch: 'development', credentialsId: '2066125d-56af-4bfe-b07d-5d9285d20283', url: 'https://github.com/naresh9542/maven-web-application.git'
    }
    
    
    stage('Build')
    {
     sh "${mavenHome}/bin/mvn clean package"
    }
    
    stage('sonarQubeReport'){
    sh "${mavenHome}/bin/mvn clean sonar:sonar"
    }
    
    stage('uploadArtifactIntoNexus'){
    sh "${mavenHome}/bin/mvn clean deploy"
    }
    
    stage('DeployAppIntoTomcatserver')
    {
    sshagent(['6b2a8084-d560-4fce-bd8d-1b0156c8df6d']) {
      sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@65.0.100.87:/opt/apache-tomcat-9.0.52/webapps"
    }    
    }
    
    stage('sendEmailNotification'){
        emailext body: '''Build is over !!

       regards 

       ravi tech''', subject: 'Build is over !!', to: 'nareshdevops9542@gmail.com'
    }
}
