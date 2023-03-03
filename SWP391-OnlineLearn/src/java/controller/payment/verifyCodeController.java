/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.payment;

import controller.auth.BaseAuthenticationController;
import dal.AccountDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.Account;

/**
 *
 * @author Khangnekk
 */
public class verifyCodeController extends BaseAuthenticationController{
    
    void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String verifyCode = req.getParameter("verifyCode");
        AccountDBContext aDB = new AccountDBContext();
        HttpSession verifyPremium = req.getSession();
        String Code = String.valueOf(verifyPremium.getAttribute("verifyCode"));
        
        req.setAttribute("tk", "Thank you!");
        
        if(verifyCode.equals(Code)){
            Account acc = (Account)req.getSession().getAttribute("account");
            aDB.updateClassifyAccount(acc);
            Account oldInfo = (Account) req.getSession().getAttribute("account");
            Account newInfo = aDB.get(oldInfo.getUsername());
            req.getSession().setAttribute("account", newInfo);
            req.getRequestDispatcher("./PaymentSuccesful.html").forward(req, resp);
        }else{
            req.setAttribute("alertTitle", "Sorry!");
            req.getRequestDispatcher("afterVerifyCode.jsp").forward(req, resp);
        }
    }

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }
    
}
