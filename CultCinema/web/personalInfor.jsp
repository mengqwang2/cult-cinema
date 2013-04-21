<%-- 
    Document   : formate
    Created on : Apr 20, 2013, 4:22:29 PM
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
            <form>
                <fieldset>
                    <input type="hidden" name="todo" id="todo" value="" />
                    <label for="register-text">Name</label>
                    <input type="text" name='name' id='name' />
                    <label for="register-text">Password</label>
                    <input type="password" name='password' id='password'/>
                    <label for="register-text">Address</label>
                    <input type="text" name='address' id='address'/>
                    <label for="register-text">Tel</label>
                    <input type="text" name='tel' id='tel'/>
                    <label for="register-text">Gender</label>
                    <label for="register-text">Male</label>
                    <input type="radio" name="gender" id="male" value="male"/>
                    <label for="register-text">Female</label>
                    <input type="radio" name="gender" id="female" value="female"/>
                    <label for="register-text">Email</label>
                    <input type="text" name='email' id='email'/>
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
