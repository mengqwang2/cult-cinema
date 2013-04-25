<%-- 
    Document   : forgetPass
    Created on : Apr 25, 2013, 11:36:34 AM
    Author     : 52209388
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forget Password</title>
    </head>
    <body>
        <% String action=(String)request.getAttribute("action");
        if(action==null){
        %>
        <form action="forgetPass" method="post">
            Member ID: <input type="text" name="memberID" value="" />
            <input type="submit" value="submit" />
        </form>
        <% }
        else if(action.equals("newPass")){ %>
        <p>Your new password is set as your telephone number!</p>
        <a href="index.jsp">Back to Index!</a>
        <% } %>
        
    </body>
</html>
