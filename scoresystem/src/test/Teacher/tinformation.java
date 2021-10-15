package test.Teacher;

import dao.lemessagedao;
import dao.lessondao;
import dao.scoredao;
import dao.teacherdao;
import model.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class tinformation extends HttpServlet {
    public void doPost( HttpServletRequest request, HttpServletResponse response )
    {
        String output = null;
        try
        {
            String account_teacher = request.getParameter("account_teacher" );
            String password = request.getParameter("password");
            System.out.println("jinxingdaozheli");
            teacherdao teacherdao=new teacherdao();
            Teacher Teacher=new Teacher();
            Teacher=teacherdao.loginmainpage(account_teacher,password);

            //获取信息后传入infopage
            request.setAttribute("account_teacher", Teacher.getTeacher_ID());
            request.setAttribute("password", Teacher.getPassword());
            request.setAttribute("name",Teacher.getName());
            request.setAttribute("college",Teacher.getCollege());
            request.setAttribute("teacher_ID",Teacher.getTeacher_ID());
            RequestDispatcher rd = getServletContext().getRequestDispatcher( "/tinfo.jsp" );
            rd.forward(request, response);





        }
        catch( Exception e ){
        }
    }
}
