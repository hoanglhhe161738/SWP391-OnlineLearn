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
import model.Class;

/**
 *
 * @author Khangnekk
 */
public class CourseDBContext extends DBContext<Course> {

    @Override
    public void insert(Course model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Course model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Course model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Course get(int course_id) {
        Course course = new Course();
        ClassDBContext clDB = new ClassDBContext();
        ArrayList<Class> classses = clDB.list();
        String sql = "SELECT * FROM Course WHERE course_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, course_id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                course.setCourse_id(rs.getInt("course_id"));
                course.setCourse_name(rs.getString("course_name"));
                int class_id = rs.getInt("class_id");
                course.setClasses(classses.stream().filter(cl -> cl.getClass_id() == class_id).findAny().get());
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return course;
    }

    @Override
    public ArrayList<Course> list() {
        ArrayList<Course> courses = new ArrayList<>();
        ClassDBContext clDB = new ClassDBContext();
        ArrayList<Class> classses = clDB.list();
        String sql = "SELECT * FROM Course";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                course.setCourse_id(rs.getInt("course_id"));
                course.setCourse_name(rs.getString("course_name"));
                int class_id = rs.getInt("class_id");
                course.setClasses(classses.stream().filter(cl -> cl.getClass_id() == class_id).findAny().get());
                courses.add(course);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return courses;
    }

    public ArrayList<Course> listCoursebyClassId(int class_id) {
        ArrayList<Course> courses = new ArrayList<>();
        ClassDBContext clDB = new ClassDBContext();
        ArrayList<Class> classses = clDB.list();
        String sql = "SELECT * FROM Course WHERE class_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, class_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                course.setCourse_id(rs.getInt("course_id"));
                course.setCourse_name(rs.getString("course_name"));
                course.setClasses(classses.stream().filter(cl -> cl.getClass_id() == class_id).findAny().get());
                courses.add(course);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return courses;
    }

    public int numberOfLessonLearned(int course_id, int user_id) {
        int lessonLearned = 0;
        String sql = "SELECT COUNT(*) AS numberOfLessonLearned\n"
                + "FROM Lession l\n"
                + "JOIN Module m ON m.module_id = l.module_id\n"
                + "JOIN Course c ON c.course_id = m.course_id\n"
                + "JOIN Class cl ON cl.class_id = c.class_id\n"
                + "JOIN Lession_Learn ll ON ll.lession_id = l.lession_id\n"
                + "WHERE c.course_id = ? AND ll.llearn = 'true' AND ll.[user_id] =?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, course_id);
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

    public int numberOfLesson(int course_id, int user_id) {
        int sizeOfCourse = 0;
        String sql = "SELECT COUNT(*) AS numberOfLessonLearned\n"
                + "FROM Lession l\n"
                + "JOIN Module m ON m.module_id = l.module_id\n"
                + "JOIN Course c ON c.course_id = m.course_id\n"
                + "JOIN Class cl ON cl.class_id = c.class_id\n"
                + "JOIN Lession_Learn ll ON ll.lession_id = l.lession_id\n"
                + "WHERE c.course_id = ? AND ll.[user_id] =?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, course_id);
            stm.setInt(2, user_id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                sizeOfCourse = rs.getInt("numberOfLessonLearned");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ModuleDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sizeOfCourse;
    }

    public ArrayList<Course> registeredCourse(int user_id) {
        ArrayList<Course> registeredCourses = new ArrayList<>();
        String sql = "SELECT DISTINCT c.course_id, c.course_name,c.class_id, cl.class_name FROM Course c\n"
                + "JOIN Class cl ON cl.class_id = c.class_id\n"
                + "JOIN Module m ON m.course_id = c.course_id\n"
                + "JOIN Lession l ON l.module_id = m.module_id\n"
                + "JOIN Lession_Learn ll ON l.lession_id = ll.lession_id\n"
                + "WHERE ll.[user_id] = ?";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, user_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Course c = new Course();
                c.setCourse_id(rs.getInt("course_id"));
                c.setCourse_name(rs.getString("course_name"));
                c.setClasses( new Class(rs.getInt("class_id"), rs.getString("class_name")));
                registeredCourses.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return registeredCourses;
    }
}
