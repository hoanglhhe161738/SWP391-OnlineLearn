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
import model.Course;
import model.Lesson;
import model.Module;

/**
 *
 * @author Khangnekk
 */
public class LessonDBContext extends DBContext<Lesson> {

    @Override
    public void insert(Lesson model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Lesson model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Lesson model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Lesson get(int lesson_id) {
        Lesson lesson = new Lesson();
        ModuleDBContext mDB = new ModuleDBContext();
        ArrayList<Module> modules = mDB.list();
        String sql = "SELECT * FROM Lession WHERE lession_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lesson_id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                lesson.setLesson_id(rs.getInt("lession_id"));
                lesson.setLesson_name(rs.getString("lession_name"));
                lesson.setStatus(rs.getBoolean("status"));
                int module_id = rs.getInt("module_id");
                lesson.setModule(modules.stream().filter(m -> m.getModule_id() == module_id).findAny().get());
            }
        } catch (SQLException ex) {
            Logger.getLogger(ModuleDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lesson;
    }

    @Override
    public ArrayList<Lesson> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<Lesson> listLessonByModuleID(int module_id) {
        ArrayList<Lesson> lessons = new ArrayList<>();
        ModuleDBContext mDB = new ModuleDBContext();
        ArrayList<Module> modules = mDB.list();
        String sql = "SELECT * FROM Lession WHERE module_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, module_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Lesson lesson = new Lesson();
                lesson.setLesson_id(rs.getInt("lession_id"));
                lesson.setLesson_name(rs.getString("lession_name"));
                lesson.setStatus(rs.getBoolean("status"));
                lesson.setModule(modules.stream().filter(m -> m.getModule_id() == module_id).findAny().get());
                lessons.add(lesson);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LessonDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return lessons;
    }

}
