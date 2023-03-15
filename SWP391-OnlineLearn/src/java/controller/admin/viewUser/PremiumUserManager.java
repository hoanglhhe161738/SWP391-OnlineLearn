/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.viewUser;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import controller.auth.BaseAuthorizationController;
import dal.UserDBContext;
import java.util.List;
import model.Account;
import model.User;

/**
 *
 * @author T490
 */
public class PremiumUserManager extends BaseAuthorizationController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        UserDBContext udb = new UserDBContext();
        String keyRAW = req.getParameter("keyPremium");
        List<User> list = udb.getPremiumUserByKey(keyRAW);
        req.setAttribute("premiumUsers", list);
        req.getRequestDispatcher("./userManagement.jsp").forward(req, resp);

    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        UserDBContext udb = new UserDBContext();
        List<User> list = udb.getPremiumUser();
        req.setAttribute("premiumUsers", list);
        req.getRequestDispatcher("./userManagement.jsp").forward(req, resp);
    }

}
