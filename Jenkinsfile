node 
{

def MavenHome=tool name: "Maven_3.8.4"                                                                                                   

stage( 'CheckoutCodeFromGitHub' )
{
git credentialsId: '114c982a-3837-4aeb-b343-b53335dfe920', url: 'https://github.com/ClassDev-Org/maven-web-application.git'

}

stage( 'BuildArtifcats' )

{
sh "${MavenHome}/bin/mvn clean package"
}
/*
stage( 'SonarQubeReport' )

{
sh "${MavenHome}/bin/mvn clean sonar:sonar"
}
stage( 'UploadToNexus' )

{
sh "${MavenHome}/bin/mvn deploy"
}

stage( 'DeployingToTomcat' )

{
sshagent(['cc77f162-bbcd-457e-9887-ff5264699dbf']) {
sh " scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@3.110.47.185:/opt/apache-tomcat-9.0.58/webapps/"
}
}
*/


}
