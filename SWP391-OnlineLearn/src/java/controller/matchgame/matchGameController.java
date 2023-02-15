/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.matchgame;

import dal.MatchGameDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.MatchGame;

/**
 *
 * @author Acer
 */
public class matchGameController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int lession_id = Integer.parseInt(req.getParameter("lession_id"));
        MatchGameDBContext mgDB = new MatchGameDBContext();
        
        ArrayList<MatchGame> mg = mgDB.getMatchGamePairsByLessionID(lession_id);
        req.setAttribute("mg", mg);
        req.getRequestDispatcher("./game/matchgame.jsp").forward(req, resp);
        
    }
    
}
