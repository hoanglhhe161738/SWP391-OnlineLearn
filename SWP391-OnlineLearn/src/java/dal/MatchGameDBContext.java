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
import model.AnsImg;
import model.Img;
import model.MatchGame;

/**
 *
 * @author Acer
 */
public class MatchGameDBContext extends DBContext<MatchGame>  {
    
    public ArrayList<MatchGame> getMatchGamePairsByLessionID(int lession_id){
         ArrayList<MatchGame> matchgames = new ArrayList();
        try {
            String sql = "SELECT m.match_game_id, m.img_id, m.ans_img_id, \n"
                    + "     i.img_name, i.img_url, \n"
                    + "     a.ans_img_name, a.ans_img_url\n"
                    + "     FROM MatchGame m\n"
                    + "     inner join Img i on i.img_id = m.img_id\n"
                    + "     inner join AnsImg a on a.ans_img_id = m.ans_img_id\n"
                    + "     inner join Lession_MatchGame lm on lm.match_game_id = m.match_game_id\n"
                    + "     inner join Lession l on l.lession_id = lm.lession_id\n"
                    + "     WHERE l.lession_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lession_id);
            
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                MatchGame matchgame = new MatchGame();
                Img img = new Img();
                AnsImg ans_img = new AnsImg();
                
                matchgame.setMatch_game_id(rs.getInt("match_game_id"));
                
                img.setImg_id(rs.getInt("img_id"));
                img.setImg_url(rs.getString("img_url"));
                img.setImg_name(rs.getString("img_name"));
                matchgame.setImg(img);
                
                ans_img.setAns_img_id(rs.getInt("ans_img_id"));
                ans_img.setAns_img_url(rs.getString("ans_img_url"));
                ans_img.setAns_img_name(rs.getString("ans_img_name"));
                matchgame.setAns_img(ans_img);
                
                matchgames.add(matchgame);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(MatchGameDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return matchgames;
    }

    @Override
    public void insert(MatchGame model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(MatchGame model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(MatchGame model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public MatchGame get(int lession_id) {
       throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<MatchGame> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
