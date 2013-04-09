<%-- 
    Document   : movieInfo
    Created on : 2013-4-7, 22:51:33
    Author     : Administrator
--%>

<%@page import="java.util.List"%>
<%@page import="Bean.Section"%>
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
        <ul>
            <li>
                <select>
                <% List<Section> sections = (List<Section>)request.getAttribute("sections"); 
                      for (Section section: sections ){
                  %>     
                    <option>
                       Time: <%=section.getTime()%> 
                       Price: $<%=section.getPrice()%>          
                    </option>
                <% } %>      
                </select> 
            </li>
        </ul>       
    </body>
</html>
