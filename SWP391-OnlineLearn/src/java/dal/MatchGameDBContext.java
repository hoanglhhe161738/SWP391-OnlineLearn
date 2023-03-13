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
            String sql = "SELECT m.match_game_id, m.img_id, m.ans_img_id, m.[index], \n"
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
                matchgame.setIndex(rs.getInt("index"));
                
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
    
    public void updateIndexMatchGame(int lession_id){
        String sql = "SELECT mg.[index], mg.img_id, mg.ans_img_id, mg.match_game_id, mg.points\n"
                + "FROM MatchGame mg \n"
                + "inner join Lession_MatchGame lm on lm.match_game_id = mg.match_game_id\n"
                + "inner join Lession l on l.lession_id = lm.lession_id\n"
                + "WHERE l.lession_id = ?";
         try {
            PreparedStatement stmSelect = connection.prepareStatement(sql);
            stmSelect.setInt(1, lession_id);
            ResultSet rs = stmSelect.executeQuery();
            int newIndex = 1;
            while (rs.next()) {
                int currentIndex = rs.getInt("index");
                if (newIndex != currentIndex) {
                    String sqlUpdate = "UPDATE [dbo].[MatchGame]\n"
                            + "   SET [index] = ?\n"
                            + " WHERE [index] = ?";
                    PreparedStatement stmUpdate = connection.prepareStatement(sqlUpdate);
                    stmUpdate.setInt(1, newIndex);
                    stmUpdate.setInt(2, currentIndex);
                    stmUpdate.executeUpdate();
                }
                newIndex++;
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void insertMatchGame(MatchGame model, int lession_id, Img imodel, AnsImg amodel){
        String sql = "INSERT INTO [dbo].[MatchGame]\n"
                + "           ([img_id]\n"
                + "           ,[ans_img_id]\n"
                + "           ,[points]\n"
                + "           ,[index])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, getImgID(imodel));
            stm.setInt(2, getAnsImgID(amodel));
            stm.setInt(3, model.getPoints());
            stm.setInt(4, model.getIndex());
            stm.executeUpdate();
            int match_game_id = getIdByMatchGame(model, imodel, amodel);
            if (match_game_id != -1) {
                insertLessonMatchGame(match_game_id, lession_id);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MatchGameDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
       
    }
    
    public int getImgID(Img model){
        int img_id = -1;
        String sql = "SELECT i.img_id FROM Img i\n"
                + "		WHERE i.img_name = ?\n"
                + "		AND i.img_url = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getImg_name());
            stm.setString(2, model.getImg_url());
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                img_id = rs.getInt("img_id");
                return img_id;
            }
        } catch (SQLException ex) {
            Logger.getLogger(MatchGameDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return img_id;
    }
    
    public int getAnsImgID(AnsImg model){
        int ans_img_id = -1;
        String sql = "SELECT a.ans_img_id FROM AnsImg a\n"
                + "		WHERE a.ans_img_name = ?\n"
                + "		AND a.ans_img_url = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getAns_img_name());
            stm.setString(2, model.getAns_img_url());
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                ans_img_id = rs.getInt("ans_img_id");
                return ans_img_id;
            }
        } catch (SQLException ex) {
            Logger.getLogger(MatchGameDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ans_img_id;
    }
    
    public int getIdByMatchGame(MatchGame model, Img imodel, AnsImg amodel){
        int match_game_id = -1;
        String sql = "SELECT mg.match_game_id\n"
                + "FROM MatchGame mg \n"
                + "WHERE mg.[index] = ?\n"
                + "AND mg.img_id = ?\n"
                + "AND mg.ans_img_id = ?\n"
                + "AND mg.points = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, model.getIndex());
            stm.setInt(2, getImgID(imodel));
            stm.setInt(3, getAnsImgID(amodel));
            stm.setInt(4, model.getPoints());
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                match_game_id = rs.getInt("match_game_id");
                return match_game_id;
            }
        } catch (SQLException ex) {
            Logger.getLogger(MatchGameDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
       return match_game_id;
    }
    
    public void insertLessonMatchGame(int match_game_id, int lesson_id) {
        String sql = "INSERT INTO [dbo].[Lession_MatchGame]\n"
                + "           ([lession_id]\n"
                + "           ,[match_game_id])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lesson_id);
            stm.setInt(2, match_game_id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void insertImg(Img model){
        String sql = "INSERT INTO [dbo].[Img]\n"
                + "           ([img_name]\n"
                + "           ,[img_url])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getImg_name());
            stm.setString(2, model.getImg_url());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(MatchGameDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void insertAnsImg(AnsImg model){
        String sql = "INSERT INTO [dbo].[AnsImg]\n"
                + "           ([ans_img_name]\n"
                + "           ,[ans_img_url])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getAns_img_name());
            stm.setString(2, model.getAns_img_url());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(MatchGameDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void insert(MatchGame model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(MatchGame model) {
        String sql = "UPDATE [dbo].[MatchGame]\n"
                + "   SET [img_id] = ?\n"
                + "      ,[ans_img_id] = ?\n"
                + "      ,[points] = ?\n"
                + "      ,[index] = ?\n"
                + " WHERE match_game_id = ?";
        
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm = connection.prepareStatement(sql);
            stm.setInt(1, model.getImg().getImg_id());
            stm.setInt(2, model.getAns_img().getAns_img_id());
            stm.setInt(3, model.getPoints());
            stm.setInt(4, model.getIndex());
            stm.setInt(5, model.getMatch_game_id());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(MatchGameDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateImg(Img model, int img_id){
        String sql = "UPDATE [dbo].[Img]\n"
                + "   SET [img_name] = ?\n"
                + "      ,[img_url] = ?\n"
                + " WHERE img_id = ? ";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getImg_name());
            stm.setString(2, model.getImg_url());
            stm.setInt(3, img_id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(MatchGameDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateAnsImg(AnsImg model, int ans_img_id){
        String sql = "UPDATE [dbo].[AnsImg]\n"
                + "   SET [ans_img_name] = ?\n"
                + "      ,[ans_img_url] = ?\n"
                + " WHERE ans_img_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getAns_img_name());
            stm.setString(2, model.getAns_img_url());
            stm.setInt(3, ans_img_id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(MatchGameDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public void deleteLessonMatchGame(int match_game_id){
        String sql = "DELETE FROM [dbo].[Lession_MatchGame]\n"
                + "      WHERE match_game_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, match_game_id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(MatchGameDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public void deleteMatchGame(int match_game_id){
        String sql = "DELETE FROM [dbo].[MatchGame]\n"
                + "      WHERE match_game_id =?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, match_game_id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(MatchGameDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    

    @Override
    public void delete(MatchGame model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    public Img getImgByMatchGameID(int id){
        Img img = new Img();
        String sql = "SELECT i.img_id, i.img_name, i.img_url\n"
                + "FROM	Img i \n"
                + "inner join MatchGame mg on mg.img_id = i.img_id\n"
                + "WHERE mg.match_game_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                img.setImg_id(rs.getInt("img_id"));
                img.setImg_name(rs.getString("img_name"));
                img.setImg_url(rs.getString("img_url"));
                
                return img;
            }
        } catch (SQLException ex) {
            Logger.getLogger(MatchGameDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return img;
    }
    
    public AnsImg getAnsImgByMatchGameID(int id){
        AnsImg ans_img = new AnsImg();
        String sql = "SELECT a.ans_img_id, a.ans_img_name, a.ans_img_url\n"
                + "FROM	AnsImg a \n"
                + "inner join MatchGame mg on mg.ans_img_id = a.ans_img_id\n"
                + "WHERE mg.match_game_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                ans_img.setAns_img_id(rs.getInt("ans_img_id"));
                ans_img.setAns_img_name(rs.getString("ans_img_name"));
                ans_img.setAns_img_url(rs.getString("ans_img_url"));
                
                return ans_img;
            }
        } catch (SQLException ex) {
            Logger.getLogger(MatchGameDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ans_img;
    }
    
    

    @Override
    public MatchGame get(int match_game_id) {
        MatchGame matchgame = new MatchGame();
        String sql = "SELECT "
                + "		i.img_name, i.img_url,\n"
                + "		a.ans_img_name, a.ans_img_url\n"
                + "FROM MatchGame mg  \n"
                + "inner join Img i on i.img_id = mg.img_id\n"
                + "inner join AnsImg a on a.ans_img_id = mg.ans_img_id\n"
                + "WHERE mg.match_game_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, match_game_id);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                
                Img img = new Img();
                AnsImg ans_img = new AnsImg();
                
                matchgame.setMatch_game_id(rs.getInt("match_game_id"));
                
                img.setImg_id(rs.getInt("img_id"));
                img.setImg_name(rs.getString("img_name"));
                img.setImg_url(rs.getString("img_url"));
                
                ans_img.setAns_img_id(rs.getInt("ans_img_id"));
                ans_img.setAns_img_name(rs.getString("ans_img_name"));
                ans_img.setAns_img_url(rs.getString("ans_img_url"));
                
                matchgame.setImg(img);
                matchgame.setAns_img(ans_img);
                
                return matchgame;
            }
        } catch (SQLException ex) {
            Logger.getLogger(MatchGameDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return matchgame;
    }
    
   

    @Override
    public ArrayList<MatchGame> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
