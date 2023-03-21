/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.admin.matchgame;

import controller.auth.BaseAuthorizationController;
import dal.ClassDBContext;
import dal.CourseDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Account;
import model.Course;
import model.Class;

/**
 *
 * @author Acer
 */
public class ChoiceClassToAddGame extends BaseAuthorizationController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        int class_id = Integer.parseInt(req.getParameter("grade"));
        CourseDBContext cDB = new CourseDBContext();
        ArrayList<Course> courses = cDB.listCoursebyClassId(class_id);
        req.getSession().setAttribute("class_id_game", class_id);
        req.getSession().setAttribute("coursesToAddGame", courses);
        req.getRequestDispatcher("./choiceGameLession.jsp").forward(req, resp);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        ClassDBContext clDB = new ClassDBContext();
        ArrayList<model.Class> classes = clDB.list();
        req.getSession().setAttribute("classesToAddGame", classes);
        req.getRequestDispatcher("./choiceGameLession.jsp").forward(req, resp);
    }

}
