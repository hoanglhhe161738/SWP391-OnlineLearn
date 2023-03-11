<%-- 
    Document   : changePassword
    Created on : Mar 12, 2023, 4:39:44 AM
    Author     : Khangnekk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../Assets/css/styleLogin.css"/>
        <link rel="icon" href="../Assets/icon/favicon.png"/>
        <title>Đổi mật khẩu</title>
        <style>
            .login{
                border-radius: 12px;
                background: white;
            }
            .login-label{
                color: black;
            }
        </style>
    </head>
    <body>
        <div class="login">
            <h1 class="login-heading">Đổi mật khẩu</h1>
            <form action="" method="POST" class="login-form" autocomplete="off">
                <label for="username" class="login-label">Mật khẩu cũ</label>
                <input type="password" name="oldPass" class="login-input" placeholder="">
                <label for="username" class="login-label">Mật khẩu mới</label>
                <input type="password" name="newPass" class="login-input" placeholder="">
                <label for="parentEmail" class="login-label"> Nhập lại mật khẩu mới</label>
                <input type="password" name="repeatNewPass" class="login-input" placeholder="">
                <p style="color: red; padding-left: 1em">${requestScope.alert}</p>
                <input class="login-submit" type="submit" value="Đổi mật khẩu">
            </form>
            <p class="login-already">
                <span>Bạn chưa có tài khoản?</span>
                <a href=".././signup/signup.jsp" class="login-signup-link">Tạo tài khoản mới</a>
            </p>
            <p class="login-already">

                <a href=".././login/login.jsp" class="login-signup-link">Về đăng nhập</a>
            </p>
        </div>
    </body>
</html>
