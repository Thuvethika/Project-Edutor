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
    private String grade;
    private String medium;
    private String classoption;
    private String fees;
    private String email;
    private Part uploadimage;
    
    public Advertisement(){
    
    }
    
    public Advertisement(int classid,String subject, String grade, String medium, String classoption, String fees, String email, Part uploadimage){
        this.classid = classid;
        this.subject = subject;
        this.grade = grade;
        this.medium = medium;
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

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getMedium() {
        return medium;
    }

    public void setMedium(String medium) {
        this.medium = medium;
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

     
    
}
