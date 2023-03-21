/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.admin;

import controller.auth.BaseAuthorizationController;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Account;

/**
 *
 * @author Khangnekk
 */
public class ActionController extends BaseAuthorizationController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        resetSession(req,resp,account);
        resp.sendRedirect("./action.jsp");
    }

    protected void resetSession(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        // Session for crud content
        req.getSession().setAttribute("class_id", null);
        req.getSession().setAttribute("coursesToAddQuiz", null);
        req.getSession().setAttribute("classesToAddQuiz", null);
        req.getSession().setAttribute("module", null);
        req.getSession().setAttribute("lessonsToAddQuiz", null);
        req.getSession().setAttribute("modulesToAddQuiz", null);
        req.getSession().setAttribute("course", null);
        // Session for crud lesson
        req.getSession().setAttribute("class_id", null);
        req.getSession().setAttribute("coursesToAddLession", null);
        req.getSession().setAttribute("classesToAddLession", null);
        req.getSession().setAttribute("course", null);
        req.getSession().setAttribute("modulesToAddLession", null);
        req.getSession().setAttribute("module", null);
        req.getSession().setAttribute("lessions", null);
        // Session for crud match game
        req.getSession().setAttribute("image_pairs", null);
        req.getSession().setAttribute("numberofpairs", null);
        req.getSession().setAttribute("lesson", null);
        req.getSession().setAttribute("modulesToAddGame", null);
        req.getSession().setAttribute("course_game", null);
        req.getSession().setAttribute("module_game", null);
        req.getSession().setAttribute("lessonsToAddGame", null);
        // Session for crud module
        req.getSession().setAttribute("classesToAddModule", null);
        req.getSession().setAttribute("class_id", null);
        req.getSession().setAttribute("coursesToAddModule", null);
        req.getSession().setAttribute("modules", null);
        req.getSession().setAttribute("course", null);
        // Session for crud video
        
    }
}
