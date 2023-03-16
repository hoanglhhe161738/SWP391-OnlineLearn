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
import dal.*;
import jakarta.servlet.http.HttpSession;
import model.*;
import java.util.*;
import java.sql.Date;
import java.time.LocalDate;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author T490
 */
public class Fillin4Controller extends HttpServlet {

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
//         AccountDBContext accdb = new AccountDBContext();
        String fullName = request.getParameter("fullName");
        Date dob = Date.valueOf(request.getParameter("dob"));
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String parentName = request.getParameter("parentName");
        String parentEmail = request.getParameter("parentEmail");
        String parentPhoneNumber = request.getParameter("parentPhoneNumber");
        Account newAccount = (Account) request.getSession().getAttribute("newAccount");
        String username = newAccount.getUsername();

//        System.out.println(user.getParent_email());
        boolean fullNameCheck = checkInputString(fullName);
        boolean parentNameCheck = checkInputString(parentName);
        boolean dobCheck = isDateValid(dob);
        boolean parentEmailCheck = isValidEmail(parentEmail);
        boolean parentPhoneNumCheck = isVietnamesePhoneNumber(parentPhoneNumber);
        if (!dobCheck
                || !fullNameCheck
                || !parentEmailCheck
                || !parentNameCheck
                || !parentPhoneNumCheck) {
            if (!fullNameCheck) {
                request.setAttribute("alert1", "Họ và tên không hợp lệ");
            }
            if (!dobCheck) {
                request.setAttribute("alert2", "Ngay sinh không hợp lệ");
            }
            if (!parentEmailCheck) {
                request.setAttribute("alert3", "Email Phu Huynh không hợp lệ");
            }
            if (!parentNameCheck) {
                request.setAttribute("alert4", "Ten phu huynh không hợp lệ");
            }
            if (!parentPhoneNumCheck) {
                request.setAttribute("alert5", "SDT không hợp lệ");
            }
            request.getRequestDispatcher("./fillin4.jsp").forward(request, response);
        } else {
            User user = new User();
            user.setDob(dob);
            user.setFull_name(fullName);
            user.setGender(gender);
            user.setParent_email(parentEmail);
            user.setParent_name(parentName);
            user.setParent_phone_number(parentPhoneNumber);
            user.setUsername(username);
            request.getSession().setAttribute("newUser", user);
            request.getRequestDispatcher("./sendMail").forward(request, response);
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
        request.getRequestDispatcher("./fillin4.jsp").forward(request, response);
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

    public boolean checkInputString(String inputString) {
        return !inputString.isEmpty();
    }

    public boolean isDateValid(Date date) {
        LocalDate currentDate = LocalDate.now();
        LocalDate inputDate = date.toLocalDate();
        return inputDate.isBefore(currentDate) || inputDate.isEqual(currentDate);
    }

    public boolean isValidEmail(String email) {
        // Regular expression để kiểm tra định dạng email
        String regexEmail = "\\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}\\b";

        // Tạo một pattern để so khớp chuỗi đầu vào với regular expression
        Pattern pattern = Pattern.compile(regexEmail);

        // Sử dụng Matcher để kiểm tra chuỗi đầu vào có khớp với pattern hay không
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    public boolean isVietnamesePhoneNumber(String phoneNumber) {
        String phoneNumberRegex = "^(\\+?84|0)\\d{9,10}$";
        Pattern pattern = Pattern.compile(phoneNumberRegex);

        // Sử dụng Matcher để kiểm tra chuỗi đầu vào có khớp với pattern hay không
        Matcher matcher = pattern.matcher(phoneNumber);
        return matcher.matches();
    }
}
