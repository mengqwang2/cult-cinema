/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.Venue;
import Utility.DBConn;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author 52165627
 */
public class VenueDAO {
    public Venue getVenue(int id)throws SQLException {
        Venue venue = new Venue();
        DBConn db=new DBConn(); 
        ResultSet rs = null;
        rs=db.doSelect("SELECT * FROM [Venue] where Venue_ID=" + id);
        while(rs. next()){
            int row=rs.getInt("Row");
            int column=rs.getInt("Column");
            String house = rs.getString("House");
            int VenueID = rs.getInt("Venue_ID");            
            venue.setRow(row);
            venue.setColumn(column);
            venue.setHouse(house);
            venue.setVenueID(VenueID);
        }
        return venue;
    }
}
