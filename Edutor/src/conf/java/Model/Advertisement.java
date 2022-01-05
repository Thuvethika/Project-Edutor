/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import javax.servlet.http.Part;

/**
 *
 * @author thuve
 */
public class Advertisement {
     private int classid;
    private String subject;
    private String date;
    private String time;
    private String classoption;
    private String fees;
    private String email;
    private Part uploadimage;
    
    public Advertisement(){
    
    }
    
    public Advertisement(int classid,String subject, String date, String time, String classoption, String fees, String email, Part uploadimage){
        this.classid = classid;
        this.subject = subject;
        this.date =date;
        this.time = time;
        this.classoption = classoption;
        this.fees = fees;
        this.email = email;
        this.uploadimage=uploadimage;
    
    }

    public int getClassid() {
        return classid;
    }

    public void setClassid(int classid) {
        this.classid = classid;
    }
    
    

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    

    public String getClassoption() {
        return classoption;
    }

    public void setClassoption(String classoption) {
        this.classoption = classoption;
    }

    public String getFees() {
        return fees;
    }

    public void setFees(String fees) {
        this.fees = fees;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Part getUploadimage() {
        return uploadimage;
    }

    public void setUploadimage(Part uploadimage) {
        this.uploadimage = uploadimage;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

     
    
}
