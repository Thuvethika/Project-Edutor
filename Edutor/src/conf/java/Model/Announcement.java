/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author thuve
 */
public class Announcement {
    private String topic;
    private String date;
    private String link;
    private String details;
    private String email;
    
    public Announcement(){
    
    }
    
    public Announcement(String topic, String date, String link, String details, String email){
    
    this.topic= topic;
    this.date = date;
    this.link = link;
    this.details = details;
    this.email = email;
    
    
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
}
