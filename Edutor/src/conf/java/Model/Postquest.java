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
public class Postquest {
    private String sender;
    private String postdate;
    private String topic;
    private String forumquest;
    private String email;
    
   public Postquest(){
       
   } 
   
   public Postquest(String sender,String postdate,String topic,String forumquest,String email){
       this.sender= sender;
       this.postdate= postdate;
       this.topic = topic;
       this.forumquest = forumquest;
       this.email = email;
   }
   public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }
    
    public String getPostdate() {
        return postdate;
    }

    public void setPostdate(String postdate) {
        this.postdate = postdate;
    }
    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }
    public String getForumquest() {
        return forumquest;
    }

    public void setForumquest(String forumquest) {
        this.forumquest = forumquest;
    }
    
      public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
}
