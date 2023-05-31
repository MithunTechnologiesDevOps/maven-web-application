node
{
    def mavenHome = tool name: "maven3.8.2"
    stage('CheckOutCode'){
        
        git branch: 'development', credentialsId: '3436721d-5fa8-4ac3-a8d4-46153bdb69bb', url: 'https://github.com/manjeshnayak/maven-web-application.git'
    }
    stage('Build'){
        sh "${mavenHome}/bin/mvn clean package"
    }
    
     stage('SonarqubeReport'){
        sh "${mavenHome}/bin/mvn clean sonar:sonar"
    }
     stage('uploadToNexusartifactRepo'){
        sh "${mavenHome}/bin/mvn clean deploy"
    }
    
    stage('DeployToTomcat'){
        sshagent(['4dec5575-10d3-4837-bde3-abf70e6c4b1b']) {
    sh "scp -o  StrictHostKeyChecking=no target/maven-web-application.war ubuntu@54.81.61.145:/opt/apache-tomcat-9.0.75/webapps"
}
    }
    
    
}
