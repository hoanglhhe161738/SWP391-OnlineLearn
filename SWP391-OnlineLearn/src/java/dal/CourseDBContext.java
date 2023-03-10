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

}
