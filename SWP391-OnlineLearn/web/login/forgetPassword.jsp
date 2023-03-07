<%-- 
    Document   : forgetPassword
    Created on : Feb 15, 2023, 2:38:40 PM
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
        <title>Forget Password</title>
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
            <h1 class="login-heading">Quên mật khẩu</h1>
            <!-- <button class="signup-social">
              <i class="fa fa-google signup-social-icon"></i>
              <span class="signup-social-text">Sign up with Google</span>
            </button>
            -->
            <form action="#" class="login-form" autocomplete="off">
                <!-- <label for="username" class="login-label">Nhập tên đăng nhập và địa chỉ Email (địa chỉ email này phải đúng với địa chỉ email đã đăng kí trong trang cá nhân). Sau đó chúng tôi sẽ gửi mật khẩu mới vào Email của bạn!</label> -->

                <!-- username -->
                <label for="username" class="login-label">Nickname</label>
                <input type="text" name="username" class="login-input" placeholder="VD: HoangPongPayVoCungLuon">

                <!-- parentEmail -->
                <label for="parentEmail" class="login-label">Email của phụ huynh</label>
                <input type="email" name="parentEmail" class="login-input" placeholder="VD: KhanhCute@gmail.com">
                <input class="login-submit" type="submit" value="Lấy lại mật khẩu">
            </form>
            <p class="login-already">
                <span>Bạn chưa có tài khoản?</span>
                <a href="./signup.jsp" class="login-signup-link">Tạo tài khoản mới</a>
            </p>
            <p class="login-already">

                <a href="./login.jsp" class="login-signup-link">Về đăng nhập</a>
            </p>
        </div>
    </body>
</html>
