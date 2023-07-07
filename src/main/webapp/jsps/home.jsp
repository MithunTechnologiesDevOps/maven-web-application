<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>New Page Title</title>
<link href="images/newlogo.jpg" rel="icon">
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }
    .container {
        max-width: 400px;
        margin: 50px auto;
        padding: 20px;
        border: 1px solid #ccc;
        background-color: #f5f5f5;
    }
    h1 {
        text-align: center;
    }
    label, input {
        display: block;
        margin-bottom: 10px;
    }
    input[type="submit"] {
        background-color: #3897f0;
        color: #fff;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
    }
    .logout-btn {
        background-color: #f44336;
    }
</style>
</head>
<body>
    <h1 align="center">Welcome to Our Website. Contact us at +1-1234567890, Address: 123 Main St, Anytown, USA </h1>
    <h1 align="center">We provide excellent services and training for various technologies. Contact us for more information.</h1>
    <hr>
    <br>
    <h1><h3> Server Side IP Address </h3><br>

    <% 
    String ip = "";
    InetAddress inetAddress = InetAddress.getLocalHost();
    ip = inetAddress.getHostAddress();
    out.println("Server Host Name: " + inetAddress.getHostName()); 
    %>
    <br>
    <%out.println("Server IP Address: " + ip);%>
    </h1>
    <br>
    <h1><h3> Client Side IP Address </h3><br>
    <%out.print("Client IP Address: " + request.getRemoteAddr()); %><br>
    <%out.print("Client Name Host: "+ request.getRemoteHost());%><br></h1>
    <hr>
    <div class="container">
        <h1>Instagram</h1>
        <form id="login-form" action="login.php" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <input type="submit" value="Login">
        </form>
        <form id="logout-form" action="logout.php" method="post" style="display: none;">
            <input type="submit" class="logout-btn" value="Logout">
        </form>
        <form id="add-account-form" action="add_account.php" method="post" style="display: none;">
            <label for="new-username">New Username:</label>
            <input type="text" id="new-username" name="new-username" required>
            <label for="new-password">New Password:</label>
            <input type="password" id="new-password" name="new-password" required>
            <input type="submit" value="Add Account">
        </form>
    </div>
    <hr>
    <div style="text-align: center;">
        <span>
            <img src="images/newlogo.jpg" alt="" width="100">
        </span>
        <span style="font-weight: bold;">
            Our Company, 
            Anytown, USA,
            +1-1234567890
            contact@example.com
            <br>
            <a href="mailto:contact@example.com">Mail to Our Company</a>
        </span>
    </div>
    <hr>
    <p> Service : <a href="services/employee/getEmployeeDetails">Get Employee Details</a></p>
    <hr>
    <hr>
    <p align=center>Our Company - Consultant, Training, Development Center.</p>
    <p align=center><small>© 2023 <a href="http://example.com/">Our Company</a></small></p>

    <script>
        var loginForm = document.getElementById("login-form");
        var logoutForm = document.getElementById("logout-form");
        var addAccountForm = document.getElementById("add-account-form");

        loginForm.addEventListener("submit", function(event) {
            event.preventDefault();
            // Perform login logic
            // ...

            // Show logout and add account forms
            loginForm.style.display = "none";
            logoutForm.style.display = "block";
            addAccountForm.style.display = "block";
        });

        logoutForm.addEventListener("submit", function(event) {
            event.preventDefault();
            // Perform logout logic
            // ...

            // Show login form, hide logout and add account forms
            loginForm.style.display = "block";
            logoutForm.style.display = "none";
            addAccountForm.style.display = "none";
        });

        addAccountForm.addEventListener("submit", function(event) {
            event.preventDefault();
            // Perform add account logic
            // ...

            // Clear input fields
            addAccountForm.reset();
        });
    </script>
</body>
</html>
