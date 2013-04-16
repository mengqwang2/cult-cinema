<%-- 
    Document   : register
    Created on : Apr 6, 2013, 6:03:22 PM
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
        
        <div id="body">
            <h2>Register</h2>
            <div id="register">
                <form name ="frmRegister" action='register_check' method='POST'>

                    <fieldset>
                        <input type="hidden" name="todo" id="todo" value="" />
                        <label for="register-text">Name</label>
                        <input type="text" name='name' id='name' />
                        <label for="register-text">Password</label>
                        <input type="password" name='password' id='password'/>
                        <label for="register-text">Address</label>
                        <input type="text" name='address' id='address'/>
                        <label for="register-text">Tel</label>
                        <input type="text" name='tel' id='tel'/>
                        <label for="register-text">Gender</label>
                        <label for="register-text">Male</label>
                        <input type="radio" name="gender" id="male" value="male"/>
                        <label for="register-text">Female</label>
                        <input type="radio" name="gender" id="female" value="female"/>
                        <label for="register-text">Email</label>
                        <input type="text" name='email' id='email'/>
                    </fieldset>

                    <input type="submit" name="submit" value="Register" />
           
                </form>
                
                
            </div>
            
        </div>
        <div id="footer">
            © Copyright 2013 Cult Cinema Inc
        </div>
    </body>
</html>
