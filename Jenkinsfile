node {
    def mavenHome = tool name: 'Maven-3.9.10'
    // Stage 1: Checkout code from GitHub
    stage('CheckoutCode') {
        git branch: 'development', 
            credentialsId: '76cfa28f-7bb1-4202-828f-7bef3c5197fc', 
            url: 'https://github.com/gopialuri24/maven-web-application.git'
    }

    // Stage 2: Build the project using Maven
    stage('Build') {
        sh "${mavenHome}/bin/mvn clean package"
    }
    
     stage('ExecuteSonarQubeReport') {
        sh "${mavenHome}/bin/mvn clean sonar:sonar"
    }
     stage('UploadtoNexus') {
        sh "${mavenHome}/bin/mvn clean deploy"
    }
    stage("DeployTomcat"){
        sshagent(['879d2335-ec52-478a-9e95-bda25855527f']) {
     sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.33.136:/opt/apache-tomcat-9.0.110/webapps"
}
    }
}
