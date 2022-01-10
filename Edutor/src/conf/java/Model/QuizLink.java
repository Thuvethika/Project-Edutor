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
public class QuizLink {
     private int classid;
    private String topic;
     private String quizlink;
     private String email;
     private String date;
     public QuizLink(){
     
    }
     
      public QuizLink(int classid,String topic,String date, String quizlink, String email){
    this.classid=classid;
    this.topic= topic;
   this.date = date;
    this.quizlink = quizlink;
   
    this.email = email;
    
    
    }

    public int getClassid() {
        return classid;
    }

    public void setClassid(int classid) {
        this.classid = classid;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getQuizlink() {
        return quizlink;
    }

    public void setQuizlink(String quizlink) {
        this.quizlink = quizlink;
    }

   

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
      
      

}
