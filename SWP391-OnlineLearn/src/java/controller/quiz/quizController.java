/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.quiz;

import controller.auth.BaseAuthenticationController;
import dal.LessonDBContext;
import dal.QuestionDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Lesson;
import model.Lesson_learn;
import model.Question;
import model.User;

/**
 *
 * @author Acer
 */
public class quizController extends BaseAuthenticationController {

//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        
//        
//    }
    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        LessonDBContext lDB = new LessonDBContext();
//        int lesson_id = Integer.parseInt(req.getParameter("lesson_id"));
//        User user = (User) req.getSession().getAttribute("user");
//        lDB.updateLessonLearn(user.getUser_id(), lesson_id, true);
//        Lesson lesson = lDB.get(lesson_id);
//        Lesson_learn lessonLearn = lDB.getLessonLearn(user.getUser_id(), lesson_id);
//        req.setAttribute("lessonLearn", lessonLearn);
//        req.setAttribute("lesson", lesson);
//        req.setAttribute("lessonDone", lesson_id);
        String point = req.getParameter("point");
        req.setAttribute("point", point);
        req.getRequestDispatcher("../quiz/submitQuizSuccessful.jsp").forward(req, resp);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int lession_id = Integer.parseInt(req.getParameter("lession_id"));
        String lession_name = req.getParameter("lession_name");
        QuestionDBContext quDB = new QuestionDBContext();

        ArrayList<Question> questionBank = quDB.getQuestionByLessionID(lession_id);
        int total_points = questionBank.size()*10;
        
        req.setAttribute("total_points", total_points);
        req.setAttribute("questionBank", questionBank);
        req.setAttribute("lession_name", lession_name);
        req.getRequestDispatcher("../quiz/quiz.jsp").forward(req, resp);
    }

}
