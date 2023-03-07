<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : lessonChoice
    Created on : Mar 3, 2023, 10:09:42 AM
    Author     : Khangnekk
--%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="../Assets/css/Style.css">
    <link rel="stylesheet" href="../Assets/css/popup.css">
    <link rel="stylesheet" href="../Assets/css/choiceLession.css">
    <!-- link bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
    
</head>

<body>
    <div class="main">
        <!--nav bar-->
            <jsp:include page="../custom/nav.jsp"></jsp:include>
                <!--content-->

        <div class="content">
            <!--Ae code o day nha-->
            <div class="container text-center choicelession">
                <div class="row row-cols-2 row-cols-lg-5 g-2 g-lg-3 choicelession-content" style="margin-top: 10%; border-bottom: 1em solid white; padding-bottom: 1em;">
                    <div class="col">
                        <a href="./quiz?lession_id=${requestScope.lesson.lesson_id}" style="text-decoration: none; color: white; ">
                            <div class="p-3" style="background-color: #7030a0; height: 20em; width: 12em; border-radius: 15px;">
                                <p style="
                        font-weight: bolder; font-size: 2rem;"> Bài tập</p>
                                <div class="box-border">
                                    <div class="box-content"></div>
                                </div>
                            </div>
                        </a>

                    </div>
                    <div class="col">
                        <a href="../game/matchgame?lession_id=${requestScope.lesson.lesson_id}" style="text-decoration: none; color: white; ">
                            <div class="p-3" style="background-color: #ff7f27; height: 20em; width: 12em; border-radius: 15px;">
                                <p style="
                        font-weight: bolder; font-size: 2rem;"> Game</p>
                                <div class="box-border">
                                    <div class="box-content"></div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col">
                        <a href="./videoLesson?lesson_id=${requestScope.lesson.lesson_id}" style="text-decoration: none; color: white; ">
                            <div class="p-3" style="background-color: #00b050; height: 20em; width: 12em; border-radius: 15px;">
                                <p style="
                        font-weight: bolder; font-size: 2rem;"> Video</p>
                                <div class="box-border">
                                    <div class="box-content"></div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col">
                        <a href="./contentLesson?lesson_id=${requestScope.lesson.lesson_id}" style="text-decoration: none; color: white; ">
                            <div class="p-3" style="background-color: #0081e2; height: 20em; width: 12em;border-radius: 15px;">
                                <p style="
                        font-weight: bolder; font-size: 2rem;"> Lý thuyết</p>
                                <div class="box-border">
                                    <div class="box-content"></div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col">
                        <a href="" style="text-decoration: none; color: white; ">
                            <div class="p-3" style="background-color: #ec31ef; height: 20em; width: 12em;border-radius: 15px;">
                                <p style="
                        font-weight: bolder; font-size: 2rem;"> Xếp Hạng</p>
                                <div class="box-border">
                                    <div class="box-content"></div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>

</html>


