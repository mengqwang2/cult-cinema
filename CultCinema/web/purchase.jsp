<%-- 
    Document   : purchase
    Created on : Apr 14, 2013, 1:40:25 PM
    Author     : mengqwang
--%>

<%@page import="Utility.Opt"%>
<%@page import="java.util.List"%>
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
         <% List<Booking> bk=(List<Booking>)request.getAttribute("bookingInfo");%>
         <% Venue v=(Venue)request.getAttribute("venueInfo");%>
         <% Section s=(Section)request.getAttribute("sectionInfo"); %>
         <% Member m=(Member)request.getAttribute("memberInfo"); %>
         <% Integer nSeats=(Integer)request.getAttribute("nSeats"); %>
         <% String seatNo=(String)request.getAttribute("seats");%>
         
         
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
                       
                           <% 
                           for(Booking bks:bk)
                           {
                               out.println(bks.getSeat());
                           }
                           %>  
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            Amount
                        </td>
                        <td>
                           <% out.println(nSeats);%>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            Total 
                        </td>
                        <td id='toPay'>
                            <% int toPay=s.getPrice()*nSeats;%>
                            <% out.println(toPay);%>
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
                        
                        <form action='reserve' method='post'>                           
                            <input type='hidden' name='SectionID' value='<% out.print(s.getSectionID());%>' />
                            <input type="hidden" name="seat" value="<% out.print(seatNo);%>">
                            <input type='submit' value='Go to Shopping Cart to Purchase!' />
                            
                        </form>
                        <a href="movie.jsp">View Other Movies!</a>
        </div>
                            
                            
         <div id="footer">
            <%  
            out.println(opt.showFooter());
            %>
        </div>
    </body>
</html>
