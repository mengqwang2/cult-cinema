<%-- 
    Document   : purchase
    Created on : Apr 14, 2013, 1:40:25 PM
    Author     : mengqwang
--%>

<%@page import="Bean.Member"%>
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
        <script type='text/javascript'>
            function checkToPay(topay,lpts)
            {
                
                if((document.getElementById("loyalty").checked == true)&&(lpts/100<=topay))
                    document.getElementById('toPay').innerHTML=topay-lpts/100;
                else if((document.getElementById("loyalty").checked == true)&&(lpts/100>topay))
                    document.getElementById('toPay').innerHTML=0;
                else
                    document.getElementById("toPay").innerHTML=topay;
                
            }
    </script>
    </head>
    <body>
         <% Movie mv=(Movie)request.getAttribute("movieInfo");%>
         <% Booking bk=(Booking)request.getAttribute("bookingInfo");%>
         <% Venue v=(Venue)request.getAttribute("venueInfo");%>
         <% Section s=(Section)request.getAttribute("sectionInfo"); %>
         <% Member m=(Member)request.getAttribute("memberInfo"); %>
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
                           <% out.println(mv.getName()); %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Duration
                        </td>
                        <td>
                           <% out.println(mv.getDuration()); %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Category
                        </td>
                        <td>
                           <% out.println(mv.getCategory());%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            House
                        </td>
                        <td>
                           <% out.println(v.getHouse()); %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Time
                        </td>
                        <td>
                           <% out.println(s.getTime()); %>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            Seat
                        </td>
                        <td>
                           <% out.println(bk.getSeat());%>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            Amount
                        </td>
                        <td>
                           1
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            Total 
                        </td>
                        <td id='toPay'>
                            <% out.println(s.getPrice());%>
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
                            </select>
                            <br/>
                            <input type='checkbox' name='loyalty' id='loyalty' onclick='checkToPay(<%out.println(s.getPrice()); %>,<%out.println(m.getLoyalty());%>)'/>Use Loyalty Point
                        </td>
                    </tr>
                    
                    
                </tbody>
                
            </table>
                        <% int lpts=m.getLoyalty(); 
                        int price=s.getPrice();
                        int luse=0;
                        int ladd=0;
                        int payment=0;
                        if(price>=lpts/100)
                        {
                            luse=lpts;
                            ladd=(price-lpts/100)*10;
                            payment=price-lpts/100;
                        }
                        else
                        {
                            luse=price*100;
                            ladd=0;
                            payment=0;
                        }
 
                        %>
                        
                        <form action='confirmPurchase' method='post'>
                            <input type='hidden' name='seatNo' value='<% out.println(bk.getSeat());%>' />
                            <input type='hidden' name='memberID' value='<% out.println(m.getMemberID());%>'/>
                            <input type='hidden' name='sectionID' value='<% out.println(s.getSectionID());%>' />
                            <input type='hidden' name='loyaltyUse' value='<% out.println(luse);%>' />
                            <input type='hidden' name='loyalthAdd' value='<% out.println(ladd);%>' />
                            <input type='hidden' name='payment' value='<% out.println(payment);%>' />
                            <input type='submit' value='Purchase!' />
                        </form>
        </div>
    </body>
</html>
