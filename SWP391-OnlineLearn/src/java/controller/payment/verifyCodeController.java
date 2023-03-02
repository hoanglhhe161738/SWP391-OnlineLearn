/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.payment;

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
public class verifyCodeController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }
    
    void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AccountDBContext aDB = new AccountDBContext();
        
        String verifyCode = req.getParameter("verifyCode");
        
        HttpSession verifyPremium = req.getSession();
        String Code = String.valueOf(verifyPremium.getAttribute("verifyCode"));            
        if(verifyCode.equals(Code)){
            Account acc = (Account)req.getSession().getAttribute("account");
            aDB.updateClassifyAccount(acc);
            Account oldInfo = (Account) req.getSession().getAttribute("account");
            Account newInfo = aDB.get(oldInfo.getUsername());
            req.getSession().setAttribute("account", newInfo);
            req.getRequestDispatcher("./PaymentSuccesful.html").forward(req, resp);
        }else{
            req.getRequestDispatcher("./paymentfail.html").forward(req, resp);
        }
    }
    
}
