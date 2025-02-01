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
<h1 style="text-align: center; color: white; background-color: blue; padding: 5px;">MAPR TECHNOLOGIES</h1>
<h1 style="text-align: center; color: white; background-color: blue; padding: 5px;">Welcome to MBR Technologies.  </h1>
<h1 align="center"> MBR Technologies- Very Good  Leading Company in Bharat .... </h1>
<h5 style="text-align: right;">Ph No: +91-9980923226, +91-9900012028</h5>

<h2 style="font-weight: bold;">  Name: Bharathreddy MBR</h2>
<h2 style="font-weight: bold;"> MAPR TECHNOLOGIES </h2>
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
<h5 style="text-align: right; font-weight: bold;">Email:mapr@gmail.com,mbr@gmail.com,bmr@gmail.com</h5>
<h5 style="text-align: right; font-weight: bold;">Address: MBR Tech Park banaglore-564321</h5>
	<span>
		<img src="images/mbr.jpeg" alt="" width="50">
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
