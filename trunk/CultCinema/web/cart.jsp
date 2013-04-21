<%-- 

    Document   : cart

    Created on : Apr 20, 2013, 6:38:57 PM

    Author     : 52209388

--%>




<%@page import="Bean.Reserve"%>
 
<%@page import="java.util.List"%>

<%@page import="Bean.Member"%>

<%@page import="Bean.Section"%>

<%@page import="Bean.Venue"%>
 
<%@page import="Bean.Movie"%>

<%@page import="Utility.Opt"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
 
<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Shopping Cart</title>
 
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

         <% List<Movie> mv=(List<Movie>)request.getAttribute("movieInfo");%>
 
         <% List<Venue> v=(List<Venue>)request.getAttribute("venueInfo");%>

         <% List<Section> s=(List<Section>)request.getAttribute("sectionInfo"); %>
 
         <% Member m=(Member)request.getAttribute("memberInfo"); %>

         <% List<Reserve> rvBooking=(List<Reserve>)request.getAttribute("lsReserve"); %>
 
         <% int total=0; 

         %>

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
            String sectionStr="";
            String seatStr="";
            String payStr="";
            %>
 
            <% for (Reserve rvb:rvBooking)

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

                       

                           <% out.println(rvb.getSeat()); %>

                        </td>
 
                    </tr>

                    

                    <tr>

                        <td>

                            Amount

                        </td>
 
                        <td>

                           <% out.println(s.get(count).getPrice()); %>

                        </td>

                    </tr>

        

                </tbody>

                <% total+=s.get(count).getPrice(); 
                seatStr=seatStr+rvb.getSeat()+",";
                sectionStr=sectionStr+s.get(count).getSectionID()+",";
                payStr=payStr+s.get(count).getPrice()+",";
                %>

                

            </table>

                <form action="removeRv" method="post">
 
                    <input type="hidden" name="sectionID" value="<% out.print(s.get(count).getSectionID());%>" />

                    <input type="hidden" name="seat" value="<% out.print(rvb.getSeat());%>" />

                    <input type="submit" value="Remove" />

                </form>

                

            

            <% count++;} %>
 
            

            <p>Total Price: 

                <span id="total"><% out.print(total); %></span>

            </p>

            <p>To Pay:
 
                <span id="toPay"><% out.print(total); %></span>

            </p>

            <input type='checkbox' name='loyalty' id='loyalty' onclick='checkToPay(<%out.print(total); %>,<%out.print(m.getLoyalty());%>)'/>Use Loyalty Point
            
            <% int lpts=m.getLoyalty(); 
          
                        int luse=0;
                        int ladd=0;
                        if(total>=lpts/100)
                        {
                            luse=lpts;
                            ladd=(total-lpts/100)*10;
                        }
                        else
                        {
                            luse=total*100;
                            ladd=0;
                        }
                        %>
                        
            <form action="confirmPurchase" method="post">
                <input type='hidden' name='SectionID' value='<% out.print(sectionStr);%>' />
                <input type='hidden' name='loyaltyUse' value='<% out.print(luse);%>' />
                <input type='hidden' name='loyaltyAdd' value='<% out.print(ladd);%>' />
                <input type="hidden" name="seat" value="<% out.print(seatStr);%>" />
                <input type="hidden" name="price" value="<% out.print(payStr);%>" />
                <input type="submit" value="Purchase!" />
            </form>
            

            

        </div>

        

        <div id="footer">

            <%  

                out.println(opt.showFooter());
 
            %>

        </div>

    </body>

</html>