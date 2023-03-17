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
import model.Account;
import dal.UserDBContext;
import java.util.List;
import model.*;

/**
 *
 * @author T490
 */
public class TotalUserManager extends BaseAuthorizationController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        UserDBContext udb = new UserDBContext();
        String keyRAW = req.getParameter("keyTotal");
        List<User> list = udb.getTotalUserByKey(keyRAW);
        req.setAttribute("totalUsers", list);
        req.getRequestDispatcher("userManagement.jsp").forward(req, resp);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        UserDBContext udb = new UserDBContext();
        List<User> list = udb.getTotalUser();
        req.setAttribute("totalUsers", list);
        req.getRequestDispatcher("./userManagement.jsp").forward(req, resp);
    }

}
