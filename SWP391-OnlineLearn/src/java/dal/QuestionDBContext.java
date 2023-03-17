/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Question;

/**
 *
 * @author Acer
 */
public class QuestionDBContext extends DBContext<Question> {

    public ArrayList<Question> getQuestionByLessionID(int lession_id) {
        ArrayList<Question> questionBanks = new ArrayList<>();
        try {
            String sql = "SELECT qu.[index], qu.question_id, qu.question, qu.option1, qu.option2,\n"
                    + "		qu.option3,qu.option4,qu.true_answer, qu.points\n"
                    + "FROM Question qu \n"
                    + "inner join Lession_Question lq on lq.question_id = qu.question_id\n"
                    + "inner join Lession l on l.lession_id = lq.lession_id\n"
                    + "WHERE l.lession_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lession_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Question question = new Question();
                question.setIndex(rs.getInt("index"));
                question.setQuestion_id(rs.getInt("question_id"));
                question.setQuestion(rs.getString("question"));
                question.setOption1(rs.getString("option1"));
                question.setOption2(rs.getString("option2"));
                question.setOption3(rs.getString("option3"));
                question.setOption4(rs.getString("option4"));
                question.setTrue_answer(rs.getString("true_answer"));
                question.setPoints(rs.getInt("points"));

                questionBanks.add(question);

            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return questionBanks;
    }

    public void updateIndexQuestion(int lession_id) {
        String sqlSelect = "SELECT qu.[index], qu.question_id, qu.question, qu.option1, qu.option2,\n"
                + "		qu.option3,qu.option4,qu.true_answer, qu.points\n"
                + "FROM Question qu \n"
                + "inner join Lession_Question lq on lq.question_id = qu.question_id\n"
                + "inner join Lession l on l.lession_id = lq.lession_id\n"
                + "WHERE l.lession_id = ?";
        try {
            PreparedStatement stmSelect = connection.prepareStatement(sqlSelect);
            stmSelect.setInt(1, lession_id);
            ResultSet rs = stmSelect.executeQuery();
            int newIndex = 1;
            while (rs.next()) {
                int currentIndex = rs.getInt("index");
                if (newIndex != currentIndex) {
                    String sqlUpdate = "UPDATE [dbo].[Question]\n"
                            + "   SET [index] = ?\n"
                            + " WHERE [index] = ?";
                    PreparedStatement stmUPdate = connection.prepareStatement(sqlUpdate);
                    stmUPdate.setInt(1, newIndex);
                    stmUPdate.setInt(2, currentIndex);
                    stmUPdate.executeUpdate();
                }
                newIndex++;
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insert(Question model, int lesson_id) {
        String sql = "INSERT INTO [dbo].[Question]\n"
                + "           ([question]\n"
                + "           ,[option1]\n"
                + "           ,[option2]\n"
                + "           ,[option3]\n"
                + "           ,[option4]\n"
                + "           ,[true_answer]\n"
                + "           ,[points]\n"
                + "           ,[index])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getQuestion());
            stm.setString(2, model.getOption1());
            stm.setString(3, model.getOption2());
            stm.setString(4, model.getOption3());
            stm.setString(5, model.getOption4());
            stm.setString(6, model.getTrue_answer());
            stm.setInt(7, model.getPoints());
            stm.setInt(8, model.getIndex());
            stm.executeUpdate();
            int question_id = getIdByQuestion(model);
            if (question_id != -1) {
                insertLessonQuestion(question_id, lesson_id);
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getIdByQuestion(Question model) {
        int question_id = -1;
        String sql = "SELECT q.question_id FROM Question q WHERE\n"
                + "q.option1 = ?\n"
                + "AND q.option2 = ?\n"
                + "AND q.option3 = ?\n"
                + "AND q.option4 = ?\n"
                + "AND q.true_answer = ?\n"
                + "AND q.points = ?\n"
                + "AND q.[index] = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getOption1());
            stm.setString(2, model.getOption2());
            stm.setString(3, model.getOption3());
            stm.setString(4, model.getOption4());
            stm.setString(5, model.getTrue_answer());
            stm.setInt(6, model.getPoints());
            stm.setInt(7, model.getIndex());
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                question_id = rs.getInt("question_id");
                return question_id;
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return question_id;
    }

    public void insertLessonQuestion(int question_id, int lesson_id) {
        String sql = "INSERT INTO [dbo].[Lession_Question]\n"
                + "           ([lession_id]\n"
                + "           ,[question_id])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lesson_id);
            stm.setInt(2, question_id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void update(Question model) {
        String sql = "UPDATE [dbo].[Question]\n"
                + "   SET [question] = ?\n"
                + "      ,[option1] = ?\n"
                + "      ,[option2] = ?\n"
                + "      ,[option3] = ?\n"
                + "      ,[option4] = ?\n"
                + "      ,[true_answer] = ?\n"
                + "      ,[points] = ?\n"
                + "      ,[index] = ?\n"
                + " WHERE question_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getQuestion());
            stm.setString(2, model.getOption1());
            stm.setString(3, model.getOption2());
            stm.setString(4, model.getOption3());
            stm.setString(5, model.getOption4());
            stm.setString(6, model.getTrue_answer());
            stm.setInt(7, model.getPoints());
            stm.setInt(8, model.getIndex());
            stm.setInt(9, model.getQuestion_id());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void delete(Question model) {

    }

    public void delete(int question_id) {
        String sql = "DELETE FROM [dbo].[Question]\n"
                + "      WHERE question_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, question_id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteLessonQuestion(int question_id) {
        String sql = "DELETE FROM [dbo].[Lession_Question]\n"
                + "      WHERE question_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, question_id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public Question get(int id) {
        Question question = new Question();
        String sql = "SELECT * FROM Question WHERE question_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                question.setQuestion_id(rs.getInt("question_id"));
                question.setQuestion(rs.getString("question"));
                question.setOption1(rs.getString("option1"));
                question.setOption2(rs.getString("option2"));
                question.setOption3(rs.getString("option3"));
                question.setOption4(rs.getString("option4"));
                question.setTrue_answer(rs.getString("true_answer"));
                question.setPoints(rs.getInt("points"));
                question.setIndex(rs.getInt("index"));
                return question;
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return question;
    }

    @Override
    public ArrayList<Question> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Question model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
