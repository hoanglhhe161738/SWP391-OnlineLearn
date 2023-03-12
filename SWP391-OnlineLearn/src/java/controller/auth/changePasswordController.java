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
        User user = (User) req.getSession().getAttribute("user");
        String oldPass = req.getParameter("oldPass");
        String newPass = req.getParameter("newPass");
        String repeatNewPass = req.getParameter("repeatNewPass");
        AccountDBContext aDB = new AccountDBContext();
        Account accountChangePass = aDB.login(user.getUsername(), oldPass);
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
            if (accountChangePass != null) {
                if (newPass.equals(repeatNewPass)) {
                    aDB.updatePassword(user.getUsername(), newPass);
                    req.setAttribute("alert2", "Đổi mật khẩu thành công");
                    req.getRequestDispatcher("./changePassword.jsp").forward(req, resp);
                } else {
                    req.setAttribute("alert1", "Mật khẩu không khớp, vui lòng nhập lại");
                    req.getRequestDispatcher("./changePassword.jsp").forward(req, resp);
                }
            } else {
                req.setAttribute("alert3", "Nhập sai mật khẩu cũ, vui lòng nhập lại");
                req.getRequestDispatcher("./changePassword.jsp").forward(req, resp);
            }
        }
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("./changePassword.jsp");
    }

}
