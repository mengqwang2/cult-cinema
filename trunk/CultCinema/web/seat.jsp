<%-- 
    Document   : seat
    Created on : Apr 9, 2013, 1:41:47 PM
    Author     : 52165627
--%>

<%@page import="Bean.Reserve"%>
<%@page import="Utility.Opt"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Vector"%>
<%@page import="Bean.Section"%>
<%@page import="java.util.List"%>
<%@page import="Bean.Booking"%>
<%@page import="Bean.Venue"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%int memberID=(Integer)session.getAttribute("memberID");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seat</title>
        <script type="text/javascript">
            var seatBuy=new Array();
            for(var i=0;i<500;i++)
            {
                seatBuy[i]=0;
            }
            function savePurchase(current,id)
            {
                if(current==0)
                {
                    document.getElementById('t'+id).innerHTML="<a href=\"javascript:savePurchase(1,"+id+")\">X</a>";
                    seatBuy[id-1]=1;
                }
                else
                {
                    document.getElementById('t'+id).innerHTML="<a href=\"javascript:savePurchase(0,"+id+")\">O</a>";
                    seatBuy[id-1]=0;
                }
            }
            
            function finalPurchase(count)
            {
                var seatNo="";
                for(var i=0;i<count;i++)
                {
                    if(seatBuy[i]==1)
                    {
                        seatNo=seatNo+(i+1)+",";
                    }
                    
                }
                document.getElementById('seats').value=seatNo;
                document.getElementById('seat').value=seatNo;
            }
        </script>
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
                    memberID=(Integer)session.getAttribute("memberID");
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
        <div id='mainContainer'>
            <table>
                <%Venue v=(Venue)request.getAttribute("selectVenue"); 
                Section s=(Section) request.getAttribute("selectSection"); 
                int count=1;%>
                <table border='1'>
                <%for (int i=0;i<v.getRow();i++) { %>
                <tr>
                    <%for (int j=0;j<v.getColumn();j++) { %>
                    <td id='t<% out.print(count); %>'>
                        <% boolean fd=false;
                        List<Booking> bkings = (List<Booking>)request.getAttribute("lsBooking");
                        List<Reserve> rvs= (List<Reserve>)request.getAttribute("lsReserve");
                      for (Booking bking: bkings ){  
                         if(bking.getSeat()==count)
                         {
                             out.println("X");
                             fd=true;
                             break;
                         } 
                      }
                      for (Reserve rv: rvs ){  
                         if(rv.getSeat()==count)
                         {
                             out.println("X");
                             fd=true;
                             break;
                         } 
                      }
                      if(fd==false)
                          out.println("<a href=\"javascript:savePurchase(0,"+count+")\">O</a>");
                          
                        %>
                    </td>
                    <%count++;}%>
                </tr>
                <%}%>
            </table>
   
            <input type="button" value="Select!" onclick="finalPurchase(<%out.print(count-1);%>);" />
            
            <input type='hidden' name='sectionID' value='<% out.print(s.getSectionID()); %>' />
            <input type='hidden' name='seats' id="seats" value='' />
            
            <form action="reserve" method="post">
               <input type='hidden' name='SectionID' value='<% out.print(s.getSectionID()); %>' />
               <input type='hidden' name='seat' id="seat" value='' />
               <input type="submit" value="Add to shopping cart!" />
            </form>
            
            <form action="purchase" method="post">
                <input type='hidden' name='sectionID' value='<% out.print(s.getSectionID()); %>' />
                <input type='hidden' name='seats' id="seats" value='' />
                <input type='submit' value='Preview' />
            </form>
            <a href="movie.jsp">Back to view other movies!</a>
        </div>
                
         <div id="footer">
            <%  
                out.println(opt.showFooter());
            %>
        </div>
    </body>
</html>
