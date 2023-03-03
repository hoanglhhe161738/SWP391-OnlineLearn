/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.profile;

import controller.auth.BaseAuthenticationController;
import dal.UserDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import model.Account;
import model.User;

/**
 *
 * @author Khangnekk
 */
public class changeUserProfileController extends BaseAuthenticationController {

    protected void doPostProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String regexEmail = "\\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}\\b";
        Account acc = (Account) req.getSession().getAttribute("account");
        String username = acc.getUsername();

        UserDBContext uDB = new UserDBContext();
        User currentUser = uDB.getUserByUsername(username);
        int user_id = currentUser.getUser_id();
        String newFullName = req.getParameter("fullName");
        String newParentName = req.getParameter("parentName");
        String newParentEmail = req.getParameter("parentEmail");
        String newPhoneNumber = req.getParameter("phoneNumber");
        boolean newGender = Boolean.parseBoolean(req.getParameter("gender"));
        Date dob = Date.valueOf(req.getParameter("dob"));

        if (!newParentEmail.matches(regexEmail)) {
            req.setAttribute("noti1", "Sai định dạng email");
            req.getRequestDispatcher("./changeuserprofile.jsp").forward(req, resp);
        } else {
            User user = new User(user_id, newFullName, dob, newGender, newParentName, newParentEmail, newPhoneNumber, username);
            uDB.update(user);
            req.getSession().setAttribute("user", user);
            req.setAttribute("noti2", "Sửa thông tin thành công");
            req.getRequestDispatcher("./changeuserprofile.jsp").forward(req, resp);
        }
    }

    protected void doGetProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("./changeuserprofile.jsp").forward(req, resp);
    }

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPostProcess(req, resp);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGetProcess(req, resp);
    }

}
