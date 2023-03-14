/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.course;

import controller.auth.BaseAuthenticationController;
import dal.CourseDBContext;
import dal.LessonDBContext;
import dal.ModuleDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Course;
import model.Lesson;
import model.Lesson_learn;
import model.Module;
import model.User;

/**
 *
 * @author Khangnekk
 */
public class modulesController extends BaseAuthenticationController {

    protected void setModuleStatus(ArrayList<Module> modules) {
        LessonDBContext lDB = new LessonDBContext();
        moduleController mCtr = new moduleController();
        for (Module m : modules) {
            ArrayList<Lesson> lessons = lDB.listLessonByModuleID(m.getModule_id());
            m.setStatus(mCtr.processModuleStatus(lessons));
        }
    }

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LessonDBContext lDB = new LessonDBContext();
        int user_id = Integer.parseInt(req.getParameter("user_id"));
        ArrayList<Lesson> lessonInCourse = (ArrayList<Lesson>) req.getSession().getAttribute("lessonInCourse");
        for(Lesson l : lessonInCourse){
            lDB.setLessonLearn(user_id, l.getLesson_id(), false);
        }
        processGet(req, resp);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int course_id = Integer.parseInt(req.getParameter("course_id"));
        int class_id = Integer.parseInt(req.getParameter("class_id"));
        LessonDBContext lDB = new LessonDBContext();
        ArrayList<Lesson> lessons = lDB.listLessonByCourseID(course_id);
        User user = (User) req.getSession().getAttribute("user");
        Lesson_learn ll = lDB.getLessonLearn(user.getUser_id(), lessons.get(0).getLesson_id());
        if (ll == null) {
            req.setAttribute("unregistered", 1);
        } else {
            req.setAttribute("unregistered", 0);
        }
        moduleController mCtr = new moduleController();
        ModuleDBContext mDB = new ModuleDBContext();
        CourseDBContext coDB = new CourseDBContext();
        ArrayList<Module> modules = mDB.listModuleByCourseID(course_id);
        setModuleStatus(modules);
        double percent = mCtr.getPercentLesson(modules);

        Course course = coDB.get(course_id);
        req.setAttribute("course", course);
        req.setAttribute("class_id", class_id);
        req.setAttribute("modules", modules);
        req.setAttribute("percent", percent);
        req.getSession().setAttribute("lessonInCourse", lessons);
        req.getRequestDispatcher("./modules.jsp").forward(req, resp);
    }

}
