

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Access Denied!</title>

        <style>
            body{
                position: fixed;
                width: 100%;
                background-image: url(.././Assets/images/bg8.png);
                height: 100vh;
                background-size: cover;
                align-items: center;
                justify-content: center;
            }
            .content{
                margin: 10em auto;
                width: 50%;
                padding: 15px;
                text-align: center;
 
                border-radius: 9px;
            }
            .content h2{
                font-size: 50px;
                font-family: cursive;
                color: red;
            }
            .content h3{
                font-size: 18px;
                font-family: cursive;
                color: white;
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
        </style>

    </head>
    <body>
        <div class="content">

            <h2>Không thể truy cập</h2>
            <h3>Bạn cần phải có đăng nhập để sử dụng trang web của chúng tôi</h3>
            <div class="noti">
                <a style="color: white;
                   font-family: cursive;
                   font-weight: bold;
                   font-size: 16px;">Nêú bạn đã có tài khoản</a>
                <button onclick="Login();"> Đăng nhập </a</button
            </div>
        </div>
        <script>
            function Login() {
                window.location = "loginUser";
            }
        </script>
    </body>
</html>
