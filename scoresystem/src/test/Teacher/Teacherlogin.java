package test.Teacher;

import dao.relationshipdao;
import dao.scoredao;
import dao.teacherdao;
import dao.lessondao;
import model.Lesson;
import model.Relationship;
import model.Score;
import model.Teacher;
import dao.lemessagedao;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Teacherlogin extends HttpServlet
{
    public void doPost(HttpServletRequest request, HttpServletResponse response )
    {
        String output = null;
        try
        {
            String account_teacher = request.getParameter("account_teacher" );
            String password = request.getParameter("password");
            teacherdao dao = new teacherdao();
            boolean a = dao.teacherlogin(account_teacher,password);
            Teacher tch = dao.loginmainpage(account_teacher,password);

            // 公告栏逻辑
            lemessagedao lemessagedao = new lemessagedao();


            if(a){
                //用于通过教员号获取成绩和课程信息（公告用）
                System.out.println(tch.getTeacher_ID());
                relationshipdao dao2 = new relationshipdao();
                Relationship a1[] = dao2.getMyCourse(tch.getTeacher_ID());
                int count = dao2.getMyCoursenum(tch.getTeacher_ID());//通过教员号获取到的课程号有几个
                System.out.println(count);
                scoredao dao3 = new scoredao();
                lessondao lessondao = new lessondao();
                Lesson[] teacherlesson=new Lesson[count];
                int count2 = 0;
                for(Relationship elem:a1)
                {
                    teacherlesson[count2++]= lessondao.myLesson(elem.getLesson_num());

                }
                for (Lesson elem3: teacherlesson) {
                    System.out.println(elem3.getCredit()+" "+elem3.getLesson_name()+" "+elem3.getLesson_attributes());
                }


                for (Relationship elem: a1) {
                    Score stuScore[] = dao3.getStuScore(elem.getLesson_code());//用课程编号获取成绩信息
                    for (Score elem2: stuScore) {
                        System.out.println(elem2.getStudent_ID() + " : " + elem2.getFinalexam_score());
                    }

                }


                request.setAttribute("name",tch.getName());
                request.setAttribute("college",tch.getCollege());
                request.setAttribute("account_teacher",tch.getAccount_teacher());
                request.setAttribute("password",tch.getPassword());
                request.setAttribute("teacher_ID",tch.getTeacher_ID());
                request.setAttribute("teacherlesson",teacherlesson);
                request.setAttribute("Relationship",a1);
                RequestDispatcher rd = getServletContext().getRequestDispatcher( "/teachermainpage.jsp" );
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
