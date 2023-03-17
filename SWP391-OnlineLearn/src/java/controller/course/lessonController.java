/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.course;

import controller.auth.BaseAuthenticationController;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Lesson;

/**
 *
 * @author Khangnekk
 */
public class lessonController extends BaseAuthenticationController {


    protected void doPostProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // doPost
    }


    protected void doGetProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // test backend processing (retrieving percentage of lessons learned)
        // using sample data
        // (status: OK)
        
    }

//    protected double getPercentLesson(ArrayList<Lesson> lessons) {
//        double percent;
//        double learnStatusTrue = 0,
//                learnStatusFalse = 0,
//                numberOfLessons = lessons.size();
//        
//        for (Lesson l : lessons) {
//            if (l.isStatus()) {
//                learnStatusTrue++;
//            } else {
//                learnStatusFalse++;
//            }
//        }
//        percent = (learnStatusTrue * 100) / numberOfLessons;
//        return Math.round(percent * 100.0) / 100.0;
//    }

    // sample data (using for test)
    public ArrayList<Lesson> createSampleDataForLesson() {
        ArrayList<Lesson> lessons = new ArrayList<>();
        lessons.add(new Lesson("Lesson01: data sample", true));
        lessons.add(new Lesson("Lesson02: data sample", true));
        lessons.add(new Lesson("Lesson03: data sample", true));
        lessons.add(new Lesson("Lesson04: data sample", false));
        lessons.add(new Lesson("Lesson05: data sample", true));
        lessons.add(new Lesson("Lesson06: data sample", false));
        return  lessons;
    }

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGetProcess(req, resp);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        double percent = getPercentLesson(createSampleDataForLesson());
//        resp.getWriter().print("Percentage of lessons learned: "+percent+"%");
    }
}
