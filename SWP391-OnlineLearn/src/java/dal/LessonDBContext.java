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
import model.Lesson_learn;
import model.Module;

/**
 *
 * @author Khangnekk
 */
public class LessonDBContext extends DBContext<Lesson> {

    @Override
    public void insert(Lesson model) {
        String sql = "INSERT INTO [dbo].[Lession]\n"
                + "           ([lession_name]\n"
                + "           ,[module_id]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getLesson_name());
            stm.setInt(2, model.getModule().getModule_id());
            stm.setBoolean(3, model.isStatus());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(LessonDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void update(Lesson model) {
        String sql = "UPDATE [dbo].[Lession]\n"
                + "   SET [lession_name] = ?\n"
                + "      ,[module_id] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE lession_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getLesson_name());
            stm.setInt(2, model.getModule().getModule_id());
            stm.setBoolean(3, model.isStatus());
            stm.setInt(4, model.getLesson_id());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(LessonDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
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

    public Lesson_learn getLessonLearn(int user_id, int lesson_id) {
        Lesson_learn lessonLearn = new Lesson_learn();
        String sql = "SELECT ll.[user_id], ll.lession_id,ll.llearn  \n"
                + "FROM Lession_Learn ll WHERE ll.[user_id] = ? AND ll.lession_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, user_id);
            stm.setInt(2, lesson_id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                lessonLearn.setUser_id(user_id);
                lessonLearn.setLesson_id(lesson_id);
                lessonLearn.setLlearn(rs.getBoolean("llearn"));
                return lessonLearn;
            }
        } catch (SQLException ex) {
            Logger.getLogger(LessonDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lessonLearn;
    }

    public Lesson_learn setLessonLearn(int user_id, int lesson_id, boolean llearn) {
        Lesson_learn lessonLearn = new Lesson_learn();
        String sql = "INSERT INTO [dbo].[Lession_Learn]\n"
                + "           ([user_id]\n"
                + "           ,[lession_id]\n"
                + "           ,[llearn])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, user_id);
            stm.setInt(2, lesson_id);
            stm.setBoolean(3, llearn);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(LessonDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lessonLearn;
    }

}
