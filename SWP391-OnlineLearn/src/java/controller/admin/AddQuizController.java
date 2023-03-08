/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.admin;

import dal.LessonDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Lesson;

/**
 *
 * @author Khangnekk
 */
public class AddQuizController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LessonDBContext lDB = new LessonDBContext();
        int lesson_id = Integer.parseInt(req.getParameter("lession"));
        Lesson lesson = lDB.get(lesson_id);
        req.getSession().setAttribute("lesson", lesson);
        req.getRequestDispatcher("./choiceQuizLession.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("./addQuiz.jsp").forward(req, resp);
    }
    
}
