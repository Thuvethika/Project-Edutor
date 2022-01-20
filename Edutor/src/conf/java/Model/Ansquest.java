/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Thishan
 */
public class Ansquest {
    private String replier;
    private String ansdate;
    private String forumans;
    private String email;
    private int Fquestid;
    
    public Ansquest(){
        
    }
    
    public Ansquest(String replier,String ansdate,String forumans,String email,int Fquestid){
         this.replier= replier;
       this.ansdate= ansdate;
       this.forumans = forumans;
       this.email = email;
       this.Fquestid = Fquestid;
    }
    
    public String getReplier() {
        return replier;
    }

    public void setReplier(String replier) {
        this.replier = replier;
    }
    
    public String getAnsdate() {
        return ansdate;
    }

    public void setAnsdate(String ansdate) {
        this.ansdate = ansdate;
    }

    public String getForumans() {
        return forumans;
    }

    public void setForumans(String forumans) {
        this.forumans = forumans;
    }
    
      public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public int getFquestid() {
        return Fquestid;
    }

    public void setFquestid(int Fquestid) {
        this.Fquestid = Fquestid;
    }
}
