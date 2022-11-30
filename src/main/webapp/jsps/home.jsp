<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DevOps Training- Home Page</title>
<link href="images/DevOps.jpg" rel="icon">
</head>
</head>
<body>
<h1 align="center"> Hello Everyone...</h1>
<h1 align="center">Welcome to DevOps Training , This is our 6th batch training, Phone: 7842602230 from Rajampet,Kadapa, Andhra Pradesh</h1>
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
<hr>
<div style="text-align: center;">
	<span>
		<img src="images/DevOps.jpg" alt="" width="100">
	</span>
	<span style="font-weight: bold;">
		DevOps Online Training, 
		Trainer : Jeevan Dandoji,
		Rajampet-516115.
		Andra Pradesh.
		+91-7842602230
		djeevan12@gmail.com
		<br>
		<a href="mailto:devopstrainingblr@gmail.com">Mail to DevOps Online Training</a>
	</span>
</div>
<hr>
	<p> Service : <a href="services/employee/getEmployeeDetails">Get Employee Details </p>
<hr>
<hr>
<p align=center>DevOps - Consultant, Training, Development Center.</p>
<p align=center><small>Copyrights 2019 by <a href="http://DevOpstechnologies.com/">DevOps Online Training</a> </small></p>

</body>
</html>
