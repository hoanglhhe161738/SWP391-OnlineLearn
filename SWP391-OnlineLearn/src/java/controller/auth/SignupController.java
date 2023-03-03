/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.auth;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dal.AccountDBContext;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author T490
 */
public class SignupController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String cfpassword = request.getParameter("cfpassword");
        String passwordRegex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()–[{}]:;',?/*~$^+=<>]).{8,20}$";
        if (!password.equals(cfpassword)) {
            request.setAttribute("mess2", "Mật khẩu không khớp. Vui lòng nhập lại!");
            request.getRequestDispatcher("./signup.jsp").forward(request, response);
        } else {
            if (password.matches(passwordRegex)) {
                AccountDBContext accdb = new AccountDBContext();
                Account a = accdb.checkAccountExisted(username);
                if (a == null) {
                    //can signup
//                    accdb.fillin4(username, password);
                    Account acc = new Account(username, password, "normal");
                    HttpSession session = request.getSession();
                    session.setAttribute("newAccount", acc);
                    response.sendRedirect("./fillin4");

                } else {
                    request.setAttribute("mess1", "Tên tài khoản đã tồn tại. Vui lòng nhập lại");
                    request.getRequestDispatcher("./signup.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("mess1", "Mật khẩu phải bao gồm 8 ký tự trở lên và phải bao gồm chữ hoa, chữ thường, số từ 0 đến 9 và bao gồm ký tự đặc biệt");
                request.getRequestDispatcher("./signup.jsp").forward(request, response);
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("./signup.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
