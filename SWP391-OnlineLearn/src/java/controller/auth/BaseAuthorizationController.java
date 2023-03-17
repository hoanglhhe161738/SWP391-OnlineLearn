/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Account;
import model.Feature;
import model.Role;

/**
 *
 * @author Khangnekk
 */
public abstract class BaseAuthorizationController extends BaseAuthenticationController {

    private boolean isAuthorized(HttpServletRequest req)
    {
       Account account = (Account)req.getSession().getAttribute("account");
       String currentUrl = req.getServletPath();
        for (Role role : account.getRoles()) {
            for (Feature feature : role.getFeatures()) {
                if(feature.getFe_url().equals(currentUrl))
                    return true;
            }
        }
        return false;
    }
    
    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(isAuthorized(req))
        {
            processPost(req, resp, (Account)req.getSession().getAttribute("account"));
        }
        else
        {
           req.getRequestDispatcher("../login/roleDenied.jsp").forward(req, resp);
        }
    }
    
    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(isAuthorized(req))
        {
            processGet(req, resp, (Account)req.getSession().getAttribute("account"));
        }
        else
        {
            req.getRequestDispatcher("../login/roleDenied.jsp").forward(req, resp);
        }
    }
    
    protected abstract void processPost(HttpServletRequest req, HttpServletResponse resp,Account account) throws ServletException, IOException;
    protected abstract void processGet(HttpServletRequest req, HttpServletResponse resp,Account account) throws ServletException, IOException;
    
    
}
