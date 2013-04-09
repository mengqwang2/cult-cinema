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
    </body>
</html>
