/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.admin.module;

import controller.auth.BaseAuthorizationController;
import dal.CourseDBContext;
import dal.ModuleDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Account;
import model.Course;
import model.Module;

/**
 *
 * @author Acer
 */
public class ChoiceCourseToAddModule extends BaseAuthorizationController {

   
    

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        int course_id = Integer.parseInt(req.getParameter("course"));
        CourseDBContext cDB = new CourseDBContext();
        Course course = cDB.get(course_id);
        ModuleDBContext mDB = new ModuleDBContext();
        ArrayList<Module> modules = mDB.listModuleByCourseID(course_id);
        int number_of_modules = modules.size();
        
        req.getSession().setAttribute("number_of_modules", number_of_modules);
        req.getSession().setAttribute("modules", modules);
        req.getSession().setAttribute("course", course);
        req.setAttribute("action", "-1");
        req.getRequestDispatcher("./addModule.jsp").forward(req, resp);
        
    }

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        req.getRequestDispatcher("./choiceModule.jsp").forward(req, resp);
    }
    
}
