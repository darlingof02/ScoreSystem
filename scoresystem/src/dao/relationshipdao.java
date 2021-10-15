package dao;

import model.Lessonmessage;
import model.Relationship;
import util.DbHelper;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class relationshipdao {
    public Relationship[] getMyCourse(String tno) throws Exception{
        //先从关系表中，获取老师教授的课程号的个数
        String sql1 = "SELECT count(*) as row_count FROM crelationship WHERE tno=?";
        PreparedStatement ps1 = DbHelper.getConnection().prepareStatement(sql1);
        ps1.setString(1, tno);
        ResultSet rs1 = ps1.executeQuery();
        rs1.next();
        int cnt1 = rs1.getInt("row_count");
        Relationship[] MyCourse = new Relationship[cnt1];
        //再初始化老师教授的课程号
        String sql2 = "SELECT * FROM crelationship WHERE tno=?";
        PreparedStatement ps2 = DbHelper.getConnection().prepareStatement(sql2);
        ps2.setString(1, tno);
        ResultSet rs2 = ps2.executeQuery();
        int cnt2 = 0;
        while (rs2.next()) {
            MyCourse[cnt2++] = new Relationship(rs2.getString(1), rs2.getString(2), rs2.getString(3));
        }
        return MyCourse;
    }

    public int getMyCoursenum(String tno) throws Exception{
        //本函数用于获取老师教授的课程号的个数
        String sql1 = "SELECT count(*) as row_count FROM crelationship WHERE tno=?";
        PreparedStatement ps1 = DbHelper.getConnection().prepareStatement(sql1);
        ps1.setString(1, tno);
        ResultSet rs1 = ps1.executeQuery();
        rs1.next();
        int cnt1 = rs1.getInt("row_count");
        return cnt1;
    }
}
