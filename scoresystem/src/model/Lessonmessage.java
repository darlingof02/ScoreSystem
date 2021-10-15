package model;

public class Lessonmessage {
    private String lesson_num;
    private String lesson_code;//课程编号
    private String message;
    private String date;// 2019-11-08 范式存储

    public void setLessonmessage(String lesson_num, String lesson_code, String message, String date) {
        this.lesson_num = lesson_num;
        this.lesson_code = lesson_code;
        this.message = message;
        this.date = date;
    }

    public String getLesson_num() {
        return lesson_num;
    }

    public String getLesson_code() {
        return lesson_code;
    }

    public String getMessage() {
        return message;
    }

    public String getDate() {
        return date;
    }

    public boolean isnotnull()
    {
        if(this.date==null && this.lesson_code==null && this.message==null && this.lesson_num==null)
            return false;
        return true;
    }
}
