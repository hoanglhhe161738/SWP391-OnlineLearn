/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.course;

import controller.auth.BaseAuthenticationController;
import dal.LessonDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Lesson;
import model.Lesson_learn;
import model.User;

/**
 *
 * @author Khangnekk
 */
public class lessonChoiceController extends BaseAuthenticationController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LessonDBContext lDB = new LessonDBContext();
        int lesson_id = Integer.parseInt(req.getParameter("lesson_id"));
        User user = (User) req.getSession().getAttribute("user");
        lDB.updateLessonLearn(user.getUser_id(), lesson_id, true);
        Lesson lesson = lDB.get(lesson_id);
        Lesson_learn lessonLearn = lDB.getLessonLearn(user.getUser_id(), lesson_id);
        req.setAttribute("lessonLearn", lessonLearn);
        req.setAttribute("lesson", lesson);
        req.setAttribute("lessonDone", lesson_id);
        req.getRequestDispatcher("./lessonChoice.jsp").forward(req, resp);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int lesson_id = Integer.parseInt(req.getParameter("lesson_id"));
        LessonDBContext lDB = new LessonDBContext();
        Lesson lesson = lDB.get(lesson_id);
        User user = (User) req.getSession().getAttribute("user");
        Lesson_learn lessonLearn = lDB.getLessonLearn(user.getUser_id(), lesson_id);
        if (lessonLearn == null) {
            lessonLearn = lDB.setLessonLearn(user.getUser_id(), lesson_id, false);
            lesson.setStatus(false);
        }
        req.setAttribute("lessonLearn", lessonLearn);
        req.setAttribute("lesson", lesson);
        req.setAttribute("lessonDone", lesson_id);
        req.getRequestDispatcher("./lessonChoice.jsp").forward(req, resp);
    }

}
