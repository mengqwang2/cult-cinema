/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Utility;

/**
 *
 * @author mengqwang
 */
public class Opt {
    
    
    public String showNotLoginNav()
    {
        String opt="<p>Login</p><ul><li><a href='index.jsp'>Main</a></li><li><a href='user_login.jsp'>Member</a></li>";
        opt+="<li><a href='manager_login.jsp'>Manager</a></li>";
        opt+="<li><a href='officer_login.jsp'>Officer</a></li></ul>";
        return opt;
    }
    
    public String showLoginNav(int memberID)
    {
        String opt="<p>Logged in as "+memberID+"</p>";
        return opt;
    }
    
    public String showLoginNav(String user)
    {
        String opt="<p>Logged in as "+user+"</p>";
        return opt;
    }
    
    public String showItem(String type)
    {
        String opt="";
        if(type.equals("member"))
        {
            opt+="<ul><li><a href='MovieDisplay?Action=MovieDisplay'>Movie</a></li><li><a href=''>Booking Records</a></li><li><a href=''>Loyalty Point</a></li><li><a href='CartRetrieve?action=personalInfo'>Personal Information</a></li><li><a href='CartRetrieve'>Shopping Cart</a></li><li><a href='logoffControl'>Log off</a></li></ul>";
        }
        else if(type.equals("manager"))
        {
            opt+="<ul><li><a href='MovieDisplay?Action=MovieDisplay'>Movie</a></li><li><a href='MovieDisplay?Action=ManageMovie'>Manage Movie</a></li><li><a href=''>Manage seats</a></li><li><a href=''>View Statistics</a></li><li><a href='logoffControl'>Log off</a></li></ul>";
        }
        else if(type.equals("officer"))
        {
            opt+="<ul><li><a href='MovieDisplay?Action=MovieDisplay'>Movie</a></li><li><a href='RefundControl'>Manage refund</a></li><li><a href=''>Shopping Cart</a></li><li><a href='logoffControl'>Log off</a></li></ul>";
        }
        return opt;
    }
    
    public String showHeader()
    {
        String opt="<h1>Cult Cinema Inc</h1>";
        return opt;
    }
    
    public String showFooter()
    {
        String opt="<p>© Copyright 2013 Cult Cinema Inc</p>";
        return opt;
    }
    
}
