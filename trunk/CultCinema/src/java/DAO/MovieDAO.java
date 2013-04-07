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
import Utility.DBConn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MovieDAO {
   
    public List<Movie> getMovieList() throws SQLException {   
    List<Movie> movieList=new ArrayList<Movie>(); 
    DBConn db=new DBConn(); 
    ResultSet rs = null;
    rs=db.doSelect("SELECT * FROM [MOVIE]");  
        while(rs.next()){        
         int uid=rs.getInt("movie_id");
         String name=rs.getString("name");
         int duration=rs.getInt("duration");
         String description=rs.getString("description");
         String director = rs.getString("director");
         String cast=rs.getString("cast");
         String category = rs.getString("category");
         String language = rs.getString("language");

         Movie movie=new Movie();
         movie.setUid(uid);
         movie.setName(name);
         movie.setDuration(duration);
         movie.setDescription(description);
         //movie.setPoster;
         movie.setDirector(director);
         movie.setCast(cast);
         movie.setCategory(category);
         movie.setLanguage(language);
         movieList.add(movie);
        }   
       return movieList;
       }

   
   
}
