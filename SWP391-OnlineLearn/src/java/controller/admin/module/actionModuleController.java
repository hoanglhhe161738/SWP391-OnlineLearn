/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.admin.module;

import controller.auth.BaseAuthorizationController;
import dal.ModuleDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Account;
import model.Course;
import model.Module;

/**
 *
 * @author Acer
 */
public class actionModuleController extends BaseAuthorizationController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        String action = req.getParameter("action").trim();
        ModuleDBContext mDB = new ModuleDBContext();
        Course course = (Course) req.getSession().getAttribute("course");
        switch(action){
            case "add" :
                String module_nameAdd = req.getParameter("module").trim();
                
                Module moduleModelAdd = new Module();
                moduleModelAdd.setModule_name(module_nameAdd);
                
                moduleModelAdd.setCourse(course);
                moduleModelAdd.setStatus(false);
                mDB.insert(moduleModelAdd);
                
                ArrayList<Module> modules = mDB.listModuleByCourseID(course.getCourse_id());
                int number_of_modules = modules.size();
                req.getSession().setAttribute("number_of_modules", number_of_modules);
                req.getSession().setAttribute("modules", modules);
                req.setAttribute("alert", "Đã thêm thành công");
                req.getRequestDispatcher("./addModule.jsp").forward(req, resp);
                break;
              
            case "edit":
                int module_id = Integer.parseInt(req.getParameter("module_id"));
                String module_name = req.getParameter("module").trim();
                
                Module moduleModelUpadate = new Module();
                moduleModelUpadate.setModule_id(module_id);
                moduleModelUpadate.setModule_name(module_name);
                moduleModelUpadate.setCourse(course);
                moduleModelUpadate.setStatus(false);
                
                mDB.update(moduleModelUpadate);
                req.setAttribute("alert", "Đã sửa thành công");
                req.getRequestDispatcher("./addModule.jsp").forward(req, resp);
                break;
            case "default":
                req.getRequestDispatcher("./addModule.jsp").forward(req, resp);
                break;
        }
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        ModuleDBContext mDB = new ModuleDBContext();
        String action = req.getParameter("action");
        int module_id = Integer.parseInt(req.getParameter("module_id"));
        if(module_id!= -1){
            Module module = mDB.get(module_id);
            req.setAttribute("module", module);
        }
        req.setAttribute("action", action);
        req.getSession().setAttribute("add", "add");
        req.getSession().setAttribute("edit", "edit");
        req.getRequestDispatcher("./addModule.jsp").forward(req, resp);
    }
    
}
