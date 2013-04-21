<%-- 
    Document   : bkRecord
    Created on : Apr 21, 2013, 1:53:40 PM
    Author     : 52209388
--%>

<%@page import="Bean.Member"%>
<%@page import="Bean.Section"%>
<%@page import="Bean.Venue"%>
<%@page import="Bean.Movie"%>
<%@page import="java.util.List"%>
<%@page import="Bean.Booking"%>
<%@page import="Utility.Opt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Record</title>
    </head>
    <body>
        
        <% List<Movie> mv=(List<Movie>)request.getAttribute("movieInfo");%>
 
         <% List<Venue> v=(List<Venue>)request.getAttribute("venueInfo");%>

         <% List<Section> s=(List<Section>)request.getAttribute("sectionInfo"); %>
 
         <% Member m=(Member)request.getAttribute("memberInfo"); %>

         <% List<Booking> bk=(List<Booking>)request.getAttribute("bookingInfo"); %>
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
            
            
            <div id="mainContainer">
                <% int count=0; 
            
            %>
 
            <% for (Booking bks:bk)

            { %>

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

                           <% out.println(mv.get(count).getName()); %>
 
                        </td>

                    </tr>

                    <tr>

                        <td>

                            Duration
 
                        </td>

                        <td>

                           <% out.println(mv.get(count).getDuration()); %>

                        </td>
 
                    </tr>

                    <tr>

                        <td>

                            Category

                        </td>
 
                        <td>

                           <% out.println(mv.get(count).getCategory());%>

                        </td>

                    </tr>
 
                    <tr>

                        <td>

                            House

                        </td>

                        <td>
 
                           <% out.println(v.get(count).getHouse()); %>

                        </td>

                    </tr>

                    <tr>

                         <td>

                            Time

                        </td>

                        <td>

                           <% out.println(s.get(count).getTime()); %>
 
                        </td>

                    </tr>

                    

                    <tr>

                        <td>

                            Seat
 
                        </td>

                        <td>

                       

                           <% out.println(bks.getSeat()); %>

                        </td>
 
                    </tr>

                    

                    <tr>

                        <td>

                            Price

                        </td>
 
                        <td>

                           <% out.println(s.get(count).getPrice()); %>

                        </td>

                    </tr>
                    
                    <tr>

                        <td>

                            Pay

                        </td>
 
                        <td>

                           <% out.println(bks.getPayment()); %>

                        </td>

                    </tr>

        

                </tbody>

                
            </table>
              
            <form action="memberRefund" method="post">
              
                    <input type="hidden" name="issueID" value="<% out.print(bks.getIssueID());%>" />
            <% if(bks.getStatus().equals("P"))
               { %>
                    <input type="submit" value="Ask Refund!" />
               <% } 
            else if(bks.getStatus().equals("RP")) 
               { %>
               <p>Refund request has been submitted!</p>     
                    <input type="submit" value="Cancel Request for Refund!" />

               <% } %>
               </form>
            <% count++;} %>
            </div>
           
        <div id="footer">
            <%  
            out.println(opt.showFooter());
            %>
        </div>
    </body>
</html>

