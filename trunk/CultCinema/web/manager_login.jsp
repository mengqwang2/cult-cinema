<%-- 
    Document   : manager_login
    Created on : Apr 16, 2013, 11:28:47 AM
    Author     : mengqwang
--%>

<%@page import="Utility.Opt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login</title>
    </head>
    <body>
       <div id="header">
            <h1>
                Cult Cinema Inc
            </h1>  
            
            <% Opt opt=new Opt();%>
            <% out.println(opt.showNotLoginNav());%>
        </div>
        <div id="body">
              
             <div id="login">
                <form name ="frmLogin" action='login_check' method='POST'>

                <fieldset>
                    <input type="hidden" name="todo" id="todo" value="" />
                    <label for="login-text">Username</label>
                    <input type="text" name='j_username' id='j_username' />
                    <label for="login-text">Password</label>
                    <input type="password" name='j_password' id='j_password'/>
                    <input type='hidden' name='user_type' value='manager' />
                </fieldset>

                <input type="submit" name="submit" value="Login" />
           
                </form>
            </div>
            
            <div id='forgetPass'>
                <a href='forgetPass.jsp'>Forget Password?</a>
            </div>
            
        </div>
        
        <div id="footer">
            © Copyright 2013 Cult Cinema Inc
        </div>
        
        
        
    </body>
</html>
