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
import model.Content;

/**
 *
 * @author Khangnekk
 */
public class ContentDBContext extends DBContext<Content> {

    @Override
    public void insert(Content model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public void delete(int content_id){
       
          String sql = "DELETE FROM [dbo].[Content]\n"
                    + "      WHERE content_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, content_id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ContentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void deleteLessonContent(int content_id){
        String sql = "DELETE FROM [dbo].[Lession_Content]\n"
                + "      WHERE content_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, content_id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ContentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    @Override
    public void update(Content model) {
        String sql = "UPDATE [dbo].[Content]\n"
                + "   SET [reading_content] = ?\n"
                + " WHERE content_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getReading_content());
            stm.setInt(2, model.getContent_id());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ContentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    @Override
    public void delete(Content model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public void insert(Content model, int lession_id){
        String sql = "INSERT INTO [dbo].[Content]\n"
                + "           ([reading_content])\n"
                + "     VALUES\n"
                + "           (?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getReading_content());
            stm.executeUpdate();
            int content_id = getContentID(model);
            if(content_id != -1){
                insertLessionContent(content_id, lession_id);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ContentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public Content get(int id) {
        Content content = new Content();
        String sql = "SELECT * FROM Content WHERE content_id = ?";
        try{
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                content.setContent_id(rs.getInt("content_id"));
                content.setReading_content(rs.getString("reading_content"));
                
                return  content;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ContentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return content;
    }
    
    public int getContentID(Content model){
        int content_id = -1;
        String sql = "SELECT content_id FROM Content WHERE reading_content = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getReading_content());
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                 content_id = rs.getInt("content_id");
                return content_id;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ContentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return content_id;
    }

    @Override
    public ArrayList<Content> list() {
        ArrayList<Content> contents = new ArrayList<>();
        String sql = "SELECT * FROM Content";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Content content = new Content();
                content.setContent_id(rs.getInt("content_id"));
                content.setReading_content(rs.getString("reading_content"));
                contents.add(content);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ContentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return contents;
    }
    
    public ArrayList<Content> getContentListByLessionID(int lesson_id){
        ArrayList<Content> contentList = new ArrayList<>();
        String sql = "SELECT c.content_id, c.reading_content\n"
                + "                FROM Content c\n"
                + "                inner join Lession_Content lc on lc.content_id = c.content_id\n"
                + "               inner join Lession l on l.lession_id = lc.lession_id\n"
                + "               WHERE l.lession_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lesson_id);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Content content = new Content();
                content.setContent_id(rs.getInt("content_id"));
                content.setReading_content(rs.getString("reading_content"));
                
                contentList.add(content);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ContentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return contentList;
    }

    public Content getContentByLessonId(int lesson_id) {
        Content content = new Content();
        String sql = "SELECT  c.content_id,c.reading_content\n"
                + "FROM Content c, Lession_Content lc \n"
                + "WHERE lc.lession_id = ? AND c.content_id = lc.content_id";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lesson_id);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                content.setContent_id(rs.getInt("content_id"));
                content.setReading_content(rs.getString("reading_content"));
                return content;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ContentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return content;
    }

    private void insertLessionContent(int content_id, int lession_id) {
        String sql = "INSERT INTO [dbo].[Lession_Content]\n"
                + "           ([lession_id]\n"
                + "           ,[content_id])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lession_id);
            stm.setInt(2, content_id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ContentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

}