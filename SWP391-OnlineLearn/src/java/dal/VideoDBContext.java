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
        String sql = "INSERT INTO [dbo].[Video]\n"
                + "           ([url]\n"
                + "           ,[video_title])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getUrl());
            stm.setString(2, model.getVideo_title());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(VideoDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void insertLessonVideo(int lesson_id, int video_id) {
        String sql = "INSERT INTO [dbo].[Lession_Video]\n"
                + "           ([lession_id]\n"
                + "           ,[video_id])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lesson_id);
            stm.setInt(2, video_id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(VideoDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void update(Video model) {
        String sql = "UPDATE [dbo].[Video]\n"
                + "   SET [url] = ?\n"
                + "      ,[video_title] = ?\n"
                + " WHERE video_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getUrl());
            stm.setString(2, model.getVideo_title());
            stm.setInt(3, model.getVideo_id());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(VideoDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void delete(Video model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Video get(int id) {
        Video video = new Video();
        String sql = "SELECT * FROM Video WHERE video_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                video.setVideo_id(rs.getInt("video_id"));
                video.setVideo_title(rs.getString("video_title"));
                video.setUrl(rs.getString("url"));
                return video;
            }
        } catch (SQLException ex) {
            Logger.getLogger(VideoDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return video;
    }

    @Override
    public ArrayList<Video> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Video getVideoByUrl(String url) {
        Video v = new Video();
        String sql = "SELECT * FROM Video WHERE [url] = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, url);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                v.setVideo_id(rs.getInt("video_id"));
                v.setUrl(rs.getString("url"));
                v.setVideo_title(rs.getString("video_title"));
                return v;
            }
        } catch (SQLException ex) {
            Logger.getLogger(VideoDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return v;
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
            if (rs.next()) {
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
