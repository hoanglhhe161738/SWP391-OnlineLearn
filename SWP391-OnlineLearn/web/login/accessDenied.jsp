<%-- 
    Document   : accessDenied
    Created on : Feb 27, 2023, 4:10:50 PM
    Author     : T490
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cảnh báo!</title>
        <link rel="icon" href="assets/favicon/fu-favicon.jpg" />
        <style>
            body{
                background-color: black;
            }
            .content{
                margin: 10em auto;
                width: 50%;
                padding: 15px;
                text-align: center;
            }
            .content h2{
                font-size: 50px;
                font-family: cursive;
                color: red;
            }
            button{
                border: 1px solid #ccc;
                border-radius: 9px;
                font-family: cursive;
                color: red;
                font-weight: bold;
                font-size: 16px;
            }
            .noti{
                width: 70%;
                text-align: center;
                margin: 10px auto;
                
            }
            .content h3{
                font-size: 18px;
                font-family: cursive;
                color: white;
            }
        </style>

    </head>
    <body>
        <div class="content">
            
            <h2>Không thể truy cập!</h2>
            <h3> Bạn cần phải đăng nhập để sử dụng trang web! </h3>
            <div class="noti">
                
                <button onclick="Login();"> Đăng nhập </a</button
            </div>
            </div>
        </div>
        <script>
            function Login() {
                window.location = "../login/loginUser";
            }
        </script>
    </body>
</html>
