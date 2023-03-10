/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.admin.quiz;

import dal.QuestionDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Question;

/**
 *
 * @author Khangnekk
 */
public class actionQuizController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        QuestionDBContext qDB = new QuestionDBContext();
        String action = req.getParameter("action");
        int index = Integer.parseInt(req.getParameter("index"));
        int question_id = Integer.parseInt(req.getParameter("question_id"));
        if(question_id!=-1){
            Question question = qDB.get(question_id);
            req.setAttribute("question", question);
        }
        req.setAttribute("action", action);
        req.setAttribute("index", index);
        req.setAttribute("add", "add");
        req.setAttribute("edit", "edit");
        req.setAttribute("delete", "delete");
        req.getRequestDispatcher("./addQuiz.jsp").forward(req, resp);
    }
    
}
