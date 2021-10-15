package model;

public class Lesson {
    private double credit;
    private String lesson_attributes;
    private String lesson_name;
    private String lesson_num;

    public Lesson(){
        ;
    }

    public void setLesson(double credit, String lesson_attributes, String lesson_name, String lesson_num) {
        this.credit = credit;
        this.lesson_attributes = lesson_attributes;
        this.lesson_name = lesson_name;
        this.lesson_num = lesson_num;
    }

    public double getCredit() {
        return credit;
    }

    public String getLesson_attributes() {
        return lesson_attributes;
    }

    public String getLesson_name() {
        return lesson_name;
    }

    public String getLesson_num() {
        return lesson_num;
    }
}
