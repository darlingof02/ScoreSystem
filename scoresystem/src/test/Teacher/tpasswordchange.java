package test.Teacher;

import dao.lemessagedao;
import dao.lessondao;
import dao.scoredao;
import dao.studentdao;
import dao.teacherdao;
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

public class tpasswordchange extends HttpServlet {
    public void doPost( HttpServletRequest request, HttpServletResponse response )
    {
        String output = null;
        try
        {
            String account_teacher = request.getParameter("account_teacher" );
            String password = request.getParameter("password");
            String newpassword = request.getParameter("newpassword");
            teacherdao teacherdao = new teacherdao();
            boolean flag = teacherdao.changepassword(account_teacher,password,newpassword);//判断是否成功
            if(flag)
            {
                PrintWriter out = response.getWriter();
                out.print("<script>alert('change successful!');window.location='teacherlogin.jsp' </script>");
                out.flush();
                out.close();



            }
            else
            {
                PrintWriter out = response.getWriter();
                out.print("<script>alert('change fail! please check the password');window.location='tinfo.jsp' </script>");
                out.flush();
                out.close();
            }






        }
        catch( Exception e ){
        }
    }
}