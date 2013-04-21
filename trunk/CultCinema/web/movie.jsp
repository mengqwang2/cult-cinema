<%-- 
    Document   : movie
    Created on : Apr 7, 2013, 2:34:23 PM
    Author     : 52165627
--%>


<%@page import="Utility.Opt"%>
<%@page import="java.util.List"%>
<%@page import="Bean.Movie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.MovieDisplay"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="header">
            <%@include file="/header.jsp" %>         
        </div>
        <div id='loginNav'>
            <% Opt opt=new Opt();  
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
        <% List<Movie> movies = 
                (List<Movie>)session.getAttribute("movies"); 
        %>
        <form name="movie">
            <table id="movie_table">
        <thead>Movies</thead>
        <%
        for (Movie movie: movies ){
        %>
        
        <tr>
            <td><img alt=""></td>
            <td><%=movie.getName()%> language <%=movie.getLanguage()%></td>
           
            <td><a href="SectionDisplay?id=<%= movie.getUid()%>&movieID=<%= movie.getMovieID()%>&action=ViewSection">Buy Tickets</a></td>
        
        </tr>
        <% } %>
        </table>
        </form>
        </div>
        
        <div id="footer">
            <%  
            out.println(opt.showFooter());
            %>
        </div>
    </body>
</html>
