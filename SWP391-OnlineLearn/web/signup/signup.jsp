<%-- 
    Document   : signup
    Created on : Feb 15, 2023, 2:37:44 PM
    Author     : T490
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../Assets/css/styleSignup.css" />
        <link rel="icon" href="../Assets/icon/favicon.png"/>
        <title>Sign up</title>
        <style>
        .signup{
                border-radius: 12px;
                background: white;
            }
            .signup-label{
                color: black;
            }
            </style>
    </head>

    <body>
        <div class="bg">
        </div>
        <div class="signup">
            <h1 class="signup-heading">Đăng ký</h1>
            <!-- <button class="signup-social">
                  <img class="fa fa-google signup-social-icon" src="/img/logoGG.png">
                  <span class="signup-social-text">Đăng kí bằng tài khoản Google</span>
                </button> -->
            <form action="signupUser" method="POST" class="signup-form" autocomplete="off">

                <!-- username -->
                <label for="username" class="signup-label">Tên Tài Khoản</label>
                <input type="text" name="username" class="signup-input" placeholder="VD: KhangNoiLon">

                <label for="password" class="signup-label">Mật khẩu</label>
                <input type="password" name="password" class="signup-input">

                <label for="cfpassword" class="signup-label">Nhập lại mật khẩu</label>
                <input type="password" name="cfpassword" class="signup-input">
            <div class="alert alert-danger" role="alert" style="color: red; margin-bottom: 1em; text-align: center"">
                ${mess1}
            </div>
            <div class="alert alert-danger" role="alert" style="color: red; margin-bottom: 1em; text-align: center"">
                ${mess2}
            </div>

                <input class="signup-submit" type="submit" value="Đăng kí">
            </form>
            <p class="signup-already">
                <span>Bạn đã có tài khoản?</span>
                <a href="../login/login.jsp" class="signup-login-link">Đăng nhập</a>
            </p>
        </div>
    </body>
</html>
