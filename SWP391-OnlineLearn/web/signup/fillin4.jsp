<%-- 
    Document   : fillin4
    Created on : Feb 15, 2023, 2:39:36 PM
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
        <title>fillin4</title>

    </head>

    <body>
        <div class="bg">
        </div>
        <div class="fillin4">
            <h1 class="signup-heading">Thông tin tài khoản</h1>
            <!-- <button class="signup-social">
                  <img class="fa fa-google signup-social-icon" src="/img/logoGG.png">
                  <span class="signup-social-text">Đăng kí bằng tài khoản Google</span>
                </button> -->
            <form action="./fillin4" class="signup-form" method="POST">

                
                <label for="fullName" class="signup-label">Họ và tên</label>
                <input type="text" name="fullName" class="signup-input" placeholder="VD: Hứa Như Không">

                <!-- dob -->
                <label for="dob" class="signup-label">Ngày sinh</label>
                <input type="date" name="dob" class="signup-input">

                <!-- gender -->
                <label for="gender" class="signup-label">Giới tính: Nam <input type="radio" value="true" name="gender" checked> | Nữ <input
                        type="radio" value="false" name="gender"> <br></label> <br>
                <br>

                <!-- parentName -->
                <label for="prentName" class="signup-label">Họ và tên phụ huynh</label>
                <input type="text" name="parentName" class="signup-input" placeholder="VD: Hứa Xong Quên">

                <!-- parentEmail -->
                <label for="parentEmail" class="signup-label">Email của phụ huynh</label>
                <input type="email" name="parentEmail" class="signup-input" placeholder="VD: ThangSunXiTrai@gmail.com">

                <!-- parentPhoneNumber  -->
                <label for="parentPhoneNumber" class="signup-label">Sđt của phụ huynh</label>
                <input type="text" name="parentPhoneNumber" class="signup-input" placeholder="VD: 0941142465">

                <input class="signup-submit" type="submit" value="Hoàn tất">
            </form>
            <p class="signup-already">

                <a  href="./signup.jsp" class="cancel signup-submit">Hủy bỏ</a>
            </p>
        </div>
    </body>
</html>
