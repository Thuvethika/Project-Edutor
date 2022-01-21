/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Blob;
import javax.servlet.http.Part;

/**
 *
 * @author Thishan
 */

 public class Uploadnotes {
    private String title;
    private String description;
    private String filename;
    private String imgname;
    private String email;
    private int classid;


public Uploadnotes(){

}

public Uploadnotes(String title, String description, String filename,String email,int classid){
this.title = title;
this.description = description;
this.filename = filename;
this.email = email;
this.classid = classid;
}


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

     public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getImgname() {
        return imgname;
    }

    public void setImgname(String imgname) {
        this.imgname = imgname;
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
