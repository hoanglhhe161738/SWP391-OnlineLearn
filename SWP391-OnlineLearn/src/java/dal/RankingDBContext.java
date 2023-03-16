/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
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
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
