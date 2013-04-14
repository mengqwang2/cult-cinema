<%-- 
    Document   : manageSection
    Created on : Apr 14, 2013, 11:40:18 AM
    Author     : 52165627
--%>

<%@page import="Bean.Movie"%>
<%@page import="Bean.Section"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <table>
                <tr>
                    <td>Movie</td>                      
                    <td>Section ID</td>
                    <td>House</td>
                    <td>Time</td>
                    <td>Price $</td>
                    <td>Edit</td>
                    <td>Delete</td>
                </tr>    
                
                <% Movie movie=(Movie)request.getAttribute("movie");%>
                <% List<Section> sections = (List<Section>)request.getAttribute("sections"); 
                 for (Section section: sections ){
                %>
                    <tr>
                    <td><%=movie.getName()%></td>
                    <td><%=section.getSectionID()%></td>
                    <td><%=section.getVenueID()%></td>
                    <td><%=section.getTime()%> </td>
                    <td><%=section.getPrice()%></td>
                    <td><a href="ManageSection?id=<%= movie.getUid()%>&movieID=<%= movie.getMovieID()%>&action=EditSection">Edit Sections</a></td>
                    <td><a href="ManageSection?id=<%= movie.getUid()%>&movieID=<%= movie.getMovieID()%>&action=DeleteSection">Delete Sections</a></td>
                    </tr>
                <% } %>  
                
            </table>
            <a href="ManageSection?action=addSection">Add Section</a><br/>
            <a href="manageMovie.jsp">Return to movie Management site</a>
    </body>
</html>
