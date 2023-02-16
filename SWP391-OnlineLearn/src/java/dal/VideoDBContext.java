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
import model.Video;

/**
 *
 * @author Khangnekk
 */
public class VideoDBContext extends DBContext<Video> {

    @Override
    public void insert(Video model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Video model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Video model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Video get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Video> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Video getVideoByLessonID(int lesson_id) {
        Video v = new Video();
        String sql = "SELECT v.video_id,v.[url],v.video_title FROM Video v\n"
                + "JOIN Lession_Video lv ON lv.video_id = v.video_id\n"
                + "WHERE lv.lession_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lesson_id);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                v.setVideo_id(rs.getInt("video_id"));
                v.setUrl(rs.getString("url"));
                v.setVideo_title(rs.getString("video_title"));
                return v;
            }
        } catch (SQLException ex) {
            Logger.getLogger(VideoDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
