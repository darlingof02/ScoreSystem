package dao;

import model.Lesson;
import util.DbHelper;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class lessondao {

    public Lesson myLesson(String lesson_num) throws SQLException {
        String sql = "SELECT * FROM clinfo WHERE cnumber=?";
        PreparedStatement ps = DbHelper.getConnection().prepareStatement(sql);
        ps.setString(1,lesson_num);
        ResultSet rs = ps.executeQuery();
        Lesson l1 = new Lesson();
        while (rs.next())
        {
            l1.setLesson(rs.getDouble(1), rs.getString(2), rs.getString(3), rs.getString(4));
        }
        return l1;
    }
}
