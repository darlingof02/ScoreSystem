package test.Teacher;

import dao.lemessagedao;
import dao.lessondao;
import dao.scoredao;
import dao.studentdao;
import dao.teacherdao;
import model.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;
public class Teacherannounce extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        try
        {
            request.setCharacterEncoding("utf-8");
            String flesson_code = request.getParameter("flesson_code2");
            String flesson_name = request.getParameter("flesson_name2");
            String announce_date =request.getParameter("announcedate");
            String remark = request.getParameter("remark");
      //      System.out.println("jinru");
        //    System.out.println(flesson_code);
          //  System.out.println(flesson_name);
            //System.out.println(announce_date);
            //System.out.println(remark);
            //获取表单信息
            lemessagedao lemessagedao = new lemessagedao();//创建课程信息（公告信息)dao
            boolean flag = lemessagedao.updatemessage(flesson_code,announce_date,remark);//更新 返回一个是否成功更新的flag变量
            RequestDispatcher rd = getServletContext().getRequestDispatcher( "/Teacherlogin" );
            rd.forward(request, response);














        }
        catch( Exception e ){
        }
    }
}
