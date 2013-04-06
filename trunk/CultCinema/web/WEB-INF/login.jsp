<%-- 
    Document   : login
    Created on : Apr 6, 2013, 6:03:12 PM
    Author     : 52165627
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cult Cinema Inc.</title>
    </head>
    <body>
        <div id="header">
            <h1>
                Cult Cinema Inc
            </h1>        
        </div>
        <div id="navigation">
            <ul>
                <li>Home</li>
                <li>Movies</li>
            </ul>
        </div>
        <div id="body">
            <form name="F1" action="../index.jsp" method="post">
                <label> 
                    User Name:
                </label>
                <input type="text" id="userName"/>
                <label> 
                    Password:
                </label>
                <input type="password" id="password"/>
            </form>
            <a href="register.jsp">New User?</a>
        </div>
        <div id="footer">
            © Copyright 2013 Cult Cinema Inc
        </div>
    </body>
</html>
