/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.home;

import controller.auth.BaseAuthenticationController;
import dal.UserDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Account;
import model.User;

/**
 *
 * @author Khangnekk
 */
public class homeController extends BaseAuthenticationController {

//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        UserDBContext uDB = new UserDBContext();
//        Account acc = (Account) req.getSession().getAttribute("account");
//        User user = uDB.getUserByUsername(acc.getUsername());
//        req.setAttribute("user", user);
//        req.getRequestDispatcher("./home.jsp").forward(req, resp);
////        resp.sendRedirect("./home.jsp");
//    }

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        UserDBContext uDB = new UserDBContext();
//        Account acc = (Account) req.getSession().getAttribute("account");
//        User user = uDB.getUserByUsername(acc.getUsername());
//        req.setAttribute("user", user);
        req.getRequestDispatcher("./home.jsp").forward(req, resp);
    }

}
