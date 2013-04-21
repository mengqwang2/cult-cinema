<%-- 
    Document   : manageSeat
    Created on : Apr 21, 2013, 5:51:21 PM
    Author     : 52165627
--%>

<%@page import="Bean.Section"%>
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
        <% String action= (String)request.getAttribute("action");%>
        <form method="post" action="SectionDisplay">
            <select name="movieID">
                <% List<Movie> movies = (List<Movie>)session.getAttribute("movies"); 
                    for(Movie movie: movies){
                %> 
                  <option value="<%=movie.getMovieID()%>"><%=movie.getName()%></option>                           
                <% } %>      
                </select>        
            </select>
            <input type="hidden" name="id" value="0">
            <input type="hidden" name="action" value="selectMovie">
            <input type="submit" value="Select Movie">            
        </form>
      
       <% if(!action.equals("selectMovie")){ %>
        <form method="post" action="SeatDisplay">                    
            <select name="sectionSelect">
                 <% List<Section> sections = (List<Section>)request.getAttribute("sections"); 
                      for (Section section: sections ){
                  %>     
                  <option value="<%=section.getSectionID()%>">
                       Venue: House <%=section.getVenueID()%>
                       Time: <%=section.getTime()%> 
                       Price: $<%=section.getPrice()%>          
                  </option>
                <% } %>      
           </select>
           <input type="hidden" name="action" value="selectSeat">
           <input type="submit" value="Select Section">
        </form>
        <%}%>
    </body>
</html>
