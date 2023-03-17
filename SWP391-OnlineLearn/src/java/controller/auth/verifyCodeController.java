/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.auth;

import controller.payment.*;
import dal.AccountDBContext;
import dal.RankingDBContext;
import dal.UserDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.Account;
import model.Ranking;
import model.User;

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
        String verifyCode = req.getParameter("confirm").trim();
        
        HttpSession verifyPremium = req.getSession();
        String Code = String.valueOf(verifyPremium.getAttribute("verifyCode"));
        
        req.setAttribute("tk", "Thank you!");
        
        if(verifyCode.equals(Code)){
            req.setAttribute("alertTitle", "Thank you!");
            AccountDBContext accdb = new AccountDBContext();
            Account acc = (Account) req.getSession().getAttribute("newAccount");
            accdb.signup(acc.getUsername(), acc.getPassword());
            accdb.insertRoll(2, acc.getUsername());
            UserDBContext udb = new UserDBContext();
            User u = (User) req.getSession().getAttribute("newUser");
            udb.insert(u);
            // Initialize ranking for account
            User getUserJustAdd = udb.getUserByUsername(u.getUsername());
            RankingDBContext rDB = new RankingDBContext();
            Ranking ranking = new Ranking();
            ranking.setUser_id(getUserJustAdd.getUser_id());
            ranking.setFull_name(getUserJustAdd.getFull_name());
            rDB.insert(ranking);
            req.getRequestDispatcher("./verifySuccessful.jsp").forward(req, resp);
        }else{
            req.setAttribute("alertTitle", "Sorry!");
            req.getRequestDispatcher("./verifyFail.jsp").forward(req, resp);
//            req.getRequestDispatcher("afterVerifyCode.jsp").forward(req, resp);
        }
    }
    
}
