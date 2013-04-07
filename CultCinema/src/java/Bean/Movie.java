/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

/**
 *
 * @author Zhang Yanlin
 */
public class Movie {
    private int movieID;

    public int getMovieID() {
        return movieID;
    }

    public void setMovieID(int movieID) {
        this.movieID = movieID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Byte[] getPoster() {
        return poster;
    }

    public void setPoster(Byte[] poster) {
        this.poster = poster;
    }
    
    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }
    
    public String getCast() {
        return cast;
    }

    public void setCast(String cast) {
        this.description = cast;
    }
    
    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
    
    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }
    
    public int getUid(){
        return uid;
    }
    
    public void setUid(int uid){
        this.uid = uid;
    }
    
    private String name;
    private int duration;
    private String description;
    private Byte[] poster;
    private String director;
    private String cast;
    private String category;
    private String language;
    private int uid;
}
