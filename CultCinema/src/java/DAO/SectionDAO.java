/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.Section;
import Utility.DBConn;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mengqwang
 */
public class SectionDAO {
    public int getSectionVenue(Section s) throws SQLException
    {
        ResultSet rs=null; 
        DBConn db=new DBConn();
        int sectionID=s.getSectionID();
        int venueID=0;
        String sql="SELECT [Venue_ID] FROM [SECTION] WHERE [Section_ID]="+sectionID;
        rs=db.doSelect(sql);
        if(rs.next())
        {
            venueID=rs.getInt(1);
        }
        return venueID;
    }
    
    public void getSection(int sid,Section s)
    {
        
        try {
            ResultSet rs=null; 
            DBConn db=new DBConn();
            String sql="SELECT * FROM [SECTION] WHERE [Section_ID]="+sid;
            rs=db.doSelect(sql);
            int mid=0;
            Timestamp time = null;
            int vid=0;

            int price=0;

            if(rs.next())
            {
                mid=rs.getInt("Movie_ID");
                time=rs.getTimestamp("Time");
                vid=rs.getInt("Venue_ID");
                price=rs.getInt("price");
            }
            s.setMovieID(mid);
            s.setSectionID(sid);
            s.setPrice(price);
            s.setTime(time);
            s.setVenueID(vid);
            
        } catch (SQLException ex) {
            Logger.getLogger(SectionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    public void deleteSection(int sectionID) throws SQLException{
       DBConn db=new DBConn(); 
       db.doDelete("DELETE FROM [Section] WHERE Section_ID =" + sectionID);
   }
    public void addSection(Section section) throws SQLException{
       int movieID = section.getMovieID();
       int venueID = section.getVenueID();
       Timestamp time = section.getTime();
       SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
       int price = section.getPrice();

       DBConn db=new DBConn(); 
       String StrTime=sdf.format(time);
       String sql="INSERT INTO [SECTION](Movie_ID,Time,Venue_ID,price) VALUES('"+movieID+"','"+StrTime+"','"+venueID+"','"+price+"')";
       db.doInsert(sql);
       //db.doInsert("INSERT INTO [SECTION](Movie_ID,Venue_ID,price) VALUES('"+movieID+"','"+venueID+"','"+price+"')");
    }
    public void editSection(Section section) throws SQLException{
       int venue = section.getVenueID();
       int price = section.getPrice();
       int sectionID=section.getSectionID();
       Timestamp time = section.getTime();
       SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
       String StrTime=sdf.format(time);
       
       DBConn db=new DBConn(); 
       db.doUpdate("UPDATE [Section] SET Venue_ID = '"+venue+"', Price ='"+price+"', Time = '"+StrTime+"' WHERE Section_id="+sectionID);
    }
}
