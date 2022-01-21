/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import javax.servlet.http.Part;

/**
 *
 * @author Thishan
 */
public class Starrate {
    
  private int rating;
  private String email;
  private int classid;
  

public Starrate(){
    
}  

public Starrate(int rating,String email,int classid){
 this.rating = rating;
this.email = email;
this.classid = classid;   
    
  
}
  public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    public int getClassid() {
        return classid;
    }

    public void setClassid(int classid) {
        this.classid = classid;
    }
}
