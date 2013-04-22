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
            <%@include file="/header.jsp" %>           
        </div>
            <div id='loginNav'>
            <% Opt opt=new Opt();
                String type="";
                if (session.isNew())
                {
                    out.println(opt.showNotLoginNav());
                }
                else if(session.getAttribute("memberID")==null&&session.getAttribute("managerID")==null&&session.getAttribute("officerID")==null)
                {
                    out.println(opt.showNotLoginNav());
                }
                else if(session.getAttribute("memberID")!=null)
                {
                    int memberID=(Integer)session.getAttribute("memberID");
                    out.println(opt.showLoginNav(memberID));
                    type="member";
                }
                else if(session.getAttribute("managerID")!=null)
                {
                    String managerID=(String)session.getAttribute("managerID");
                    out.println(opt.showLoginNav(managerID));
                    type="manager";
                }
                else if(session.getAttribute("officerID")!=null)
                {
                    String officerID=(String)session.getAttribute("officerID");
                    out.println(opt.showLoginNav(officerID));
                    type="officer";
                }
            %>
            
            </div>
                        
            <div id="navigation">
                
                <% 
                    out.println(opt.showItem(type));
                %>
            </div>
            
            
            <div id="mainContainer">
                <p>
                    Movie Information to be displayed here! :)
                </p>
                <a href="MovieDisplay?Action=MovieDisplay">More movies!</a>
            </div>
           
        <div id="footer">
            <%@include file="/footer.jsp" %>
        </div>
    </body>
</html>
