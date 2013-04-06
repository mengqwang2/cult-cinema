/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cs4280.bean;

/**
 *
 * @author Zhang Yanlin
 */
public class Booking {
    private int issueID;
    private int movieID;
    private String seat;
    private boolean payment;
    private int memberID;
    
    public int getIssueID(){
    return this.issueID;
    }
    public void setIssueID(int issueID){
    this.issueID=issueID;
    }
    public int getMovieID(){
        return this.movieID;
    }
    public void setMovieID(int movieID){
        this.movieID=movieID;
    }
    public String getSeat(){
        return this.seat;
    }
    public void setSeat(String seat){
        this.seat=seat;
    }
    public boolean getPayment(){
        return this.payment;
    }
    public void setPayment(boolean payment){
        this.payment=payment;
    }
    public int getMemberID(){
        return this.memberID;
    }
    public void setMemberID(int memberID){
        this.memberID=memberID;
    }   
}
