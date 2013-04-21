<%-- 
    Document   : manageSection
    Created on : Apr 14, 2013, 11:40:18 AM
    Author     : 52165627
--%>

<%@page import="Utility.Opt"%>
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
        <div id="header">
            <% Opt opt=new Opt();  
            out.println(opt.showHeader());
            %>
        </div>
        <div id='loginNav'>
            <% 
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
            <table>
                <tr>
                    <td>Movie</td>                      

                    <td>House</td>
                    <td>Time</td>
                    <td>Price $</td>
                    <td>Edit</td>
                    <td>Delete</td>
                </tr>    
                
                
                <% List<Section> sections = (List<Section>)request.getAttribute("sections"); 
                 for (Section section: sections ){
                %>
                    <tr>
                    <td>${movie.name}</td>

                    <td><%=section.getVenueID()%></td>
                    <td><%=section.getTime()%> </td>
                    <td><%=section.getPrice()%></td>
                    <td><a href="ManageSection?name=${movie.name}&movieID=${movie.movieID}&sectionID=<%= section.getSectionID()%>&venue=<%= section.getVenueID()%>&time=<%=section.getTime()%>&price=<%=section.getPrice()%>&action=EditSection&id=<%=request.getAttribute("id")%>">Edit Section</a></td>
                    <td><a href="ManageSection?id=<%=request.getAttribute("id")%>&sectionID=<%= section.getSectionID()%>&action=DeleteSection&movieID=${movie.movieID}">Delete Section</a></td>
                    </tr>
                <% } %>  
                
            </table>
            <a href="addSection.jsp?action=AddSection&movieID=${movie.movieID}&name=${movie.name}&id=${movie.uid}">Add Section</a><br/>
            <a href="MovieDisplay">Return to movie management site</a>
        </div>
        <div id="footer">
            <%  
            out.println(opt.showFooter());
            %>
        </div>
        </body>
</html>
