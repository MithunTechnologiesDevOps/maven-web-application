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

}
   
  

