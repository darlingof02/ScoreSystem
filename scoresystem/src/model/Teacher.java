package model;

public class Teacher {
    private String account_teacher;
    private String password;
    private String teacher_ID;
    private String name;
    private String college;

//设置老师属性
    public void arrset(String acount_teacher, String password, String teacher_id, String name, String college){
        this.account_teacher = acount_teacher;
        this.password = password;
        teacher_ID = teacher_id;
        this.name = name;
        this.college = college;
        ;
    }

//6个get函数，返回个属性值
    public String getAccount_teacher() {
        return account_teacher;
    }

    public String getPassword() {
        return password;
    }

    public String getTeacher_ID() {
        return teacher_ID;
    }

    public String getName() {
        return name;
    }

    public String getCollege() {
        return college;
    }
}
