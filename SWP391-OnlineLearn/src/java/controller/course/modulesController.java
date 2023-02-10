/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.course;

import dal.CourseDBContext;
import dal.ModuleDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Course;
import model.Module;

/**
 *
 * @author Khangnekk
 */
public class modulesController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int course_id = Integer.parseInt(req.getParameter("course_id"));
        ModuleDBContext mDB = new ModuleDBContext();
        CourseDBContext coDB = new CourseDBContext();
        ArrayList<Module> modules = mDB.listModuleByCourseID(course_id);
        Course course = coDB.get(course_id);
        req.setAttribute("course", course);
        req.setAttribute("modules", modules);
        req.getRequestDispatcher("./modules.jsp").forward(req, resp);
    }
    
}
