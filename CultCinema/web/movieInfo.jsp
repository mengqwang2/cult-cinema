<%-- 
    Document   : movieInfo
    Created on : 2013-4-7, 22:51:33
    Author     : Administrator
--%>

<%@page import="Utility.Opt"%>
<%@page import="java.util.List"%>
<%@page import="Bean.Section"%>
<%@page import="Bean.Movie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            /*
            function getSection()
              {
                Venue.value="id"; 
                var id=document.getElementById("sectionSelect").selectedIndex;
                         
            }
            */
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
        <% Movie movie=(Movie)request.getAttribute("movie");%>
        <ul>
            <img alt=""> 
        </ul>       
        <ul>
            <%=movie.getName()%>
        </ul>
        <ul>
            <li>Language: <%=movie.getLanguage()%></li>
            <li>Duration: <%=movie.getDuration()%></li>
            <li>Director: <%=movie.getDirector()%></li>
            <li>Category: <%=movie.getCategory()%></li>
            <li>Cast: <%=movie.getCast()%></li>
            <li>Description: <%=movie.getDescription()%></li>
        </ul>
        <form action="SeatDisplay" method="Post">            
                <select name="sectionSelect">
                <% List<Section> sections = (List<Section>)request.getAttribute("sections"); 
                      for (Section section: sections ){
                  %>     
                  <option value="<%=section.getSectionID()%>">
                       Venue: House <%=section.getVenueID()%>
                       Time: <%=section.getTime()%> 
                       Price: $<%=section.getPrice()%>          
                    </option>
                <% } %>      
                </select> 
                <input type="hidden" name="action" value="purchase">
                <input type="submit" value="Purchase">
        </form>
                
        </div>
        <div id="footer">
            <%  
            out.println(opt.showFooter());
            %>
        </div>
    </body>
</html>
