<%-- 
    Document   : addSection
    Created on : Apr 14, 2013, 4:11:14 PM
    Author     : 52165627
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script language="javascript" type="text/javascript" src="js/WdatePicker.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
         <form action="ManageSection" method="POST">
            <label>Name</label>
            <input type="text" name="name" readonly="readonly" value="<%=request.getParameter("name")%>"><br/>
            <label>Movie ID</label>
            <input type="text" name="movieID" readonly="readonly" value="<%=request.getParameter("movieID")%>"><br/>
            <label>Time</label>
            <input type="text" name="time" onFocus="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:00',alwaysUseStartDate:true})"/><br/>
            <label>Venue</label>
            <input type="text" name="venue"><br/>
            <label>Price $</label>
            <input type="text" name="price"><br/>
            <input type="hidden" name="action" value="AddSection">
            <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
            <input type="submit" value="Add Section">
        </form>
        <a href="MovieDisplay">Return to movie Management site</a>
    </body>
</html>
