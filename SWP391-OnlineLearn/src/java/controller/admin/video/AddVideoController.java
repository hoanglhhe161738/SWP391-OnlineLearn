/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.admin.video;

import controller.auth.BaseAuthorizationController;
import dal.LessonDBContext;
import dal.QuestionDBContext;
import dal.VideoDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Account;
import model.Lesson;
import model.Video;

/**
 *
 * @author Khangnekk
 */
public class AddVideoController extends BaseAuthorizationController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        LessonDBContext lDB = new LessonDBContext();
        int lesson_id = Integer.parseInt(req.getParameter("lession"));
        Lesson lesson = lDB.get(lesson_id);
        req.getSession().setAttribute("lesson", lesson);
        req.getRequestDispatcher("./choiceVideoLesson.jsp").forward(req, resp);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        VideoDBContext vDB = new VideoDBContext();
        Lesson lesson = (Lesson) req.getSession().getAttribute("lesson");
        Video video = vDB.getVideoByLessonID(lesson.getLesson_id());
        if (video != null) {
            String originURL = "https://www.youtube.com/watch?v=" + video.getUrl();
            req.getSession().setAttribute("originURL", originURL);
        }
        req.setAttribute("action", "-1");
        req.getSession().setAttribute("video", video);
        req.getRequestDispatcher("./addVideo.jsp").forward(req, resp);
    }

}
