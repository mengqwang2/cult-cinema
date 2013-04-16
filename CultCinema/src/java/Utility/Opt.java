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
        String opt="<div id='loginNav'><p>Login</p><ul><li><a href='index.jsp'>Main</a></li><li><a href='user_login.jsp'>User</a></li>";
        opt+="<li><a href='manager_login.jsp'>Manager</a></li>";
        opt+="<li><a href='officer_login.jsp'>Officer</a></li></ul></div>";
        return opt;
    }
    
}
