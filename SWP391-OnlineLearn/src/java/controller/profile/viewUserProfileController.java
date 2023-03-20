/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.profile;

import controller.auth.BaseAuthenticationController;
import dal.CourseDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Course;
import model.User;

/**
 *
 * @author Khangnekk
 */
public class viewUserProfileController extends BaseAuthenticationController{

//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        req.getRequestDispatcher("./userprofile.jsp").forward(req, resp);
//    }

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CourseDBContext cDB = new CourseDBContext();
        User user = (User) req.getSession().getAttribute("user");
        ArrayList<Course> registeredCourses = cDB.registeredCourse(user.getUser_id());
        req.setAttribute("registeredCourses", registeredCourses);
        req.getRequestDispatcher("./userprofile.jsp").forward(req, resp);
    }
    
}
