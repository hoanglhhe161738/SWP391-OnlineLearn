/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.admin.lession;

import controller.auth.BaseAuthorizationController;
import dal.ClassDBContext;
import dal.CourseDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Account;
import model.Course;

/**
 *
 * @author Acer
 */
public class ChoiceClassToAddLession extends BaseAuthorizationController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        int class_id = Integer.parseInt(req.getParameter("grade"));
        CourseDBContext cDB = new CourseDBContext();
        ArrayList<Course> courses = cDB.listCoursebyClassId(class_id);
        req.getSession().setAttribute("class_id", class_id);
        req.getSession().setAttribute("coursesToAddLession", courses);
        req.getRequestDispatcher("./choiceLession.jsp").forward(req, resp);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        ClassDBContext clDB = new ClassDBContext();
        ArrayList<model.Class> classes = clDB.list();
        req.getSession().setAttribute("classesToAddLession", classes);
        req.getRequestDispatcher("./choiceLession.jsp").forward(req, resp);
    }

}
