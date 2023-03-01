/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.payment;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Khangnekk
 */
public class enterMailController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String regexEmail = "\\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}\\b";
        String recipient = req.getParameter("email");
        if (recipient.matches(regexEmail)) {
            // Get recipient email address and message from form data
            String verifyCode = getRandomNumberString();
            String message = messageProcess(verifyCode);

            HttpSession verifyPremium = req.getSession();
            verifyPremium.setAttribute("verifyCode", verifyCode);
            verifyPremium.setMaxInactiveInterval(2*60);

            // Set up mail server and authentication
            String host = "smtp.gmail.com";
            String user = "contact.khalgfk@gmail.com";
            String password = "oiowajaidxxqqubl";

            // Create properties object for the mail session
            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", "587");

            // Create mail session and authenticate with credentials
            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(user, password);
                }
            });

            try {
                // Create message and set recipient, subject, and message body
                Message msg = new MimeMessage(session);
                msg.setFrom(new InternetAddress(user));
                msg.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
                msg.setSubject("Upgrade to a premium account");
                msg.setText(message);

                // Send message
                Transport.send(msg);

                // Redirect to success page
                req.getRequestDispatcher("./encodeEmail.html").forward(req, resp);
            } catch (MessagingException e) {
                // Redirect to error page
                resp.getWriter().print("error");
            }
        } else {
            String noti = "Wrong format email";
            req.setAttribute("noti", noti);
            req.getRequestDispatcher("./emailAcception.html").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("./emailAcception.html").forward(req, resp);
    }

    public static String getRandomNumberString() {
        // It will generate 6 digit random Number.
        // from 0 to 999999
        Random rnd = new Random();
        int number = rnd.nextInt(999999);

        // this will convert any number sequence into 6 character.
        return String.format("%06d", number);
    }

    /**
     *
     * @param verifyCode
     * @return
     */
    public static String messageProcess(String verifyCode) {
        String message = "Hello,\n"
                + "Thank you for upgrading your account to a premium account\n"
                + "Your verification code is: " + verifyCode;

        return message;
    }

}