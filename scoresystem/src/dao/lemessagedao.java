package dao;

import model.Lessonmessage;
import util.DbHelper;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class lemessagedao {
    public Lessonmessage getLessonmessage(String lesson_code) throws SQLException {
        String sql = "SELECT * FROM bulletinboard WHERE cno=?";
        PreparedStatement ps = DbHelper.getConnection().prepareStatement(sql);
        ps.setString(1, lesson_code);
        ResultSet rs = ps.executeQuery();
        Lessonmessage ls = new Lessonmessage();
        while(rs.next()) {

            ls.setLessonmessage(rs.getString(2), rs.getString(1), rs.getString(3), rs.getString(4));
        }
        return ls;
    }

    public boolean updatemessage(String lesson_code,String bdate,String message) throws SQLException {
        //本函数用于更新公告信息
        String sql = "update bulletinboard SET bnotice=?,bdate=? where cno=?";
        PreparedStatement ps = DbHelper.getConnection().prepareStatement(sql);
        ps.setString(1,message);
        ps.setString(2,bdate);
        ps.setString(3,lesson_code);
        int rs = ps.executeUpdate();
        if(rs>0)//即至少完成了对一行的更新
        {
            return true;
        }
        else{
            return false;
        }
    }




}
