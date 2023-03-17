<%-- 
    Document   : login
    Created on : Feb 15, 2023, 2:35:43 PM
    Author     : T490
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
        <title>Login</title>
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
            <h1 class="login-heading">Đăng nhập</h1>
            <div class="alert alert-danger" role="alert" style="color: red; margin-bottom: 1em; text-align: center"">
                ${mess}
            </div>
            <!-- <button class="signup-social">
              <i class="fa fa-google signup-social-icon"></i>
              <span class="signup-social-text">Sign up with Google</span>
            </button>
            -->
            <form action="loginUser" method="POST" class="login-form" autocomplete="off">
                <label for="username" class="login-label">Tên tài khoản</label>
                <input type="text" name="username" class="login-input" placeholder="VD: HoangPongPayVoCungLuon">
                <label for="password" class="login-label">Mật khẩu</label>
                <input type="password" name="password" class="login-input" >
                <input class="login-submit" type="submit" value="Đăng nhập">
            </form>
            <p class="login-already">
                <span>Bạn chưa có tài khoản?</span>
                <a href=".././signup/signup.jsp" class="login-signup-link">Tạo tài khoản mới</a>
            </p>
            <p class="login-already">

                <a href=".././forgetPassword/forgetPassword.jsp" class="login-signup-link">Quên mật khẩu</a>
            </p>
        </div>
    </body>
</html>
