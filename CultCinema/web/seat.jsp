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
            
            function finalPurchase(count,type)
            {
                var seatNo="";
                for(var i=0;i<count;i++)
                {
                    if(seatBuy[i]==1)
                    {
                        var num=i+1;
                        seatNo=seatNo+num+",";
                    }
                    
                }
                if(type=="member"||type=="officer")
                {
                    document.getElementById('seats').value=seatNo;
                    document.getElementById('seat').value=seatNo;
                }
                else
                    document.getElementById('seat_m').value=seatNo;
            }
        </script>
        <link href="http://twitter.github.io/bootstrap/assets/css/bootstrap.css" rel="stylesheet">
    <link href="http://cdnjs.bootcss.com/ajax/libs/twitter-bootstrap/2.3.1/css/bootstrap.min.css" rel="stylesheet">

    <link href="http://twitter.github.io/bootstrap/assets/css/bootstrap-responsive.css" rel="stylesheet">
	<link href="./bst/index.css" rel="stylesheet">


    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="http://twitter.github.io/bootstrap/assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="http://twitter.github.io/bootstrap/assets/ico/apple-touch-icon-114-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="http://twitter.github.io/bootstrap/assets/ico/apple-touch-icon-72-precomposed.png">
                    <link rel="apple-touch-icon-precomposed" href="http://twitter.github.io/bootstrap/assets/ico/apple-touch-icon-57-precomposed.png">
                                   <link rel="shortcut icon" href="http://twitter.github.io/bootstrap/assets/ico/favicon.png">
  <style id="holderjs-style" type="text/css">.holderjs-fluid {font-size:16px;font-weight:bold;text-align:center;font-family:sans-serif;margin:0}

  
  </style>
    </head>
    <body>
        
        <div id="header">
            <% Opt opt=new Opt();  
              //  out.println(opt.showHeader());
            %>
        </div>
        <div id='loginNav'>
            <% 
                String type="";
                boolean loginStatus=true;
                if (session.isNew())
                {
                    out.println(opt.showNotLoginNav());
                    loginStatus=false;
                }
                else if(session.getAttribute("memberID")==null&&session.getAttribute("managerID")==null&&session.getAttribute("officerID")==null)
                {
                    out.println(opt.showNotLoginNav());
                    loginStatus=false;
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
        <div class="container" style=" position:relative;top:90px;">
            <% if(loginStatus==false)
            {  %>
            <a href="index.jsp">Please Log in First!</a>
            <% }
            
            else if(loginStatus==true)
            {  %>
            <table>
                <%Venue v=(Venue)request.getAttribute("selectVenue"); 
                Section s=(Section) request.getAttribute("selectSection"); 
                int count=1;%>
                
                <table border="1">
                    <tr>
                        <td>Screen</td>
                    </tr>
                </table>
                
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
            
            <table border="1">
                <tr>
                    <td>X</td>
                </tr>
            </table>
            <span>Booked</span>
            
            <table border="1">
                <tr>
                    <td>O</td>
                </tr>
            </table>
            <span>Available</span>
            <br/>
            
            <input type="button" value="Select!" onclick="finalPurchase(<%out.print(count-1);%>,'<% out.print(type);%>');" />
            
            <% if(type.equals("member")||type.equals("officer")) { %>
                <form action="reserve" method="post">
               <input type='hidden' name='SectionID' value='<% out.print(s.getSectionID()); %>' />
               <input type='hidden' name='seat' id="seat" value='' />
               <input type="submit" value="Add to shopping cart!" />
            </form>
            
            <form action="purchase" method="post">
                <input type='hidden' name='sectionID' value='<% out.print(s.getSectionID()); %>' />
                <input type='hidden' name="seats" id="seats" value='' />
                <input type='submit' value='Preview' />
            </form>
            <%   
            } 
            
            else { %>
             <form action="markSeat" method="post">
               <input type='hidden' name='SectionID_m' value='<% out.print(s.getSectionID()); %>' />
               <input type='hidden' name='seat_m' id="seat_m" value='' />
               <input type="submit" value="Mark!" />
              </form>
              <%  
              
             } %>  
             
             
           <% } %>
            <a href="movie.jsp">Back to view other movies!</a>
             <%  
                out.println(opt.showFooter());
            %>
        </div>
                
        
        
                             <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="./bst/jquery.js"></script>
    <script src="./bst/bootstrap-transition.js"></script>
    <script src="./bst/bootstrap-alert.js"></script>
    <script src="./bst/bootstrap-modal.js"></script>
    <script src="./bst/bootstrap-dropdown.js"></script>
    <script src="./bst/bootstrap-scrollspy.js"></script>
    <script src="./bst/bootstrap-tab.js"></script>
    <script src="./bst/bootstrap-tooltip.js"></script>
    <script src="./bst/bootstrap-popover.js"></script>
    <script src="./bst/bootstrap-button.js"></script>
    <script src="./bst/bootstrap-collapse.js"></script>
    <script src="./bst/bootstrap-carousel.js"></script>
    <script src="./bst/bootstrap-typeahead.js"></script>
    <script>
      !function ($) {
        $(function(){
          // carousel demo
          $('#myCarousel').carousel()
        })
      }(window.jQuery)
    </script>
    <script src="./bst/holder.js"></script>
    </body>
</html>
