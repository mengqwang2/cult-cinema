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
         String seatNO=rs.getString("Seat");
         String payment=rs.getString("Payment");
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
}

