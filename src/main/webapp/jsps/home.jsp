<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CloudeNation- Home Page</title>
<link href="images/cnlogo.jpg" rel="icon">
</head>
</head>
<body>
<h1 align="center">Welcome to Cloude Nation Ph No: +91-9309201551,  Parbhani,MS,India.</h1>
<h1 align="center"> Cloude Nation - Very Good Training center for DevOps with AWS in Parbhani,MS,India.Teaching Real Time scnerios</h1>
<hr>
<br>
	<h1><h3> Server Side IP Address </h3><br>

<% 
String ip = "";
InetAddress inetAddress = InetAddress.getLocalHost();
ip = inetAddress.getHostAddress();
out.println("Server Host Name :: "+inetAddress.getHostName()); 
%>
<br>
<%out.println("Server IP Address :: "+ip);%>
</h1>
<br>
<h1><h3> Client Side IP Address </h3><br>
<%out.print( "Client IP Address :: " + request.getRemoteAddr() ); %><br>
<%out.print( "Client Name Host :: "+ request.getRemoteHost() );%><br></h1>
<hr>
<div style="text-align: center;">
	<span>
		<img src="images/cnlogo.jpg" alt="" width="100">
	</span>
	<span style="font-weight: bold;">
		Cloude Nation,
		Parbhani,
		+91-9309201551
		<br>
		<a href="mailto:cloudenation1551@gmail.com">Mail to Cloude Nation</a>
	</span>
</div>
<hr>
	<p> Service : <a href="services/employee/getEmployeeDetails">Get Employee Details </p>
<hr>
<hr>
<p align=center>Cloude Nation - Consultant, Training.</p>
<p align=center><small>Copyrights 2024 by <a href="http://cloudenation.com/">Cloude Nation,Parbhani</a> </small></p>

</body>
</html>
