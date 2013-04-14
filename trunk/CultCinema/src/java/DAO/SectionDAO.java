/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.Section;
import Utility.DBConn;
import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
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
            BigDecimal price = null;
            if(rs.next())
            {
                mid=rs.getInt("Movie_ID");
                time=rs.getTimestamp("Time");
                vid=rs.getInt("Venue_ID");
                price=rs.getBigDecimal("price");
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
}
