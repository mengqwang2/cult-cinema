/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import Utility.DBConn;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author mengqwang
 */
public class CheckUser {
    public boolean checkUser(Member user){  
            ResultSet rs=null;  
            DBConn db=new DBConn();  
            rs=db.doSelect("select [Member_ID] from [Member] where [Member_ID]="+user.getMemberID());  
            try {  
                if(rs.next()){ 
                    Integer member1=rs.getInt(1);
                    Integer member2=0;
                    if(user.getPassword().equals("")||user.getPassword()!=null){  
                        rs=db.doSelect("select [Member_ID] from [Member] where [Password]="+user.getPassword());  
                        member2=rs.getInt(1);
                    }
                    if(member1==member2)
                        return true;
                    else
                        return false;
                        
                }  
            } catch (SQLException e) {  
                e.printStackTrace();  
            }  
        
          
        return false;  
          
    }  
}
