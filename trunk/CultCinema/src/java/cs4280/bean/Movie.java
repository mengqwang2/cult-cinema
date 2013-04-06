/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cs4280.bean;

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
    private String name;
    private int duration;
    private String description;
    private Byte[] poster;
    
    
}
