<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Greens Technologies - Home Page</title>
<link href="images/greentechlogo.jpg" rel="icon">
</head>

<body>

<h1 align="center">Welcome to Greens Technologies</h1>
<h1 align="center">Phone Number: +91 9980923216</h1>
<h1 align="center">
    Greens Technologies is a Very Good Training Center for DevOps, Cloud,
    Kubernetes and Terraform
</h1>

<h1 align="center">Trainer Name: Anandhakumar</h1>

<hr><br>

<h3>Server Side IP Address</h3>
<%
    InetAddress inetAddress = InetAddress.getLocalHost();
    String ip = inetAddress.getHostAddress();
    out.println("Server Host Name :: " + inetAddress.getHostName());
%>
<br>
<%= "Server IP Address :: " + ip %>

<br><br>

<h3>Client Side IP Address</h3>
<%= "Client IP Address :: " + request.getRemoteAddr() %><br>
<%= "Client Host Name :: " + request.getRemoteHost() %>

<hr>

<div style="text-align: center;">
    <span>
        <img src="images/greentechlogo.jpg" alt="" width="100">
    </span>
    <span style="font-weight: bold;">
        Greens Technologies,<br>
        Marathahalli,<br>
        Bengaluru,<br>
        +91 9980923216<br>
        Devopstrainingblr@gmail.com<br>
        <a href="mailto:Devopstrainingblr@gmail.com">Mail to Greens Technologies</a>
    </span>
</div>

<hr>

<p>
    Service :
    <a href="services/employee/getEmployeeDetails">Get Employee Details</a>
</p>

<hr>

<p align="center">
    Greens Technologies - Consultant, Training and Development Center.
</p>

<p align="center">
    <small>
        Copyright © 2025 by
        <a href="http://greenstechnologies.com/">Greens Technologies, Bengaluru</a>
    </small>
</p>

</body>
</html>
