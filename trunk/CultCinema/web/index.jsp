<%-- 
    Document   : index
    Created on : Apr 6, 2013, 5:54:10 PM
    Author     : mengqwang
--%>

<%@page import="Utility.Opt"%>
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
            <% Opt opt=new Opt();
                if (session.isNew())
                {
                    out.println(opt.showNotLoginNav());
                }
            else
                {
                    int memberID=(Integer)session.getAttribute("memberID");
                    out.println(opt.showLoginNav(memberID));
                }
            %>
            
            
        </div>
        <div id="body">
             
            
            <div id="navigation">
                <ul>
                    <li>Home</li>

                    <li><a href="MovieDisplay?Action=MovieDisplay">Movies</a></li>
                    <li><a href="RefundControl">Refund</a>
                    <li><a href="MovieDisplay?Action=ManageMovie">Manage</a>
                </ul>
            </div>
            
        </div>
        <div id="footer">
            © Copyright 2013 Cult Cinema Inc
        </div>
    </body>
</html>
