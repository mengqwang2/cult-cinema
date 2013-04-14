<%-- 
    Document   : manager
    Created on : Apr 14, 2013, 11:15:19 AM
    Author     : 52165627
--%>

<%@page import="Bean.Movie"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
            <td><%=movie.getName()%></td>
            <td><a href="SectionDisplay?id=<%= movie.getUid()%>&movieID=<%= movie.getMovieID()%>&action=ManageMovie">Manage Section</a></td>
            <td><a href="ManageMovie?id=<%= movie.getUid()%>&movieID=<%= movie.getMovieID()%>&action=DeleteMovie">Delete Movie</a></td>
            <td><a href="ManageMovie?id=<%= movie.getUid()%>&movieID=<%= movie.getMovieID()%>&action=EditMovie">Edit Movie</a></td>
        </tr>
        <% } %>
        <tr>
            <td><a href="addMovie.jsp">Add movie</a></td>
        </tr>
        </table>
        </form>
    </body>
</html>
