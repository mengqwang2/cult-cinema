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
        <form name="movie display">
        <table>
            <caption>Movies</caption>
            <tr>
                <% Movie movie=(Movie)request.getAttribute("movie");
                %>
                <td><img alt=""></td>
                <td><%=movie.getName()%> language <%=movie.getLanguage()%></td>
            </tr>
            <tr>
                <td><%=movie.getDescription()%></td>
            <tr/>
                <select>
                <option>
                    <% List<Section> sections = (List<Section>)request.getAttribute("sections"); 
                        for (Section section: sections ){
                    %>
                    <select>
                        <%=section.getTime()%> 
                        <%=section.getPrice()%>
                    </select>
                </option>
                </select>
                </td>
        </table>    
        </form>
    </body>
</html>
