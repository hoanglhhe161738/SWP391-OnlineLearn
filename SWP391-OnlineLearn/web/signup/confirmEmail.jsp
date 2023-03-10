<%-- 
    Document   : confirmEmail
    Created on : Feb 26, 2023, 10:33:49 PM
    Author     : T490
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../Assets/icon/favicon.png"/>
    <title>Xác nhận đăng kí tài khoản</title>
    <style>
        body {
            position: fixed;
            width: 100%;
            height: 100vh;
            background-image: url(../Assets/images/bg.png);
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: center;
        }

            .container {
                border: 1px solid black;
                border-radius: 30px;
                background-color: rgb(238, 238, 231);
                max-width: 35%;
                padding: 1em 5em;
                position: relative;
            }

            h1 {
                color: rgb(45, 197, 45);
                text-align: center;
            }

            .mess {
                text-align: center;
            }

            .signup-input {
                display: block;
                width: 100%;
                margin-bottom: 1em;
                padding: 0.5em;
                border-radius: 5px;
                border: 1px solid #ccc;
                font-size: 1em;
            }

            .login-submit {
                padding: 0.8em;
                color: white;
                font-size: 18px;
                text-align: center;
                border: 0;
                outline: none;
                display: inline-block;
                width: 105%;
                border-radius: 14px;
                background-color: #00de7a;
                font-family: "Poppins", sans-serif;
                cursor: pointer;
                font-weight: 600;
                box-shadow: 0 5px 10px 0 rgba(30, 201, 64, 0.5);
                margin:1em auto;
            }

            .cancel{
                padding: 0.8em;
                color: white;
                font-size: 18px;
                text-align: center;
                border: 0;
                outline: none;
                display: inline-block;
                width: 100%;
                border-radius: 14px;
                background-color: red;
                font-family: "Poppins", sans-serif;
                cursor: pointer;
                font-weight: 600;
                box-shadow: 0 5px 10px 0 red;
                margin:1em auto;
                text-decoration: none;
            }

            img{
                display: block;
                margin: 0 auto;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <img src="../Assets/images/email.png" alt="">
            <h1>Xác nhận đăng kí tài khoản</h1>
            <p class="mess">Chúng tôi vừa gửi 1 mã xác nhận bao gồm 6 chữ số vào email của bạn. Vui lòng kiểm tra email rồi nhập mã xác nhận đó vào phần bên dưới để hoàn tất đăng ký!</p>

            <div class="input">
                <form action="./verifyCode" method="POST">
                    <input type="text" id="verify-code-input" name="confirm" class="signup-input" maxlength="7" placeholder="XXX-XXX">
                    <p style="font-size: 0.75em;">(*)Lưu ý: Mã xác nhận chỉ có hiệu lực trong 2 phút</p>
                    <input class="login-submit" type="submit" value="Hoàn tất">


                    <a  href="./signup.jsp" class="cancel">Hủy bỏ</a>

                </form>
            </div>


        </div>
        <script>
//            const input = document.getElementById("verify-code-input");
//            input.addEventListener("input", () => input.value = formatNumber(input.value.replaceAll("-", "")));
//
//            const formatNumber = (number) => number.split("").reduce((seed, next, index) => {
//                    if (index !== 0 && !(index % 3))
//                        seed += "-";
//                    return seed + next;
//                }, "");
        </script>
    </body>
</html>