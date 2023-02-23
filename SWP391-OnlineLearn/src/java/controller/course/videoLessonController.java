/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.course;

import dal.LessonDBContext;
import dal.VideoDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Lesson;
import model.Video;

/**
 *
 * @author Khangnekk
 */
public class videoLessonController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            VideoDBContext vDB = new VideoDBContext();
            LessonDBContext lDB = new LessonDBContext();
            int lesson_id = Integer.parseInt(req.getParameter("lesson_id"));
            String embed_pattern = "https://www.youtube.com/embed/";
            Video video = vDB.getVideoByLessonID(lesson_id);
            Lesson lesson = lDB.get(lesson_id);
            String result = embed_pattern + video.getUrl();
            req.setAttribute("lesson", lesson);
            req.setAttribute("result", result);
            req.setAttribute("video", video);
            req.getRequestDispatcher("./videoLesson.jsp").forward(req, resp);
        } 
        catch (Exception e) {
            resp.sendRedirect("../500ERP/500.html");
        }
    }

}
