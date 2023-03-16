/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Ranking;

/**
 *
 * @author Khangnekk
 */
public class RankingDBContext extends DBContext<Ranking> {

    @Override
    public void insert(Ranking model) {
        String sql = "INSERT INTO [dbo].[Ranking]\n"
                + "           ([user_id]\n"
                + "           ,[full_name]\n"
                + "           ,[points])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,0)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, model.getUser_id());
            stm.setString(2, model.getFull_name());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RankingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void update(Ranking model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Ranking model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Ranking get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Ranking> list() {
        ArrayList<Ranking> rankings = new ArrayList<>();
        String sql = "SELECT ROW_NUMBER() OVER(ORDER BY r.points DESC) AS [rank], r.ranking_id,r.[user_id],r.full_name,r.points\n"
                + "FROM Ranking r";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Ranking r = new Ranking();
                r.setRank(rs.getInt("rank"));
                r.setRanking_id(rs.getInt("ranking_id"));
                r.setUser_id(rs.getInt("user_id"));
                r.setFull_name(rs.getString("full_name"));
                r.setPoints(rs.getInt("points"));
                rankings.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RankingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rankings;
    }

    public ArrayList<Ranking> getRankingByName(String keyName) {
        ArrayList<Ranking> rankingsByKey = new ArrayList<>();
        ArrayList<Ranking> rankings = list();
        for (Ranking r : rankings) {
            if (r.getFull_name().contains(keyName)) {
                rankingsByKey.add(r);
            }
        }
        return rankingsByKey;
    }

}
