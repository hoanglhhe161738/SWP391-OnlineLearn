/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.course;

import controller.auth.BaseAuthenticationController;
import dal.CourseDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Course;

/**
 *
 * @author Khangnekk
 */
public class courseController extends BaseAuthenticationController{


    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int class_id = Integer.parseInt(req.getParameter("class_id"));
        CourseDBContext coDB = new CourseDBContext();
        ArrayList<Course> courses = coDB.listCoursebyClassId(class_id);
        String math = "Toán";
        String literature = "Tiếng Việt";
        String english = "Tiếng Anh";
        
        req.setAttribute("math", math);
        req.setAttribute("literature", literature);
        req.setAttribute("english", english);
        req.setAttribute("class_id", class_id);
        req.setAttribute("courses", courses);
        req.getRequestDispatcher("./course.jsp").forward(req, resp);
    }
    
}
