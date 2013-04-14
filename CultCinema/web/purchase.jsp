<%-- 
    Document   : purchase
    Created on : Apr 14, 2013, 1:40:25 PM
    Author     : mengqwang
--%>

<%@page import="Bean.Section"%>
<%@page import="Bean.Venue"%>
<%@page import="Bean.Booking"%>
<%@page import="Bean.Movie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Purchase</title>
    </head>
    <body>
         <% Movie mv=(Movie)request.getAttribute("movieInfo");%>
         <% Booking bk=(Booking)request.getAttribute("bookingInfo");%>
         <% Venue v=(Venue)request.getAttribute("venueInfo");%>
         <% Section s=(Section)request.getAttribute("sectionInfo"); %>
        <div id="mainContainer">
            <table border="1">
                <caption>Ticket Information</caption>
                <thead>
                    <tr>
                        <th>
                            Item
                        </th>
                        <th>
                            Detail
                        </th>
                    </tr>    
                </thead>
                <tbody>
                    <tr>
                        <td>
                            Name
                        </td>
                        <td>
                           <% mv.getName(); %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Duration
                        </td>
                        <td>
                           <% mv.getDuration(); %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Category
                        </td>
                        <td>
                           <% mv.getCategory();%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            House
                        </td>
                        <td>
                           <% v.getHouse(); %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Time
                        </td>
                        <td>
                           <% s.getTime(); %>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            Seat
                        </td>
                        <td>
                           <% bk.getSeat();%>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            Payment
                        </td>
                        <td>
                            <select>
                                <option>
                                    Cash
                                </option>
                                <option>
                                    Credit Card
                                </option>
                                <option>
                                    Loyalty Point
                                </option>
                            </select>
                        </td>
                    </tr>
                    
                    
                </tbody>
                
            </table>
        </div>
    </body>
</html>
