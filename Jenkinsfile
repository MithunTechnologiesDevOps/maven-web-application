node
{
stage("SCM")
{
    git credentialsId: 'github_login', url: 'https://github.com/vinay-learing-class/Wallmart-Web-application.git'
}
stage("BUILD")
{
    sh 'mvn clean package'
}

stage("deploytoTomcat")
{
    sshagent(['Tomcat_server_pipeline']) 
    {
        
    sh 'scp /root/.jenkins/workspace/pipeline_dev/target/maven-web-application.war vinay@192.168.29.211:/opt/apache-tomcat-9.0.58/webapps/'
    }
}
   
    
}

