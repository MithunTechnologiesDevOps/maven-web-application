<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MithunTechnologies- Home Page</title>
<link href="images/madhulogo.jpg" rel="icon">
</head>
</head>
<body>
<h1 align="center">Welcome to Madhu Software Solutions.chennampalli(vil),b.k.s (mdl), anantapur(dist),andhrapradesh. </h1>
<h1 align="center"> Madhu Software Solutions- Very Good Training center for DevOps with azure in anantapur,andrapradesh ,ph no : 8096604490 . India and also for Job Assitance Job Support also...Teaching Real Time scnerios</h1>
<h1 align="center"> hii every one </h1>
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
		<img src="images/mithunlogo.jpg" alt="" width="100">
	</span>
	<span style="font-weight: bold;">
		Mithun Technologies, 
		Martha Halli, Above ICICI Bank, Beside Meghana Foods,
		Bangalore,
		+91-9980923226
		devopstrainingblr@gmail.com
		<br>
		<a href="mailto:devopstrainingblr@gmail.com">Mail to Mithun Technologies</a>
	</span>
</div>
<hr>
	<p> Service : <a href="services/employee/getEmployeeDetails">Get Employee Details </p>
<hr>
<hr>
<p align=center>Mithun Technologies - Consultant, Training, Development Center.</p>
<p align=center><small>Copyrights 2019 by <a href="http://mithuntechnologies.com/">Mithun Technologies</a> </small></p>

</body>
</html>
