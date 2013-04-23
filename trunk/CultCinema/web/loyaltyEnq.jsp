<%-- 
    Document   : loyaltyEnq
    Created on : Apr 21, 2013, 1:53:30 PM
    Author     : 52209388
--%>

<%@page import="Bean.Member"%>
<%@page import="Utility.Opt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Section Management</title>
    </head>
    
    <body>
        <div id="header">
            <% Opt opt=new Opt();  
            out.println(opt.showHeader());
            %>
        </div>
        <div id='loginNav'>
            <% 
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
                    out.println(opt.showLoginNav(managerID,0));
                    type="manager";
                }
                else if(session.getAttribute("officerID")!=null)
                {
                    String officerID=(String)session.getAttribute("officerID");
                    out.println(opt.showLoginNav(officerID,1));
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
            <% Member m=(Member)request.getAttribute("memberInfo"); %>
            <h1>Available Loyalty Point to Use is: <% out.print(m.getLoyalty()); %></h1>
            <h2>Rules for Loyalty Point</h2>
            <p>
            1. Loyalty Point LP(100) can be used to exchanged 1 HKD;
            </p>
            <p>
            2. It can only be used in the movie specified;
            </p>
            <p>
            3. All the explanations are from Cult-Cinema Corp.
            </p>
            
        </div>
        <div id="footer">
            <%  
            out.println(opt.showFooter());
            %>
        </div>
        </body>
</html>
