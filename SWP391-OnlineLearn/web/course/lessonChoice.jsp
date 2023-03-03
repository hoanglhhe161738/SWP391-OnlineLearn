<%-- 
    Document   : lessonChoice
    Created on : Mar 3, 2023, 10:09:42 AM
    Author     : Khangnekk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="../Assets/icon/favicon.png"/>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
            <a href="../game/matchgame?lession_id=${requestScope.lesson.lesson_id}">Game</a>
            <a href="./quiz?lession_id=${requestScope.lesson.lesson_id}">Bài tập</a>
            <a href="./videoLesson?lesson_id=${requestScope.lesson.lesson_id}">Video</a>
            <a href="./contentLesson?lesson_id=${requestScope.lesson.lesson_id}">Lý thuyết</a>
            <a href="">Xếp hạng</a>
            <a href="../ranking/ranking.html">mark as learnt</a>
        </h1>
    </body>
</html>
