<%-- 
    Document   : accessDenied
    Created on : Oct 17, 2022, 11:02:21 PM
    Author     : Khangnekk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Access Denied!</title>
        
        <style>
            body{
                background-color: black;
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
            
            <h2>Quyền truy cập bị từ chối!</h2>
            <h3><< Bạn cần có tái khoản để truy cập trang web của chúng tôi >></h3>
            <div class="noti">
                <button onclick="Login();"><< Đăng nhập >></a</button
            </div>
        </div>
        <script>
            function Login() {
                window.location = "../.././login/loginUser";
            }
        </script>
    </body>
</html>
