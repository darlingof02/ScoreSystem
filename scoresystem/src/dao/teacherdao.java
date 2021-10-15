package dao;

import model.Teacher;
import util.DbHelper;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class teacherdao {
    public boolean teacherlogin(String account,String password) throws Exception {
        String sql = "SELECT * FROM tchinfo WHERE tchaccount=? and passwd=? ";
        PreparedStatement ps = DbHelper.getConnection().prepareStatement(sql);
        ps.setString(1, account);
        ps.setString(2,password);
        ResultSet rs = ps.executeQuery();
        while(rs.next())
        {
            return true;
        }
        return false;
    }

    public Teacher loginmainpage(String account, String password)throws Exception {
        String sql = "SELECT * FROM tchinfo WHERE tchaccount=? and passwd=? ";
        PreparedStatement ps = DbHelper.getConnection().prepareStatement(sql);
        ps.setString(1, account);
        ps.setString(2,password);
        ResultSet rs = ps.executeQuery();
        Teacher teacher =new Teacher();
        while(rs.next())
        {
            teacher.arrset(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));

        }
        return teacher;

    }
    public boolean changepassword(String account,String password,String newpassword)throws Exception {
        String sql="SELECT tno FROM tchinfo WHERE tchaccount=? and passwd=?";
        PreparedStatement ps = DbHelper.getConnection().prepareStatement(sql);
        ps.setString(1, account);
        ps.setString(2,password);
        ResultSet rs = ps.executeQuery();
        if(rs.next())//如果成功得到了结果 说明原账号密码是正确的 此时可以修改密码了
        {
            String tno=rs.getString((1));
            String sql2="update tchinfo set passwd=? where tno=?";
            PreparedStatement ps2 = DbHelper.getConnection().prepareStatement(sql2);
            ps2.setString(1,newpassword);
            ps2.setString(2,tno);
            int result= ps2.executeUpdate();//返回更新的行数 如果是正常结果 此处为1
            if(result==1)
            {
                return true;
            }


        }
        return false;

    }
}
