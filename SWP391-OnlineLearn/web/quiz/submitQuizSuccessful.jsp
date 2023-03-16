<%-- 
    Document   : submitQuizSuccessful.jsp
    Created on : Mar 16, 2023, 5:19:05 PM
    Author     : Khangnekk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Điểm bài học</title>
        <style>
            .center {
                border-radius: 10px;
                padding: 5em 20em;
                text-align: center;
                background-color: #f2f2f2;
                font-family: sans-serif;
            }
            h1 {
                font-size: 36px;
                margin-bottom: 0.5em;
            }

            h2 {
                font-size: 24px;
                margin-top: 0;
            }
        </style>
    </head>
    <body>
        <div style="display: flex;
             flex-direction: column;
             justify-content: center;
             align-items: center;
             height: 100vh;">
            <div class="center">
                <img src="../Assets/images/email.png">
                <h1>Tên bài học</h1>
                <h2>Điểm: 20</h2>
            </div>
        </div>
    </body>
</html>
