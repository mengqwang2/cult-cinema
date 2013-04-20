<%-- 
    Document   : formate
    Created on : Apr 20, 2013, 4:22:29 PM
    Author     : 52165627
--%>

<%@page import="Bean.Section"%>
<%@page import="Bean.Movie"%>
<%@page import="Utility.Opt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
        <% Section s=(Section)request.getAttribute("section"); %>
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
            
            <form action="ManageSection" method="POST">
                <label>Movie name</label>
                <input name="movieName" value="<%=request.getAttribute("name")%>"><br/>    
                <label>Time</label>
                <input name="time" value="<%=s.getTime()%>"><br/>    
                <label>Venue</label>
                <input name="venue" value="<%=s.getVenueID()%>"><br/>    
                <label>Price $</label>
                <input name="price" value="<%=s.getPrice()%>"><br/>   
                <input type="hidden" name="action" value="UpdateSection">
                <input type="hidden" name="sectionID" value="<%=s.getSectionID()%>">
                <input type="hidden" name="movieID" value="<%=s.getMovieID()%>">
                <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
                <input type="submit" value="Edit section">
            </form>
            <a href="MovieDisplay">Return to movie management site</a>
        </div>
        <div id="footer">
            <%  
            out.println(opt.showFooter());
            %>
        </div>
        </body>
</html>
