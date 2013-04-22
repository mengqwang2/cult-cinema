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
                    out.println(opt.showLoginNav(managerID,0));
                    type="manager";
                }
                else if(session.getAttribute("officerID")!=null)
                {
                    String officerID=(String)session.getAttribute("officerID");
                    out.println(opt.showLoginNav(officerID,1));
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
            <% Member member=(Member)request.getAttribute("memberInfo");%>
            <form onsubmit="return validate_form(this);" method="post" action="CartRetrieve">
                <fieldset>
                    <legend>Your information</legend>
                    <input type="hidden" name="todo" id="todo" value="" />
                    <input type="hidden" name="action" id="action" value="editInfor"/>
                    <label class="label">Member ID</label>
                    <label class="infor"><%=member.getMemberID()%></label><br/>
                    <label class="label">Name</label>
                    <label class="infor"><%=member.getName()%></label><br/>
                    <label class="label">Address</label>
                    <label class="infor"><%=member.getAddress()%></label><br/>
                    <label class="label">Tel</label>
                    <label class="infor"><%=member.getTel()%></label><br/>
                    <label class="label">Gender</label>
                    <label class="infor"><%=member.getGender()%></label><br/>
                    <label class="label">Email</label>
                    <label class="infor"><%=member.getMail()%></label><br/>
                    <label class="label">Loyalty</label>
                    <label class="infor"><%=member.getLoyalty()%></label><br/>
                    <input type="submit" value="Edit" />
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
