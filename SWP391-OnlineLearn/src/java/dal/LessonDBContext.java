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
import model.Class;

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

    public ArrayList<Lesson> listLessonByCourseID(int course_id) {
        ArrayList<Lesson> lessons = new ArrayList<>();
        String sql = "SELECT l.lession_id,l.lession_name,l.module_id,l.[status],\n"
                + "m.module_id,m.module_name,m.course_id,m.[status],\n"
                + "c.class_id,c.course_id,c.course_name,\n"
                + "cl.class_id,cl.class_name\n"
                + "FROM Lession l\n"
                + "JOIN Module m ON m.module_id = l.module_id\n"
                + "JOIN Course c ON c.course_id = m.course_id\n"
                + "JOIN Class cl ON cl.class_id = c.class_id\n"
                + "WHERE c.course_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, course_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Lesson lesson = new Lesson();
                lesson.setLesson_id(rs.getInt("lession_id"));
                lesson.setLesson_name(rs.getString("lession_name"));
                lesson.setStatus(rs.getBoolean("status"));

                Module m = new Module();
                m.setModule_id(rs.getInt("module_id"));
                m.setModule_name(rs.getString("module_name"));

                Course c = new Course();

                Class cl = new Class();
                cl.setClass_id(rs.getInt("class_id"));
                cl.setClass_name(rs.getString("class_name"));

                c.setClasses(cl);
                c.setCourse_id(rs.getInt("course_id"));
                c.setCourse_name(rs.getString("course_name"));

                m.setCourse(c);
                lesson.setModule(m);
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
        return null;
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

    public void updateLessonLearn(int user_id, int lesson_id, boolean llearn) {
        String sql = "UPDATE [dbo].[Lession_Learn]\n"
                + "   SET [llearn] = ?\n"
                + " WHERE [lession_id] = ? AND [user_id] = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setBoolean(1, llearn);
            stm.setInt(2, lesson_id);
            stm.setInt(3, user_id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(LessonDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
