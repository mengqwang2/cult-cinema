<%-- 
    Document   : seat
    Created on : Apr 9, 2013, 1:41:47 PM
    Author     : 52165627
--%>

<%@page import="java.util.List"%>
<%@page import="Bean.Booking"%>
<%@page import="Bean.Venue"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seat</title>
    </head>
    <body>
        <div id='mainContainer'>
            <table>
                <%Venue v=(Venue)request.getAttribute("selectVenue"); int count=1;%>
                <table border='1'>
                <%for (int i=0;i<v.getRow();i++) { %>
                <tr>
                    <%for (int j=0;j<v.getColumn();j++) { %>
                    <td>2222
                      
                        <%--  <% List<Booking> bkings = (List<Booking>)request.getAttribute("lsBooking"); 
                      for (Booking bking: bkings ){  
                         if(Integer.parseInt(bking.getSeat())==count)%>
                             <%="1"%>
                         <%else %>
                             <%="0"%>
                 --%>
                    </td>
                    <%count++;}%>
                </tr>
                <%}%>
            </table>
        </div>
    </body>
</html>
