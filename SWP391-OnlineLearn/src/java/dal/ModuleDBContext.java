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
import model.Module;

/**
 *
 * @author Khangnekk
 */
public class ModuleDBContext extends DBContext<Module> {

    @Override
    public void insert(Module model) {
        String sql = "INSERT INTO [dbo].[Module]\n"
                + "           ([module_name]\n"
                + "           ,[course_id]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getModule_name());
            stm.setInt(2, model.getCourse().getCourse_id());
            stm.setBoolean(3, model.isStatus());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ModuleDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void update(Module model) {
        String sql = "UPDATE [dbo].[Module]\n"
                + "   SET [module_name] = ?\n"
                + "      ,[course_id] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE module_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getModule_name());
            stm.setInt(2, model.getCourse().getCourse_id());
            stm.setBoolean(3, model.isStatus());
            stm.setInt(4, model.getModule_id());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ModuleDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    @Override
    public void delete(Module model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Module get(int module_id) {
        Module module = new Module();
        CourseDBContext cDB = new CourseDBContext();
        ArrayList<Course> courses = cDB.list();
        String sql = "SELECT * FROM Module WHERE module_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, module_id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                int course_id = rs.getInt("course_id");
                module.setModule_id(rs.getInt("module_id"));
                module.setModule_name(rs.getString("module_name"));
                module.setCourse(courses.stream().filter(co -> co.getCourse_id() == course_id).findAny().get());
            }
        } catch (SQLException ex) {
            Logger.getLogger(ModuleDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return module;
    }

    @Override
    public ArrayList<Module> list() {
        ArrayList<Module> modules = new ArrayList<>();
        CourseDBContext cDB = new CourseDBContext();
        ArrayList<Course> courses = cDB.list();

        String sql = "SELECT * FROM Module";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Module m = new Module();
                int course_id = rs.getInt("course_id");
                m.setModule_id(rs.getInt("module_id"));
                m.setModule_name(rs.getString("module_name"));
                m.setCourse(courses.stream().filter(co -> co.getCourse_id() == course_id).findAny().get());
                modules.add(m);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ModuleDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return modules;
    }

    public ArrayList<Module> listModuleByCourseID(int course_id) {
        ArrayList<Module> modules = new ArrayList<>();
        CourseDBContext cDB = new CourseDBContext();
        ArrayList<Course> courses = cDB.list();

        String sql = "SELECT * FROM Module WHERE course_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, course_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Module m = new Module();
                m.setModule_id(rs.getInt("module_id"));
                m.setModule_name(rs.getString("module_name"));
                m.setStatus(rs.getBoolean("status"));
                m.setCourse(courses.stream().filter(co -> co.getCourse_id() == course_id).findAny().get());
                modules.add(m);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ModuleDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return modules;
    }

    public int numberOfLessonLearned(int module_id, int user_id) {
        int lessonLearned = 0;
        String sql = "SELECT COUNT(*)  AS numberOfLessonLearned FROM Lession_Learn ll \n"
                + "JOIN Lession l ON ll.lession_id = l.lession_id\n"
                + "WHERE l.module_id = ? AND ll.llearn = 'true' AND ll.[user_id] = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, module_id);
            stm.setInt(2, user_id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                lessonLearned = rs.getInt("numberOfLessonLearned");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ModuleDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lessonLearned;
    }
    
    public int numberOfLesson(int module_id, int user_id) {
        int sizeOfModule = 0;
        String sql = "SELECT COUNT(*)  AS numberOfLessonLearned FROM Lession_Learn ll \n"
                + "JOIN Lession l ON ll.lession_id = l.lession_id\n"
                + "WHERE l.module_id = ? AND ll.[user_id] = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, module_id);
            stm.setInt(2, user_id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                sizeOfModule = rs.getInt("numberOfLessonLearned");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ModuleDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sizeOfModule;
    }

}
