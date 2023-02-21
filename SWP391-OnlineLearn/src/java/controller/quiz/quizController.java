/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.quiz;

import dal.QuestionDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Question;

/**
 *
 * @author Acer
 */
public class quizController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       int lession_id = Integer.parseInt(req.getParameter("lession_id"));
        QuestionDBContext quDB = new QuestionDBContext();
        ArrayList<Question> questionBank = quDB.getQuestionByLessonID(lession_id);
        
        req.setAttribute("questionBank", questionBank);
        req.getRequestDispatcher("q").forward(req, resp);
    }
    
}
