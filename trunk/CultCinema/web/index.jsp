<%-- 
    Document   : index
    Created on : Apr 6, 2013, 5:54:10 PM
    Author     : mengqwang
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
            <div id="login">
                <form name ="frmLogin" action='j_security_check' method='POST'>

            <fieldset>
                <input type="hidden" name="todo" id="todo" value="" />
                <label for="login-text">Username</label>
                <input type="text" name='j_username' id='j_username' />
                <label for="login-text">Password</label>
                <input type="password" name='j_password' id='j_password'/>
            </fieldset>

            <input type="submit" name="submit" value="Login" />
           
        </form>
            </div>
            </div>
            <div id="navigation">
                <ul>
                    <li>Home</li>
                    <li>Movies</li>
                </ul>
            </div>
        <div id="body"></div>
        <div id="footer">
            © Copyright 2013 Cult Cinema Inc
        </div>
    </body>
</html>
