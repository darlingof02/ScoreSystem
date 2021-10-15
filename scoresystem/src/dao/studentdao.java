package dao;

import model.Student;
import util.DbHelper;

import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class studentdao {


    //查询学生的账号和密码
    public boolean studentlogin(String account,String password) throws Exception {
        String sql = "SELECT * FROM stuinfo WHERE stuaccount=? and passwd=? ";
        PreparedStatement ps = DbHelper.getConnection().prepareStatement(sql);
        ps.setString(1, account);
        ps.setString(2,password);

        ResultSet rs = ps.executeQuery();

        System.out.println(rs);
        while(rs.next())
        {
            return true;
        }
        return false;
    }

    //获得学生姓名
    public String getStudentName(String stuID) throws Exception {
        String sql = "SELECT sname FROM stuinfo WHERE stuaccount=?";
        PreparedStatement ps = DbHelper.getConnection().prepareStatement(sql);
        ps.setString(1, stuID);

        ResultSet rs = ps.executeQuery();

        String StuName = null;
        System.out.println(rs);
        while(rs.next())
        {
            StuName = rs.getString(1);
        }
        return StuName;
    }

    public Student loginmainpage(String account,String password)throws Exception {
        String sql = "SELECT * FROM stuinfo WHERE stuaccount=? and passwd=? ";
        PreparedStatement ps = DbHelper.getConnection().prepareStatement(sql);
        ps.setString(1, account);
        ps.setString(2,password);
        ResultSet rs = ps.executeQuery();
        Student student =new Student();
        while(rs.next())
        {
            student.arrset(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDouble(8));
        }
        return student;
    }

    public boolean changepassword(String account,String password,String newpassword)throws Exception {
        String sql="SELECT sno FROM stuinfo WHERE stuaccount=? and passwd=?";
        PreparedStatement ps = DbHelper.getConnection().prepareStatement(sql);
        ps.setString(1, account);
        ps.setString(2,password);
        ResultSet rs = ps.executeQuery();
        if(rs.next())//如果成功得到了结果 说明原账号密码是正确的 此时可以修改密码了
        {
            String sno=rs.getString((1));
            String sql2="update stuinfo set passwd=? where sno=?";
            PreparedStatement ps2 = DbHelper.getConnection().prepareStatement(sql2);
            ps2.setString(1,newpassword);
            ps2.setString(2,sno);
            int result= ps2.executeUpdate();//返回更新的行数 如果是正常结果 此处为1
            if(result==1)
            {
                return true;
            }


        }
        return false;

    }



}

