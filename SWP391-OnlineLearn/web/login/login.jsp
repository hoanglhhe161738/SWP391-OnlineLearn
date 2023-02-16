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
        <title>Login</title>

    </head>
    <body>
        <div class="login">
            <h1 class="login-heading">Đăng nhập</h1>
            <!-- <button class="signup-social">
              <i class="fa fa-google signup-social-icon"></i>
              <span class="signup-social-text">Sign up with Google</span>
            </button>
            -->
<<<<<<< Updated upstream
            <form action="#" class="login-form" autocomplete="off">
=======
            <form action="loginPage" method="POST" class="login-form" autocomplete="off">
>>>>>>> Stashed changes
                <label for="username" class="login-label">Nickname</label>
                <input type="text" name="username" class="login-input" placeholder="VD: HoangPongPayVoCungLuon">
                <label for="password" class="login-label">Mật khẩu</label>
                <input type="password" name="password" class="login-input" >
                <input class="login-submit" type="submit" value="Đăng nhập">
            </form>
            <p class="login-already">
                <span>Bạn chưa có tài khoản?</span>
                <a href="./signup.jsp" class="login-signup-link">Tạo tài khoản mới</a>
            </p>
            <p class="login-already">

                <a href="./forgetPassword.jsp" class="login-signup-link">Quên mật khẩu</a>
            </p>
        </div>
    </body>
</html>