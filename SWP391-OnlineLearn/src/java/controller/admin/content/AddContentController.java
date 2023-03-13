/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.admin.content;

import controller.auth.BaseAuthorizationController;
import dal.ContentDBContext;
import dal.LessonDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Account;
import model.Content;
import model.Lesson;

/**
 *
 * @author Acer
 */
public class AddContentController extends BaseAuthorizationController {

    
    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        LessonDBContext lDB = new LessonDBContext();
        int lesson_id = Integer.parseInt(req.getParameter("lession"));
        Lesson lesson = lDB.get(lesson_id);
        req.getSession().setAttribute("lesson", lesson);
        req.getRequestDispatcher("./choiceContentLession.jsp").forward(req, resp);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        ContentDBContext conDB = new ContentDBContext();
        Lesson lesson = (Lesson) req.getSession().getAttribute("lesson");
        
        ArrayList<Content> contentList = conDB.getContentListByLessionID(lesson.getLesson_id());
        int number_of_contents = contentList.size();
        req.getSession().setAttribute("number_of_contents", number_of_contents);
        req.getSession().setAttribute("contents", contentList);
        
        req.setAttribute("action", "-1");
        req.getRequestDispatcher("./addContent.jsp").forward(req, resp);
    }
    
}