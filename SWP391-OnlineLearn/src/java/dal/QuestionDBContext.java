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
    
    public ArrayList<Question> getQuestionByLessionID(int lession_id){
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
            while(rs.next()){
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

    @Override
    public void insert(Question model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Question model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Question model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Question get(int id) {
        Question question = new Question();
        String sql = "SELECT * FROM Question WHERE question_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
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
    
}
