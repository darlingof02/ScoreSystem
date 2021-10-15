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
import javax.swing.*;
import java.io.PrintWriter;

public class passwordchange extends HttpServlet {
    public void doPost( HttpServletRequest request, HttpServletResponse response )
    {
        String output = null;
        try
        {
            String account_student = request.getParameter("account_student" );
            String password = request.getParameter("password");
            String newpassword = request.getParameter("newpassword");
            studentdao studentdao=new studentdao();
            boolean flag = studentdao.changepassword(account_student,password,newpassword);//判断是否成功
            if(flag)
            {
                PrintWriter out = response.getWriter();
                out.print("<script>alert('change successful!');window.location='studentlogin.jsp' </script>");
                out.flush();
                out.close();

            }
            else
            {
                PrintWriter out = response.getWriter();
                out.print("<script>alert('change fail! please check the password');window.location='info.jsp' </script>");
                out.flush();
                out.close();
            }






        }
        catch( Exception e ){
        }
    }
}