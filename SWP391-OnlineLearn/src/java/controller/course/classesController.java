/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.course;

import dal.ClassDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Class;
import controller.auth.BaseAuthenticationController;

/**
 *
 * @author Khangnekk
 */
public class classesController extends BaseAuthenticationController{

//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        ClassDBContext clDB = new ClassDBContext();
//        ArrayList<Class> classes = clDB.list();
//        req.setAttribute("classes", classes);
//        req.getRequestDispatcher("./classes.jsp").forward(req, resp);
//    }

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ClassDBContext clDB = new ClassDBContext();
        ArrayList<Class> classes = clDB.list();
        req.setAttribute("classes", classes);
        req.getRequestDispatcher("./classes.jsp").forward(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
