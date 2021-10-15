package test.Teacher;

import dao.lemessagedao;
import dao.scoredao;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Scorechange extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        try
        {
            request.setCharacterEncoding("utf-8");//设置servelet编码为utf-8
            String fstudent_ID = request.getParameter("fstudent_ID");
            String flesson_code = request.getParameter("flesson_code");
            int UsualPerformance =Integer.parseInt(request.getParameter("UsualPerformance"));
            int FinalScore =Integer.parseInt(request.getParameter("FinalScore"));
            int Attendance =Integer.parseInt(request.getParameter("Attendance"));
            //获取表单提交的成绩表信息 接下来更新成绩表
            System.out.println(fstudent_ID);
            System.out.println(flesson_code);
            System.out.println(UsualPerformance);
            System.out.println(FinalScore);
            System.out.println(Attendance);

            //获取表单信息
            scoredao scoredao=new scoredao();
            boolean flag = scoredao.tscorechange(fstudent_ID,flesson_code,UsualPerformance,Attendance,FinalScore);//更新 返回一个是否成功更新的flag变量
            RequestDispatcher rd = getServletContext().getRequestDispatcher( "/TeacherLesson" );
            rd.forward(request, response);
        }
        catch( Exception e ){
        }
    }
}