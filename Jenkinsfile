node {
    def mavenHome = tool name : "maven3.8.1"
    
    stage ('CheckOutCode'){
        git branch: 'development', credentialsId: 'deeed662-5b9d-464c-8ca1-9df64017586e', url: 'https://github.com/Milind3597/maven-web-application.git'
    }
    
    stage ('Build'){
        sh "${mavenHome}/bin/mvn clean package"
    }
    
    stage ('ExecuteSonarQubeReport') {
      sh "${mavenHome}/bin/mvn sonar:sonar"    
    }
    
    stage ('uplodArtifactIntonexus') {
          sh "${mavenHome}/bin/mvn deploy"
    }
    
    stage ('DeployAppIntoTomcatServer') {
         sshagent(['8548fe14-1faf-4fbb-b5d8-f0c618cfeefc']) {
             sh "scp -o  StrictHostKeyChecking=no target/maven-web-application.war ec2-user@65.2.11.195:/opt/apache-tomcat-9.0.63/webapps"
         }
     }
    stage ('SendEmailNotification') {
        emailext body: '''Build Over 

Regards,
MilinD
8983191383''', subject: 'Build Over', to: 'milindtawati97@gmail.com,milindtavati97@gmail.com'
    }
    
}
