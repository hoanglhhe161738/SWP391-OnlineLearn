/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.auth;

import dal.AccountDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.User;

/**
 *
 * @author Khangnekk
 */
public class changePasswordController extends BaseAuthenticationController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            securityProcessorCore spc = new securityProcessorCore();
            User user = (User) req.getSession().getAttribute("user");
            String oldPass = req.getParameter("oldPass");
            String newPass = req.getParameter("newPass");
            String repeatNewPass = req.getParameter("repeatNewPass");
            AccountDBContext aDB = new AccountDBContext();
            Account accountChangePass = aDB.login(user.getUsername(), spc.md5EncodePassword(oldPass));
            Account account = (Account) req.getSession().getAttribute("account");
            if (oldPass.isEmpty() || newPass.isEmpty() || repeatNewPass.isEmpty()) {
                if (oldPass.isEmpty()) {
                    req.setAttribute("noti1", "Phần này không được bỏ trống");
                }
                if (newPass.isEmpty()) {
                    req.setAttribute("noti2", "Phần này không được bỏ trống");
                }
                if (repeatNewPass.isEmpty()) {
                    req.setAttribute("noti3", "Phần này không được bỏ trống");
                }
                req.getRequestDispatcher("./changePassword.jsp").forward(req, resp);
            } else {
                if (accountChangePass.getUsername().equals(account.getUsername())) {
                    if (newPass.equals(repeatNewPass)) {
                        
                    } else {
                        req.setAttribute("alert", "Mật khẩu không khớp, vui lòng nhập lại");
                        req.getRequestDispatcher("./changePassword.jsp").forward(req, resp);
                    }
                } else {
                    req.setAttribute("alert", "Nhập sai mật khẩu cũ, vui lòng nhập lại");
                    req.getRequestDispatcher("./changePassword.jsp").forward(req, resp);
                }
            }
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(changePasswordController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

}
