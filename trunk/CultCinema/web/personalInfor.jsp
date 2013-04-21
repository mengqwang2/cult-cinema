<%-- 
    Document   : formate
    Created on : Apr 20, 2013, 4:22:29 PM
    Author     : 52165627
--%>

<%@page import="Bean.Member"%>
<%@page import="Utility.Opt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <
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
            <% Member member = (Member)request.getAttribute("memberInfo");%>
            <form>
                <fieldset>
                    <input type="hidden" name="todo" id="todo" value="" />
                    <label >Member ID</label>
                    <input type="text" name="userID" id="userID" value="<%=member.getMemberID()%>"/><br/>
                    <label >Name</label>
                    <input type="text" name='name' id='name' value="<%=member.getName()%>"/><br/>
                    <label >Old Password</label>
                    <input type="password" name='password' id='password'/><br/>
                    <label>New Password</label>
                    <input type="password" name='newPassword' id='newPassword'/><br/>
                    <label>Confirmed Password</label>
                    <input type="password" name='confirmedPassword' id='confirmedPassword'/><br/>
                    <label >Address</label>
                    <input type="text" name='address' id='address' value="<%=member.getAddress()%>"/><br/>
                    <label >Tel</label>
                    <input type="text" name='tel' id='tel' value="<%=member.getTel()%>"/><br/>
                    <label >Gender</label>
                    <%String g=member.getGender();%>
                    <label >Male</label>
                    <input type="radio" name="gender" id="male" <%if (g.equals("male")){%> checked="checked" <%}%>/>
                    <label >Female</label>
                    <input type="radio" name="gender" id="female" <%if (g.equals("female")){%> checked="checked" <%}%>/><br/>
                    <label >Email</label>
                    <input type="text" name='email' id='email' value="<%=member.getMail()%>"/><br/>
                    <input type="submit" value="Confirm Change" onsubmit=""/>
                </fieldset>
            </form>
        </div>
        <div id="footer">
            <%  
            out.println(opt.showFooter());
            %>
        </div>
        </body>
</html>
