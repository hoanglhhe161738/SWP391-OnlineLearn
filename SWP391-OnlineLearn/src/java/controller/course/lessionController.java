/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.course;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Lession;

/**
 *
 * @author Khangnekk
 */
public class lessionController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // doPost
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // doGet
    }

    protected String getPercentLession(ArrayList<Lession> lessions) {
        String result;
        int learnStatusTrue = 0,
                learnStatusFalse = 0,
                numberOfLessions = lessions.size();
        double percent;
        for (Lession l : lessions) {
            if (l.isStatus()) {
                learnStatusTrue++;
            } else {
                learnStatusFalse++;
            }
        }
        percent = (learnStatusTrue * 100) / numberOfLessions;
        result = percent + "%";
        return result;
    }
}
