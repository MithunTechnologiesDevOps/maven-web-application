<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MBRTechnologies- Home Page</title>
<link href="images/mbr.jpeg" rel="icon">
</head>
</head>
<body>
<h1 align="center" style="color: white; background-color: blue;">MAPR TECHNOLOGIES</h1>
<h1 align="center">Welcome to MBR Technologies. Ph No: +91-9980923226,+91-9900012028</h1>
<h1 align="center"> MBRTechnologies- Very Good Training center for DevOps & Cloud </h1>

<h2>  Name: Bharathreddy MBR</h2>
<h2> MAPR TECHNOLOGIES </h2>
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
		<img src="images/mbr.jpeg" alt="" width="100">
	</span>
	<span style="font-weight: bold;">
		MBR Technologies, 
		MBR Tech Park,
		Bangalore,
		+91-990000000,+91-990000000
		mbr@gmail.com
		<br>
		<a href="mailto:mbr@gmail.com">Mail to MBR Technologies</a>
	</span>
</div>
<hr>
	<p> Service : <a href="services/employee/getEmployeeDetails">Get Employee Details </p>
<hr>
<hr>
<p align=center>MBR Technologies - Consultant, Training, Development Center.</p>
<p align=center><small>Copyrights 2022 by <a href="http://mbr.com/">MBRTechnologies,Bengaluru</a> </small></p>

</body>
</html>
