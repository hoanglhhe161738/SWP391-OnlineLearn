/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.course;

import controller.auth.BaseAuthenticationController;
import dal.DBContext;
import dal.LessonDBContext;
import dal.ModuleDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Lesson;
import model.Lesson_learn;
import model.Module;
import model.User;

/**
 *
 * @author Khangnekk
 */
public class moduleController extends BaseAuthenticationController {

    protected void doPostProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    protected void doGetProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }


    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int module_id = Integer.parseInt(req.getParameter("module_id"));
        User user = (User) req.getSession().getAttribute("user");
        ModuleDBContext mDB = new ModuleDBContext();
        LessonDBContext lDB = new LessonDBContext();
        ArrayList<Lesson> lessons = lDB.listLessonByModuleID(module_id);
        Module module = mDB.get(module_id);
        req.setAttribute("module", module);
        req.setAttribute("lessons", lessons);
        ArrayList<Lesson_learn> lls = new ArrayList<>();
        for (Lesson lesson : lessons) {
            Lesson_learn ll = lDB.getLessonLearn(user.getUser_id(), lesson.getLesson_id());
            lls.add(ll);
        }
        double percent = getProcessOfModule(module_id,user.getUser_id());
        req.setAttribute("percent", percent);
        req.setAttribute("lesson_idIn1st", lls.get(0));
        req.getSession().setAttribute("Lesson_learns", lls);
        
        req.getRequestDispatcher("./module.jsp").forward(req, resp);
    }
    
    public double getProcessOfModule(int module_id, int user_id){
        double modulePercent;
        
        ModuleDBContext mDB = new ModuleDBContext();
        
        double learned = (double) mDB.numberOfLessonLearned(module_id,user_id);
        double all = (double) mDB.numberOfLesson(module_id,user_id);
        modulePercent = (learned * 100)/all;
        return Math.round(modulePercent * 100.0) / 100.0;
    }
}
