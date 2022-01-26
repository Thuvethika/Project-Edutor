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
public class Quiz {
  private int classid;
   private String email;
   private String question;
    private String answer1; 
     private String answer2;
       private String answer3;
     private String answer4;
     private String answer;
     
     public Quiz(){
     
    }
     public Quiz(int classid,String email,String question, String answer1, String answer2,String answer3,String answer4,String answer){
    this.classid=classid;
    this.question= question;
   this.answer1 = answer1;
   this.answer2 = answer2;
   this.answer3 = answer3;
   this.answer4 = answer4;
   this.email = email;
   this.answer=answer;
    
    
    }

    public int getClassid() {
        return classid;
    }

    public void setClassid(int classid) {
        this.classid = classid;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer1() {
        return answer1;
    }

    public void setAnswer1(String answer1) {
        this.answer1 = answer1;
    }

    public String getAnswer2() {
        return answer2;
    }

    public void setAnswer2(String answer2) {
        this.answer2 = answer2;
    }

    public String getAnswer3() {
        return answer3;
    }

    public void setAnswer3(String answer3) {
        this.answer3 = answer3;
    }

    public String getAnswer4() {
        return answer4;
    }

    public void setAnswer4(String answer4) {
        this.answer4 = answer4;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
     
     
}
