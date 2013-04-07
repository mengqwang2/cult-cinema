<%-- 
    Document   : movie
    Created on : Apr 7, 2013, 2:34:23 PM
    Author     : 52165627
--%>


<%@page import="java.util.List"%>
<%@page import="Bean.Movie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.moviedisplay"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <% List<Movie> movies = 
                (List<Movie>)request.getAttribute("movies"); 
        for (Movie movie: movies ){
        %>
        <ul>
            <li><%=movie.getName()%></li>
            <li><%=movie.getDuration()%></li>
            <li><%=movie.getDirector()%></li>
        </ul>
        <% } %>
    </body>
</html>
