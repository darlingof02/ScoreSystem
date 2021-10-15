package model;

public class Score {
//此处将原来的Int属性都修改为String
    private String teacher_ID;
    private String lesson_code;
    private String student_ID;
    private int usual_score;
    private int attend_score;
    private int finalexam_score;

    public Score(){

    }

    public Score(String lesson_code, String student_ID, String teacher_ID, int finalexam_score, int usual_score, int attend_score) {
        this.teacher_ID = teacher_ID;
        this.lesson_code = lesson_code;
        this.student_ID = student_ID;
        this.usual_score = usual_score;
        this.attend_score = attend_score;
        this.finalexam_score = finalexam_score;
    }

    public String getTeacher_ID() {
        return teacher_ID;
    }

    public String getLesson_code() {
        return lesson_code;
    }

    public String getStudent_ID() {
        return student_ID;
    }

    public int getUsual_score() {
        return usual_score;
    }

    public int getAttend_score() {
        return attend_score;
    }

    public int getFinalexam_score() {
        return finalexam_score;
    }
}
