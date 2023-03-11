/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.forgetPassword;

import controller.payment.*;
import dal.AccountDBContext;
import dal.UserDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.Account;
import model.User;

/**
 *
 * @author Khangnekk
 */
public class VerifyCode extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }
    
    void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String verifyCode = req.getParameter("confirm").trim();
        
        HttpSession verifyPremium = req.getSession();
        String Code = String.valueOf(verifyPremium.getAttribute("verifyCode"));
        
        req.setAttribute("tk", "Thank you!");
        
        if(verifyCode.equals(Code)){
            req.setAttribute("alertTitle", "Thank you!");
            
            req.getRequestDispatcher("./verifySuccessful.jsp").forward(req, resp);
        }else{
            req.setAttribute("alertTitle", "Sorry!");
            req.getRequestDispatcher("./verifyFail.jsp").forward(req, resp);
//            req.getRequestDispatcher("afterVerifyCode.jsp").forward(req, resp);
        }
    }
    
}