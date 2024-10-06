<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MBR-Home-Page</title>
<link href="images/mbr.jpeg" rel="icon">
</head>
</head>
<body>
<h1 align="center">BHARATHREDDY_MBR</h1>
<h1 align="center">MBR</h1>
<h1>REDDY</h1>
<hr>
<br>
	<h1><h3>MBR Server Side IP Address </h3><br>
<h3>THIS IS BHARATHREDDY.....</h3>

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
	<span style="font-weight: bold; color="red">
		BHARATHREDDY
		<br>
		<a href="mbharathreddy1997@gmail.com">Mail to MBR</a>
	</span>
</div>
<hr>
	<p> Service : <a href="services/employee/getEmployeeDetails">Get Employee Details </p>
<hr>
<hr>
<p align=center>MBR</p>
<p align=center><small>Copyrights 2022 by <a href="http://bharathreddymbrr@gmail.com/">MBR,Bengaluru</a> </small></p>

</body>
</html>
