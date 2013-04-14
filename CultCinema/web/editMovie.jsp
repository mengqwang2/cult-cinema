<%-- 
    Document   : editMovie
    Created on : Apr 14, 2013, 1:19:05 PM
    Author     : 52165627
--%>

<%@page import="Bean.Movie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% Movie movie=(Movie)request.getAttribute("movie");%>
        <form action="ManageMovie" method="post">
            <label>Name</label>
            <input type="text" name="Name" value="<%=movie.getName()%>"><br/>
            <label>Duration (Minutes) </label>
            <input type="text" name="Duration" value="<%=movie.getDuration()%>"><br/>
            <label>Description</label>
            <input type="text" name="Description" value="<%=movie.getDescription()%>"><br/>
            <label>Director</label>
            <input type="text" name="Director" value="<%=movie.getDirector()%>"><br/>
            <label>Cast</label>
            <input type="text" name="Cast" value="<%=movie.getCast()%>"><br/>
            <label>Category</label>
            <input type="text" name="Category" value="<%=movie.getCategory()%>"><br/>
            <label>Language</label>
            <input type="text" name="Language" value="<%=movie.getLanguage()%>"><br/>
            <label>Poster</label>
            <input type="text" name="Poster" value="<%=movie.getPoster()%>"><br/>
            <input type="hidden" name="action" value="UpdateMovie">
            <input type="hidden" name="movieID" value="<%=movie.getMovieID()%>">
            <input type="submit" value="Edit Movie">
        </form>
        <a href="manageMovie.jsp">Return to movie Management site</a>
    </body>
</html>
