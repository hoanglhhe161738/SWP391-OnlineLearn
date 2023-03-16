/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.ranking;
import controller.auth.BaseAuthenticationController;
import dal.RankingDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Ranking;
/**
 *
 * @author Khangnekk
 */
public class rankingController extends BaseAuthenticationController{

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyName = req.getParameter("keyName");
        
        RankingDBContext rDB = new RankingDBContext();
        ArrayList<Ranking> rankingsByKeyName = rDB.getRankingByName(keyName);
        req.setAttribute("rankingsByKeyName", rankingsByKeyName);
        req.getRequestDispatcher("./ranking.jsp").forward(req, resp);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RankingDBContext rDB = new RankingDBContext();
        ArrayList<Ranking> rankings = rDB.list();
        req.setAttribute("rankings", rankings);
        req.getRequestDispatcher("./ranking.jsp").forward(req, resp);
    }
    
}
