/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.Member;
import Utility.DBConn;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author mengqwang
 */
public class MemberDAO {
    public boolean checkUserLogin(Member user) throws Exception{  
            ResultSet rs=null;  
            DBConn db=new DBConn();  
              
            try {  
                    Integer member1=user.getMemberID();
                    Integer member2=0;
                    if(user.getPassword().equals("")||user.getPassword()!=null){  
                        rs=db.doSelect("select [Member_ID] from [Member] where [Password]="+user.getPassword());  
                        if(rs.next())
                        {
                            member2=rs.getInt(1);
                        }
                        db.close(rs);
                    }
                    if(member1==member2)
                        return true;
                    else
                        return false;
                        
               
            } catch (SQLException e) {  
                e.printStackTrace();  
            }  
        
            return false;
          
    }  
    
    public boolean doUserReg(Member user) throws SQLException, Exception
    { 
        DBConn db=new DBConn(); 
        
        if((user.getName().equals("")||user.getName()!=null)&&(user.getPassword().equals("")||user.getPassword()!=null)&&(user.getAddress().equals("")||user.getAddress()!=null)&&(user.getGender().equals("")||user.getGender()!=null)&&(user.getTel().equals("")||user.getTel()!=null)&&(user.getMail().equals("")||user.getMail()!=null))   
        {
            db.doUpdate("INSERT INTO [Member] VALUES ('"+user.getPassword()+"','"+user.getName()+"','"+user.getAddress()+"','"+user.getTel()+"','"+user.getGender()+"','"+user.getMail()+"')");
            db.close();
            return true;
        }
               
        return false;
    }
}
