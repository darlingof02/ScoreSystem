package test.Student;
//这个页面很可能没用 我忘记了

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

public class scorechange extends HttpServlet {
    public void doPost( HttpServletRequest request, HttpServletResponse response )
    {
        String output = null;
        try
        {
            String test=request.getParameter("Lesson_name1");

            request.setAttribute("result",test);

            int a=10;

            int c= a/0;


            RequestDispatcher rd = getServletContext().getRequestDispatcher( "/show_name.jsp" );
            rd.forward(request, response);
        }
        catch( Exception e ){
        }
    }
}
