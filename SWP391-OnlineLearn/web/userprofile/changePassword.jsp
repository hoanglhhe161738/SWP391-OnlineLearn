<%-- 
    Document   : changePassword
    Created on : Mar 12, 2023, 4:39:44 AM
    Author     : Khangnekk
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../Assets/css/styleLogin.css"/>
        <link rel="icon" href="../Assets/icon/favicon.png"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
              integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
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
            <form action="./changePassword" method="POST" class="login-form" autocomplete="off">
                <label for="username" class="login-label">Mật khẩu cũ</label>
                <c:if test="${requestScope.noti1 ne null}">
                    <a style="color: red"> (${requestScope.noti1}) </a>
                </c:if>
                <input type="password" name="oldPass" class="login-input" placeholder="">
                <label for="username" class="login-label">Mật khẩu mới</label>
                <c:if test="${requestScope.noti2 ne null}">
                    <a style="color: red"> (${requestScope.noti2}) </a>
                </c:if>
                <!--<input type="password" name="newPass" class="login-input" placeholder="">-->
                <input type="password" name="newPass" class="login-input" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Mật khẩu phải chứa ít nhất một số, một chữ cái viết thường, một chữ cái viết hoa và tối thiểu 8 ký tự." required>
                <label for="parentEmail" class="login-label"> Nhập lại mật khẩu mới</label>
                <c:if test="${requestScope.noti3 ne null}">
                    <a style="color: red"> (${requestScope.noti3}) </a>
                </c:if>
                <!--<input type="password" name="repeatNewPass" class="login-input" placeholder="">-->
                <input type="password" name="repeatNewPass" class="login-input" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Mật khẩu phải chứa ít nhất một số, một chữ cái viết thường, một chữ cái viết hoa và tối thiểu 8 ký tự." required>
                <p style="color: red; padding-left: 1em">${requestScope.alert1}</p>
                <p style="color: red; padding-left: 1em">${requestScope.alert3}</p>
                <p style="color: #00de7a; padding-left: 1em">${requestScope.alert2}</p>
                <input class="login-submit" type="submit" value="Đổi mật khẩu">
            </form>
            <p class="login-already">
                <a href="../home/homePage" class="login-signup-link">Trở về trang chủ</a>
            </p>
        </div>
    </body>
</html>
