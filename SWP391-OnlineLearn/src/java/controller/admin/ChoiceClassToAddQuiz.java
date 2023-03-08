/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.admin;

import dal.ClassDBContext;
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
public class ChoiceClassToAddQuiz extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int class_id = Integer.parseInt(req.getParameter("grade"));
        CourseDBContext cDB = new CourseDBContext();
        ArrayList<Course> courses = cDB.listCoursebyClassId(class_id);
        req.getSession().setAttribute("class_id", class_id);
        req.getSession().setAttribute("coursesToAddQuiz", courses);
        req.getRequestDispatcher("./choiceQuizLession.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ClassDBContext clDB = new ClassDBContext();
        ArrayList<model.Class> classes = clDB.list();
        req.getSession().setAttribute("classesToAddQuiz", classes);
        req.getRequestDispatcher("./choiceQuizLession.jsp").forward(req, resp);
    }
    
}
