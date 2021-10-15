package test.Student;

import dao.lemessagedao;
import dao.lessondao;
import dao.scoredao;
import dao.studentdao;
import model.Lesson;
import model.Lessonmessage;
import model.Score;
import model.Student;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.DecimalFormat;

public class Studentlogin extends HttpServlet {
    public void doPost( HttpServletRequest request, HttpServletResponse response )
    {
        String output = null;
        try
        {

            System.out.println("fansile");
            String account_student = request.getParameter("account_student" );
            String password = request.getParameter("password");
            studentdao dao = new studentdao();
            boolean a = dao.studentlogin(account_student, password);
            Student stu = dao.loginmainpage(account_student, password);


            //此处获得学生的成绩列表
            scoredao dao2 = new scoredao();
            Score[] myScore = dao2.getMyScore(stu.getStudent_ID());
            lessondao dao3 = new lessondao();
            lemessagedao dao4 = new lemessagedao();

            //成绩为加权平均
            double averageScore = 0;
            double myCredit = 0;  //总共修过的学分
            double alreadyGetCredit = 0;
            int alreadyTook = 0;
            int alreadyPass = 0;
            double gpa = 0;
            Lessonmessage[] lemessage= new Lessonmessage[100]; //lemessage数组 用于存放多个信息
            int now=0;//用于计数
            Lesson annouce[]=new Lesson[100];//用来存放公告用的课程信息

            DecimalFormat df1 = new DecimalFormat("0.00");
            DecimalFormat df2 = new DecimalFormat("0");

            for (Score elem: myScore) {
                String lesson_code = elem.getLesson_code(); //获得课程编号
                lemessage[now] = dao4.getLessonmessage(lesson_code);//通过课程编号获取课程公告信息
                String lesson_num = dao4.getLessonmessage(lesson_code).getLesson_num(); //通过课程通知获得课程号
                annouce[now]=dao3.myLesson(lesson_num);
                now++;



                Lesson ls = dao3.myLesson(lesson_num); //通过课程号获得课程信息

                System.out.println("课程号为："+lesson_num);
                System.out.println("课程学分为："+ls.getCredit());
                double tempScore = (elem.getFinalexam_score()*0.5 + elem.getUsual_score()*0.3 + elem.getAttend_score()*0.2);
                averageScore += tempScore * ls.getCredit();
                gpa += dao2.tellGPA(tempScore) * ls.getCredit();
                System.out.println(tempScore);
                alreadyTook ++;
                myCredit += ls.getCredit();
                if (tempScore >= 60) {
                    alreadyPass++;
                    alreadyGetCredit += ls.getCredit();
                }
            }
            if(myCredit > 0) {
                averageScore /= myCredit;
                gpa /= myCredit;
            }
            else {
                gpa = 0;
                averageScore = 0;
            }
            stu.setRevised_credits(alreadyGetCredit);

            if(a){
                request.setAttribute("name",stu.getName());
                request.setAttribute("major",stu.getMajor());
                request.setAttribute("account_student",stu.getAccount_student());
                request.setAttribute("password",stu.getPassword());
                request.setAttribute("student_ID",stu.getStudent_ID());
                request.setAttribute("Revised_credits",df2.format(alreadyGetCredit));
                request.setAttribute("Score", df1.format(averageScore));
                request.setAttribute("GPA", df1.format(gpa));
                request.setAttribute("PassNum", alreadyPass);
                request.setAttribute("TookNum", alreadyTook);
                request.setAttribute("lemessage",lemessage);
                request.setAttribute("annouce",annouce);
                RequestDispatcher rd = getServletContext().getRequestDispatcher( "/studentmainpage.jsp" );
                rd.forward(request, response);
            }
            else{
                request.setAttribute("result","fall!");
                RequestDispatcher rd = getServletContext().getRequestDispatcher( "/show_name.jsp" );
                rd.forward(request, response);
            }

        }
        catch( Exception e ){
        }
    }
}


