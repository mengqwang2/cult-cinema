/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.Booking;
import Bean.Movie;
import Bean.Section;
import Utility.DBConn;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mengqwang
 */
public class BookingDAO {
     public List<Booking> getBookingList(Section s) throws SQLException
     {
         List<Booking> bookRecord=new ArrayList<Booking>(); 
    DBConn db=new DBConn(); 
    ResultSet rs = null;
    int uid=0;
    String sql="SELECT * FROM [BOOKING] WHERE Section_ID="+s.getSectionID();
    rs=db.doSelect(sql); 
         while(rs.next()){        
         int sectionID=rs.getInt("Section_ID");
         int seatNO=rs.getInt("Seat");
         int payment=rs.getInt("Payment");
         int member=rs.getInt("Member_ID");
         String status=rs.getString("Status");
         
         Booking bk=new Booking();
         bk.setMemberID(member);
         bk.setPayment(payment);
         bk.setSeat(seatNO);
         bk.setSectionID(sectionID);
         bk.setStatus(status);
                 
         bookRecord.add(bk);
         uid++;
         
        }   
       return bookRecord;
       }
     
       public void addBkRecord(Booking bk)
       {
         try {
             DBConn db=new DBConn(); 
             int seat=bk.getSeat();
             int section=bk.getSectionID();
             int memberID=bk.getMemberID();
             String status=bk.getStatus();
             int payment=bk.getPayment();
             String sql="INSERT INTO [BOOKING](Section_ID,Seat,Member_ID,Status,Payment) VALUES ('"+section+"','"+seat+"','"+memberID+"','"+status+"','"+payment+"')";
             db.doUpdate(sql);
             db.close();
         } catch (SQLException ex) {
             Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
         } catch (Exception ex) {
             Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
         }
           
       }
}

