/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.admin.viewUser;

import controller.auth.BaseAuthorizationController;
import dal.AccountDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Account;

/**
 *
 * @author Khangnekk
 */
public class UserManagement extends BaseAuthorizationController{

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        AccountDBContext aDB = new AccountDBContext();
        int total = aDB.getNumberOfTotalUser();
        int premium = aDB.getNumberOfPremiumUser();
        int normal = aDB.getNumberOfNormalUser();
        req.getSession().setAttribute("total", total);
        req.getSession().setAttribute("premium", premium);
        req.getSession().setAttribute("normal", normal);
        req.getRequestDispatcher("./userManagement.jsp").forward(req, resp);
    }
    
}
