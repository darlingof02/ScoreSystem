package dao;

import model.Score;
import util.DbHelper;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class scoredao {
    //用学生id来查询该学生的全部成绩
    public Score[] getMyScore(String student_id) throws Exception{
        String sql1 = "SELECT count(*) as row_count FROM scorelist WHERE sno=?";
        PreparedStatement ps1 = DbHelper.getConnection().prepareStatement(sql1);
        ps1.setString(1, student_id);
        ResultSet rs1 = ps1.executeQuery();
        rs1.next();
        int cnt1 = rs1.getInt("row_count");
        Score[] myScore = new Score[cnt1];

        String sql2 = "SELECT * FROM scorelist WHERE sno=?";
        PreparedStatement ps2 = DbHelper.getConnection().prepareStatement(sql2);
        ps2.setString(1, student_id);
        ResultSet rs2 = ps2.executeQuery();
        int cnt2 = 0;
        while (rs2.next()) {
            myScore[cnt2++] = new Score(rs2.getString(1), rs2.getString(2), rs2.getString(3), rs2.getInt(4), rs2.getInt(5), rs2.getInt(6));
        }
        return myScore;
    }

    //用课程编号来查询该课程下的学生及其成绩
    public Score[] getStuScore(String cno) throws Exception{
        String sql1 = "SELECT count(*) as row_count FROM scorelist WHERE cno=?";
        PreparedStatement ps1 = DbHelper.getConnection().prepareStatement(sql1);
        ps1.setString(1, cno);
        ResultSet rs1 = ps1.executeQuery();
        rs1.next();
        int cnt1 = rs1.getInt("row_count");
        Score []stuScore = new Score[cnt1];
//        System.out.println("what the hell");
//        System.out.println(cnt1);

        String sql2 = "SELECT * FROM scorelist WHERE cno=?";
        PreparedStatement ps2 = DbHelper.getConnection().prepareStatement(sql2);
        ps2.setString(1, cno);
        ResultSet rs2 = ps2.executeQuery();
        int cnt2 = 0;
        while (rs2.next()) {
            stuScore[cnt2++] = new Score(rs2.getString(1), rs2.getString(2), rs2.getString(3), rs2.getInt(4), rs2.getInt(5), rs2.getInt(6));
        }
        return stuScore;
    }

    //通过老师的教工号获得其教授的课程
    public String[] getMyCno(String tno) throws Exception{
        //先从成绩表中，获取老师教授的课程号的个数
        String sql1 = "SELECT count(distinct cno) as row_count FROM scorelist WHERE tno=?";
        PreparedStatement ps1 = DbHelper.getConnection().prepareStatement(sql1);
        ps1.setString(1, tno);
        ResultSet rs1 = ps1.executeQuery();
        rs1.next();
        int cnt1 = rs1.getInt("row_count");
        String [] myCno = new String[cnt1];
        //再初始化老师教授的课程号
        String sql2 = "SELECT * FROM scorelist WHERE tno=?";
        PreparedStatement ps2 = DbHelper.getConnection().prepareStatement(sql2);
        ps2.setString(1, tno);
        ResultSet rs2 = ps2.executeQuery();
        int cnt2 = 0;
        while (rs2.next()) {
            myCno[cnt2++] = rs2.getString(2);
        }
        return myCno;
    }

    public boolean tscorechange(String student_ID,String lesson_code,int usualscore,int attendscore,int finalscore) throws SQLException {
        //本函数用于更新公告信息
        try {
            String sql5 = "update scorelist set UsualPerformance=?,Attendance=?,FinalScore=? where Cno=? and Sno=?";
            PreparedStatement ps5 = DbHelper.getConnection().prepareStatement(sql5);
            ps5.setInt(1, usualscore);
            ps5.setInt(2, attendscore);
            ps5.setInt(3, finalscore);
            ps5.setString(4, lesson_code);
            ps5.setString(5, student_ID);

            System.out.println(ps5.toString());


            System.out.println("1111");
            System.out.println(student_ID);
            System.out.println(lesson_code);
            System.out.println(usualscore);
            System.out.println(finalscore);
            System.out.println(attendscore);
            //到这里都没问题
            int res = ps5.executeUpdate();
            if (res > 0)//即至少完成了对一行的更新
            {
                return true;
            } else {
                return false;
            }
        }
        catch (SQLException e){
            e.printStackTrace();
            System.out.println("error");
            return false;

        }


    }

    public double tellGPA(double grade) {
        if (grade >= 90) return 4;
        else if(grade >=85 && grade <90) return 3.7;
        else if(grade >=80 && grade <85) return 3.3;
        else if(grade >=76 && grade <80) return 3.0;
        else if(grade >=73 && grade < 76) return 2.7;
        else if(grade >=70 && grade < 73) return 2.3;
        else if(grade >=66 && grade < 70) return 2;
        else if(grade >=63 && grade < 66) return 1.7;
        else if(grade >=61 && grade < 63) return 1.3;
        else if(grade == 60) return 1;
        else return 0;

    }




}
