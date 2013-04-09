<%-- 
    Document   : movie
    Created on : Apr 7, 2013, 2:34:23 PM
    Author     : 52165627
--%>


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
        <% List<Movie> movies = 
                (List<Movie>)request.getAttribute("movies"); 
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
           
            <td><a href="SectionDisplay?id=<%= movie.getUid()%>&movieID=<%= movie.getMovieID()%>">Buy Tickets</a></td>
        
        </tr>
        <% } %>
        </table>
        </form>
    </body>
</html>
