/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import static java.lang.System.out;

/**
 *
 * @author Thishan
 */
public class Createclass {

        private String classname;
        private int grade;
        private String medium;
        private String email;


public Createclass(){

}

public Createclass(String classname, int grade, String medium, String email){
this.classname = classname;
this.grade = grade;
this.medium = medium;
this.email = email;

}


public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public String getMedium() {
        return medium;
    }

    public void setMedium(String medium) {
        this.medium = medium;
    }
      public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
