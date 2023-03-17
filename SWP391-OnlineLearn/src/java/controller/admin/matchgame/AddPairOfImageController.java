/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.admin.matchgame;

import controller.auth.BaseAuthorizationController;
import dal.LessonDBContext;
import dal.MatchGameDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Account;
import model.Lesson;
import model.MatchGame;

/**
 *
 * @author Acer
 */
public class AddPairOfImageController extends BaseAuthorizationController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        LessonDBContext lDB = new LessonDBContext();
        int lesson_id = Integer.parseInt(req.getParameter("lession"));
        Lesson lesson = lDB.get(lesson_id);
        req.getSession().setAttribute("lesson", lesson);
        req.getRequestDispatcher("./choiceGameLession.jsp").forward(req, resp);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        MatchGameDBContext mgDB = new MatchGameDBContext();
        Lesson lesson = (Lesson) req.getSession().getAttribute("lesson");
        ArrayList<MatchGame> pairs = mgDB.getMatchGamePairsByLessionID(lesson.getLesson_id());
        int numberofpairs = pairs.size();
        req.getSession().setAttribute("image_pairs",pairs);
        req.getSession().setAttribute("numberofpairs", numberofpairs);
        req.setAttribute("action", "-1");
        req.getRequestDispatcher("./addMatchGame.jsp").forward(req, resp);
    }
    
}
