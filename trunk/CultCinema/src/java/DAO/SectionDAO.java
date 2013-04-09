/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.Section;
import Utility.DBConn;
import java.sql.ResultSet;
import java.sql.SQLException;

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
}
