/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.admin.content;

import controller.auth.BaseAuthorizationController;
import dal.ContentDBContext;
import dal.QuestionDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Account;
import model.Content;
import model.Lesson;
import model.Question;

/**
 *
 * @author Acer
 */
public class actionContentController extends BaseAuthorizationController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        String action = req.getParameter("action").trim();
        ContentDBContext conDB = new ContentDBContext();
        switch(action){
            case "add":
                
                String content_readingAdd = req.getParameter("content").trim();
                
                Content contentModelAdd = new Content();
                contentModelAdd.setReading_content(content_readingAdd);
                Lesson lesson = (Lesson) req.getSession().getAttribute("lesson");
                conDB.insert(contentModelAdd, lesson.getLesson_id());
                
                ArrayList<Content> contentList = conDB.getContentListByLessionID(lesson.getLesson_id());
                int number_of_contents = contentList.size();
                
                req.getSession().setAttribute("number_of_contents", number_of_contents);
                req.getSession().setAttribute("contents", contentList);
                req.setAttribute("alert", "Đã thêm thành công");
                req.getRequestDispatcher("./addContent.jsp").forward(req, resp);
                break;
            case "edit":
                int content_id = Integer.parseInt(req.getParameter("content_id"));
                String reading_content = req.getParameter("content").trim();
                
                Content contentModelUpdate = new Content();
                contentModelUpdate.setContent_id(content_id);
                contentModelUpdate.setReading_content(reading_content);
                
                conDB.update(contentModelUpdate);
                req.setAttribute("alert", "Đã sửa thành công");
                req.getRequestDispatcher("./addContent.jsp").forward(req, resp);
                break;
                
            case "delete":
                int content_idForDelete = Integer.parseInt(req.getParameter("content_id"));
                Lesson lessonForDelete = (Lesson) req.getSession().getAttribute("lesson");
                conDB.deleteLessonContent(content_idForDelete);
                conDB.delete(content_idForDelete);
                ArrayList<Content> contentListAfterDelete = conDB.getContentListByLessionID(lessonForDelete.getLesson_id());
                int number_of_contents_after_del = contentListAfterDelete.size();
                req.getSession().setAttribute("number_of_contents", number_of_contents_after_del);
                req.getSession().setAttribute("contents", contentListAfterDelete);
            
            default:
                req.getRequestDispatcher("./addContent.jsp").forward(req, resp);
                break;
        }
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        ContentDBContext conDB = new ContentDBContext();
        String action = req.getParameter("action");
        int content_id = Integer.parseInt(req.getParameter("content_id"));
        if (content_id!= -1) {
            Content content = conDB.get(content_id);
            req.setAttribute("content", content);
        }
        req.setAttribute("action", action);
        req.getSession().setAttribute("add", "add");
        req.getSession().setAttribute("edit", "edit");
        req.getSession().setAttribute("delete", "delete");
        req.getRequestDispatcher("./addContent.jsp").forward(req, resp);
    }
    
}