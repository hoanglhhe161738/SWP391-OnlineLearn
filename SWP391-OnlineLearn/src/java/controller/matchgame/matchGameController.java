/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.matchgame;

import controller.auth.BaseAuthorizationController;
import dal.MatchGameDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Account;
import model.MatchGame;

/**
 *
 * @author Acer
 */
    public class matchGameController extends BaseAuthorizationController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        int lession_id = Integer.parseInt(req.getParameter("lession_id"));
        String lession_name = req.getParameter("lession_name");
        MatchGameDBContext mgDB = new MatchGameDBContext();
        
        ArrayList<MatchGame> mg = mgDB.getMatchGamePairsByLessionID(lession_id);
        req.setAttribute("mg", mg);
        req.setAttribute("lession_name", lession_name);
        req.getRequestDispatcher("./matchgame.jsp").forward(req, resp);
    }
    
}
