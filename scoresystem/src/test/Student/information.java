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

public class information extends HttpServlet {
    public void doPost( HttpServletRequest request, HttpServletResponse response )
    {
        String output = null;
        try
        {
            String account_student = request.getParameter("account_student" );
            String password = request.getParameter("password");
            studentdao studentdao=new studentdao();
            Student stu=new Student();
            stu=studentdao.loginmainpage(account_student,password);

            //获取信息后传入infopage
            request.setAttribute("name",stu.getName());
            request.setAttribute("major",stu.getMajor());
            request.setAttribute("account_student",stu.getAccount_student());
            request.setAttribute("password",stu.getPassword());
            request.setAttribute("student_ID",stu.getStudent_ID());
            request.setAttribute("Revised_credits",stu.getRevised_credits());
            RequestDispatcher rd = getServletContext().getRequestDispatcher( "/info.jsp" );
            rd.forward(request, response);





        }
        catch( Exception e ){
        }
    }
}