/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.admin.lession;

import controller.auth.BaseAuthorizationController;
import dal.LessonDBContext;
import dal.ModuleDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Account;
import model.Lesson;
import model.Module;

/**
 *
 * @author Acer
 */
public class actionLessionController extends BaseAuthorizationController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        String action = req.getParameter("action").trim();
        LessonDBContext lDB = new LessonDBContext();
        Module module = (Module) req.getSession().getAttribute("module");
        switch(action){
            case "add":
                String lesson_nameAdd = req.getParameter("lession");
                
                Lesson lessonModelAdd = new Lesson();
                lessonModelAdd.setLesson_name(lesson_nameAdd);
                
                lessonModelAdd.setModule(module);
                lessonModelAdd.setStatus(false);
                lDB.insert(lessonModelAdd);
                
                ArrayList<Lesson> lessons = lDB.listLessonByModuleID(module.getModule_id());
                int number_of_lessions = lessons.size();

                req.getSession().setAttribute("number_of_lessions", number_of_lessions);
                req.getSession().setAttribute("lessions", lessons);
                req.setAttribute("alert", "Đã thêm thành công");
                req.getRequestDispatcher("./addLession.jsp").forward(req, resp);
                break;
            case "edit":
                int lession_id = Integer.parseInt(req.getParameter("lession_id"));
                String lession_name = req.getParameter("lession").trim();
                
                Lesson lessionModelUpdate = new Lesson();
                lessionModelUpdate.setLesson_id(lession_id);
                lessionModelUpdate.setLesson_name(lession_name);
                lessionModelUpdate.setModule(module);
                lessionModelUpdate.setStatus(false);
                
                lDB.update(lessionModelUpdate);
                req.setAttribute("alert", "Đã sửa thành công");
                req.getRequestDispatcher("./addLession.jsp").forward(req, resp);
                break;
            case "default":
                req.getRequestDispatcher("./addLession.jsp").forward(req, resp);
                break;
        }
        
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        LessonDBContext lDB = new LessonDBContext();
        String action = req.getParameter("action");
        int lession_id = Integer.parseInt(req.getParameter("lession_id"));
        if(lession_id != -1){
            Lesson lession = lDB.get(lession_id);
            req.setAttribute("lession",lession);
        }
        req.setAttribute("action", action);
        req.getSession().setAttribute("add", "add");
        req.getSession().setAttribute("edit", "edit");
        req.getRequestDispatcher("./addLession.jsp").forward(req, resp);
    }
    
}
