package test.Teacher;

import dao.lemessagedao;
import dao.lessondao;
import dao.scoredao;
import dao.studentdao;
import dao.teacherdao;
import dao.relationshipdao;
import model.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.DecimalFormat;
import java.util.ArrayList;
public class TeacherLesson extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        String output = null;
        try
        {


            String account_teacher = request.getParameter("account_teacher");
            String password = request.getParameter("password");

            System.out.println("*****************");
            System.out.println("此时老师id为：" + account_teacher);
            System.out.println("此时老师密码为：" + password);
            System.out.println("*****************");

            teacherdao teacherdao = new teacherdao();
            Teacher Teacher = teacherdao.loginmainpage(account_teacher,password);
            boolean a = teacherdao.teacherlogin(account_teacher,password);

            if(a) {

                //用于获得老师名下课程
                relationshipdao dao1 = new relationshipdao();
                Relationship[] a1 = dao1.getMyCourse(Teacher.getTeacher_ID());
                int count = dao1.getMyCoursenum(Teacher.getTeacher_ID());
                lessondao dao2 = new lessondao();
                Lesson[] teacherlesson = new Lesson[count];
                int count2 = 0; //用于记录课程数
                for (Relationship elem : a1) {
                    teacherlesson[count2++] = dao2.myLesson(elem.getLesson_num());
                }


                //用于获得该课程下学生成绩
                int count3 = 0;
                Double gpa[][] = new Double[count][];  //为每个成绩生成一个gpa
                scoredao dao3 = new scoredao();
                Score[][] stuScore = new Score[count][];  //为每个课程生成一组成绩列表
                studentdao dao4 = new studentdao();
                String[][] stu = new String[count][]; //存储每个课程的学生
                Double passRate[] = new Double[count];
                DecimalFormat df = new DecimalFormat("0.00");

                for (int i = 0; i < count; i++) {
                    stuScore[i] = dao3.getStuScore(a1[i].getLesson_code());
                    int cnt = 0;
                    int PassStu = 0;
                    stu[i] = new String[stuScore[i].length];
                    gpa[i] = new Double[stuScore[i].length];
                    for (Score elem : stuScore[i]) {
                        Double tempGpa = dao3.tellGPA(elem.getFinalexam_score()*0.5+elem.getUsual_score()*0.3+elem.getAttend_score()*0.2);
                        gpa[i][cnt] = tempGpa;
                        String tempStuName = dao4.getStudentName(elem.getStudent_ID());
                        stu[i][cnt++] = new String(tempStuName);
                        if(tempGpa > 0) {
                            PassStu ++;
                        }
                    }
                    passRate[i] = PassStu*1.0/stuScore[i].length;
                }


//                for (int i = 0; i < count; i++) {
//                    int cnt = 0;
//                    System.out.println(i);
//                    for (String elem : stu[i]) {
//                        System.out.println("hello world");
//                        System.out.println("学生姓名：" + elem + "学生成绩: " + stuScore[i][cnt].getFinalexam_score() + "学生绩点: " +gpa[i][cnt++]);
//                    }
//                }

                //测试jsp循环
                int []test = {1,};

                request.setAttribute("account_teacher", Teacher.getTeacher_ID());
                request.setAttribute("password", Teacher.getPassword());
                request.setAttribute("Relation", a1); //a1[]用于存课程号
                request.setAttribute("teacherlesson",teacherlesson);//teacherlesson[]用于存课程名，课程号
                request.setAttribute("Score", stuScore); //Score[][] 用于存各课程下成绩，课程编号
                request.setAttribute("Stu", stu);//stu[][] 用于存各课程下学生姓名
                request.setAttribute("test",test);
                request.setAttribute("gpq", gpa);
                request.setAttribute("name",Teacher.getName());
                request.setAttribute("college",Teacher.getCollege());
                request.setAttribute("PassRate", passRate);
//                for(int elem: test) {
//                    System.out.println(elem);
//                }

                RequestDispatcher rd = getServletContext().getRequestDispatcher("/teacherlesson.jsp");
                rd.forward(request, response);


            }

        }
        catch( Exception e ){
        }
    }
}
