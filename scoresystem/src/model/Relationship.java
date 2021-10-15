package model;

public class Relationship {

    private String lesson_num;
    private String lesson_code;
    private String teacher_ID;

    public Relationship() {
    }

    public Relationship(String lesson_code, String lesson_num, String teacher_ID) {
        this.lesson_num = lesson_num;
        this.lesson_code = lesson_code;
        this.teacher_ID = teacher_ID;
    }

    public String getTeacher_ID() {
        return teacher_ID;
    }

    public String getLesson_num() {
        return lesson_num;
    }

    public void setLesson_num(String lesson_num) {
        this.lesson_num = lesson_num;
    }

    public void setLesson_code(String lesson_code) {
        this.lesson_code = lesson_code;
    }

    public void setTeacher_ID(String teacher_ID) {
        this.teacher_ID = teacher_ID;
    }

    public String getLesson_code() {
        return lesson_code;
    }
}