/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.admin.lession;

import controller.auth.BaseAuthorizationController;
import dal.CourseDBContext;
import dal.LessonDBContext;
import dal.ModuleDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Account;
import model.Course;
import model.Lesson;
import model.Module;

/**
 *
 * @author Acer
 */
public class ChoiceCourseToAddLession extends BaseAuthorizationController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        int module_id = Integer.parseInt(req.getParameter("module"));
        LessonDBContext lDB = new LessonDBContext();
        ModuleDBContext mDB = new ModuleDBContext();
        Module module = mDB.get(module_id);
        ArrayList<Lesson> lessons = lDB.listLessonByModuleID(module_id);
        int number_of_lessions = lessons.size();
        
        req.getSession().setAttribute("number_of_lessions", number_of_lessions);
        req.getSession().setAttribute("module", module);
        req.getSession().setAttribute("lessions", lessons);
        req.setAttribute("action", "-1");
        
        req.getRequestDispatcher("./addLession.jsp").forward(req, resp);
       
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        int course_id = Integer.parseInt(req.getParameter("course"));
        CourseDBContext cDB = new CourseDBContext();
        Course course = cDB.get(course_id);
        ModuleDBContext mDB = new ModuleDBContext();
        ArrayList<Module> modules = mDB.listModuleByCourseID(course_id);
        req.getSession().setAttribute("modulesToAddLession", modules);
        req.getSession().setAttribute("course", course);
        req.getRequestDispatcher("./choiceLession.jsp").forward(req, resp);
    }
    
    
}
