/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.Member;
import Utility.DBConn;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mengqwang
 */
public class MemberDAO {
    public boolean checkUserLogin(Member user) throws Exception{  
            ResultSet rs=null;  
            DBConn db=new DBConn();  
              
            try {  
                    String password=user.getPassword();
                    String password2="";
                    if(!user.getPassword().equals("")||user.getPassword()!=null){
                        String sql="select [Password] from [Member] where [Member_ID]="+user.getMemberID();
                        rs=db.doSelect(sql);  
                        if(rs.next())
                        {
                            password2=rs.getString(1);
                        }
                        db.close(rs);
                    }
                    boolean res=password.equals(password2);
                    return (res);
            } catch (SQLException e) {  
                e.printStackTrace();  
            }  
        
            return false;
          
    }  
    
    public boolean doUserReg(Member user) throws SQLException, Exception
    { 
        DBConn db=new DBConn(); 
        
        if((!user.getName().equals("")||user.getName()!=null)&&(!user.getPassword().equals("")||user.getPassword()!=null)&&(!user.getAddress().equals("")||user.getAddress()!=null)&&(!user.getGender().equals("")||user.getGender()!=null)&&(!user.getTel().equals("")||user.getTel()!=null)&&(!user.getMail().equals("")||user.getMail()!=null))   
        {
            db.doUpdate("INSERT INTO [Member] VALUES ('"+user.getPassword()+"','"+user.getName()+"','"+user.getAddress()+"','"+user.getTel()+"','"+user.getGender()+"','"+user.getMail()+"',1000)");
           
            db.close();
            return true;
        }
               
        return false;
    }
    
    public void setMember(Member m)
    {
        try {
            ResultSet rs=null;  
            DBConn db=new DBConn(); 
            String sql="SELECT * FROM [Member] where [Member_ID]="+m.getMemberID();
            
            int mid=m.getMemberID();
            String pwd = null;
            String name = null;
            String adr = null;
            String tel = null;
            String gender = null;
            String mail = null;
            int loyalty=0;
            rs=db.doSelect(sql);
            if(rs.next())
            {
                pwd=rs.getString("Password");
                name=rs.getString("Name");
                adr=rs.getString("Address");
                tel=rs.getString("Tel");
                gender=rs.getString("Gender");
                mail=rs.getString("Mail");
                loyalty=rs.getInt("Loyalty");
            }
            m.setName(name);
            m.setAddress(adr);
            m.setGender(gender);
            m.setPassword(pwd);
            m.setMail(mail);
            m.setTel(tel);
            m.setLoyalty(loyalty);
            
        } catch (SQLException ex) {
            Logger.getLogger(MemberDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
