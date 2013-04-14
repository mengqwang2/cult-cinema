/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

/**
 *
 * @author Zhang Yanlin
 */
public class Booking {
    private int issueID;
    private int sectionID;
    private String seat;
    private String payment;
    private String status;
    private int memberID;
    private int uid;
    public int getIssueID(){
    return this.issueID;
    }
    public void setIssueID(int issueID){
    this.issueID=issueID;
    }
    public int getSectionID(){
        return this.sectionID;
    }
    public void setSectionID(int movieID){
        this.sectionID=movieID;
    }
    public String getSeat(){
        return this.seat;
    }
    public void setSeat(String seat){
        this.seat=seat;
    }
    public String getPayment(){
        return this.payment;
    }
    public void setPayment(String payment){
        this.payment=payment;
    }
    public int getMemberID(){
        return this.memberID;
    }
    public void setMemberID(int memberID){
        this.memberID=memberID;
    }   
    public String getStatus(){
        return this.status;
    }
    public void setStatus(String status){
        this.status=status;
    }
    public int getUid(){
        return this.uid;
    }
    public void setUid(int uid){
        this.uid=uid;
    }
}