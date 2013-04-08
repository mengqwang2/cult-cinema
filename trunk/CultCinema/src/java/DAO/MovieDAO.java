/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

/**
 *
 * @author 52165627
 */
import Bean.Movie;
import Bean.Section;
import Utility.DBConn;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class MovieDAO {
   
    public List<Movie> getMovieList() throws SQLException {   
    List<Movie> movieList=new ArrayList<Movie>(); 
    DBConn db=new DBConn(); 
    ResultSet rs = null;
    int uid=0;
    rs=db.doSelect("SELECT * FROM [MOVIE]"); 
         while(rs.next()){        
         int movieID=rs.getInt("movie_id");
         String name=rs.getString("name");
         int duration=rs.getInt("duration");
         String description=rs.getString("description");
         String director = rs.getString("director");
         String cast=rs.getString("cast");
         String category = rs.getString("category");
         String language = rs.getString("language");

         Movie movie=new Movie();
         movie.setMovieID(movieID);
         movie.setName(name);
         movie.setDuration(duration);
         movie.setDescription(description);
         //movie.setPoster;
         movie.setDirector(director);
         movie.setCast(cast);
         movie.setCategory(category);
         movie.setLanguage(language);
         movie.setUid(uid);
         movieList.add(movie);
         uid++;
        }   
       return movieList;
       }


   public List<Section> getSectionList(Integer movieID) throws SQLException {      

        List<Section> sectionList=new ArrayList<Section>(); 
        DBConn db=new DBConn(); 
        ResultSet rs = null;
        rs=db.doSelect("SELECT * FROM [SECTION] where Movie_ID=" + movieID);
        while(rs.next()){     
            Timestamp time=rs.getTimestamp("Time");
            BigDecimal price=rs.getBigDecimal("price");
            int id=rs.getInt("Section_ID");
            Section section = new Section();
            section.setPrice(price);
            section.setTime(time);
            section.setSectionID(id);
            sectionList.add(section);
        } 
        return sectionList;
   }
   
   
}
