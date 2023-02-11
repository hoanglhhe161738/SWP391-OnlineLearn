/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.course;

import dal.LessionDBContext;
import dal.ModuleDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Lession;
import model.Module;

/**
 *
 * @author Khangnekk
 */
public class moduleController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int module_id = Integer.parseInt(req.getParameter("module_id"));
        ModuleDBContext mDB = new ModuleDBContext();
        LessionDBContext lDB = new LessionDBContext();
        ArrayList<Lession> lessions = lDB.listLessionByModuleID(module_id);
        Module module = mDB.get(module_id);
        req.setAttribute("module", module);
        req.setAttribute("lessions", lessions);
        req.getRequestDispatcher("./module.jsp").forward(req, resp);
    }
    
}
