<%-- 
    Document   : editMovie
    Created on : Apr 14, 2013, 12:51:55 PM
    Author     : 52165627
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="ManageMovie" method="POST">
            <label>Name</label>
            <input type="text" name="Name"><br/>
            <label>Duration (Minutes) </label>
            <input type="text" name="Duration"><br/>
            <label>Description</label>
            <input type="text" name="Description"><br/>
            <label>Director</label>
            <input type="text" name="Director"><br/>
            <label>Cast</label>
            <input type="text" name="Cast"><br/>
            <label>Category</label>
            <input type="text" name="Category"><br/>
            <label>Language</label>
            <input type="text" name="Language"><br/>
            <label>Poster</label>
            <input type="file" name="Poster"><br/>
            <input type="hidden" name="action" value="AddMovie">
            <input type="submit" value="Add Movie">

        </form>
        <a href="manageMovie.jsp">Return to movie Management site</a>
    </body>
</html>
