package model;

public class Student {
    private String account_student;
    private String password;
    private String student_ID;
    private String name;
    private String major;
    private double Revised_credits;

//新增属性
    private Lesson[] myLesson;

    public Student(){
        ;
    }

//设置学生属性
    public void arrset(String account_student, String password, String student_id, String name, String major, double revised_credits) {
        this.account_student = account_student;
        this.password = password;
        student_ID = student_id;
        this.name = name;
        this.major = major;
        Revised_credits = revised_credits;
    }



//6个get函数，分别返回属性
    public String getAccount_student() {
        return account_student;
    }

    public String getPassword() {
        return password;
    }

    public String getStudent_ID() {
        return student_ID;
    }

    public String getName() {
        return name;
    }

    public String getMajor() {
        return major;
    }

    public double getRevised_credits() {
        return Revised_credits;
    }

//6个set函数，主要用设置已修学分
    public void setAccount_student(String account_student) {
        this.account_student = account_student;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setStudent_ID(String student_ID) {
        this.student_ID = student_ID;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public void setRevised_credits(double revised_credits) {
        Revised_credits = revised_credits;
    }

    public void setMyLesson(Lesson[] myLesson) {
        this.myLesson = myLesson;
    }
}
