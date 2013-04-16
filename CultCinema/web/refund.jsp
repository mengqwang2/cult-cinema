<%-- 
    Document   : refund
    Created on : Apr 9, 2013, 5:35:30 PM
    Author     : 52165627
--%>

<%@page import="Bean.Booking"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        
        <div if="mainContainer">
        <form action="" method="post">
            <table>
                
            
            <% 
            List<Booking> Refunds= 
                (List<Booking>)session.getAttribute("refunds"); 
            %>
        <%
        for (Booking refund: Refunds ){
        %><tr>
            <td>Issue ID: <%=refund.getIssueID()%></td>
            <td>Section ID: <%=refund.getSectionID()%></td>
            <td>Seat: <%=refund.getSeat()%></td>
            <td>Payment: <%=refund.getPayment()%></td>
            <td>Member ID: <%=refund.getMemberID()%></td>
            <td><a href="ConfirmRefund?IssueID=<%=refund.getIssueID()%>">Confirm Refund</td>
        </tr> 
        <% } %>
        </table>
        </form>
        
        </div>
        <div id="footer">
            <%  
            out.println(opt.showFooter());
            %>
        </div>
    </body>
</html>
