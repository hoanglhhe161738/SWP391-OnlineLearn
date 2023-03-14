<%-- 
    Document   : ranking
    Created on : Mar 14, 2023, 4:03:11 PM
    Author     : Khangnekk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bảng xếp hạng</title>
        <link rel="stylesheet" href="../Assets/css/Style.css">
        <link rel="stylesheet" href="../Assets/css/ranking.css">
        <link rel="icon" href="../Assets/icon/favicon.png">
        <!-- link bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
        <!-- <style>
            .close:hover {
                color: white;
            }
    
            .content {
                background-image: url('../Assets/images/bgNoBlur.png');
            }
        </style> -->
        <style>
            .table-ranking {
                width: 100%;
                border-collapse: collapse;
            }

            .table-ranking-head {
                position: sticky;
                top: 0;
                background-color: #fff;
            }

            .table-ranking-body {
                height: 70vh;
            }

            .table-ranking-row {
                display: table-row;
                width: 100%;
                clear: both;
            }

            .table-ranking-body-cell,
            .table-ranking-head-cell {
                display: table-cell;
                padding: 0.5em;
                text-align: center;
                border-bottom: 1px solid #ddd;
            }
            div::-webkit-scrollbar {
                width: 10px;
            }

            div::-webkit-scrollbar-track {
                background-color: #eee;
            }

            div::-webkit-scrollbar-thumb {
                background-color: cornflowerblue;
                border-radius: 10px;
            }

        </style>

    </head>

    <body style="background-image: url(../Assets/images/bg.png); background-size: 100%;">
        <div class="main" style="position: fixed; top: 0;">
            <!--nav bar-->
            <jsp:include page="../custom/nav.jsp"></jsp:include>
            <!--content-->
        </div>
        <div class="ranking-course container" style="position: absolute; left: 8em; overflow: unset">
            <div class="ranking-content" >
                <div class="ranking-item-one">
                    <h1>BẢNG XẾP HẠNG</h1>
                </div>
                <div class="ranking-item-two">
                    <form action="" method="">
                        <input size="50rem" type="text" style="border: #d6d2d2 2px solid; padding: 0.2em 0.5em"  placeholder="Nguyễn Văn A">
                        <input type="submit" value="Search" style=" border: white; border-radius: 3px; padding: 0.2em 1.5em">
                    </form>
                </div>
                <div class="ranking-item-three" style="overflow: auto; height: 70vh; border-radius: 10px;">
                    <table class="table-ranking" style="font-size: 1em; font-weight: bold;"">
                        <thead class="table-ranking-head">
                            <tr style="height: 3em; ">
                                <td class="table-rankinh-head-cell" style="border: none">Xếp hạng</td>
                                <td class="table-rankinh-head-cell" style="border: none">Họ và tên</td>
                                <td class="table-rankinh-head-cell" style="border: none">Điểm số</td>
                                <td class="table-rankinh-head-cell" style="border: none">Ghi chú</td>
                            </tr>
                        </thead>
                        <tbody class="table-ranking-body">
                            <tr class="table-ranking-row" style="background-color: #cfd5ea; height: 2.5em">
                                <td class="table-ranking-body-cell">1</td>
                                <td class="table-ranking-body-cell">Nguyễn Văn A</td>
                                <td class="table-ranking-body-cell">12312</td>
                                <td class="table-ranking-body-cell">Học ngu</td>
                            </tr>
                            <tr class="table-ranking-row" 
                                style="background-color: #e9ebf5;
                                height: 2.5em">
                                <td class="table-ranking-body-cell">2</td>
                                <td class="table-ranking-body-cell">Nguyễn Văn A</td>
                                <td class="table-ranking-body-cell">12312</td>
                                <td class="table-ranking-body-cell">Học ngu</td>
                            </tr>
                            <tr class="table-ranking-row" 
                                style="background-color: #e9ebf5;
                                height: 2.5em">
                                <td class="table-ranking-body-cell">2</td>
                                <td class="table-ranking-body-cell">Nguyễn Văn A</td>
                                <td class="table-ranking-body-cell">12312</td>
                                <td class="table-ranking-body-cell">Học ngu</td>
                            </tr>
                            <tr class="table-ranking-row" 
                                style="background-color: #e9ebf5;
                                height: 2.5em">
                                <td class="table-ranking-body-cell">2</td>
                                <td class="table-ranking-body-cell">Nguyễn Văn A</td>
                                <td class="table-ranking-body-cell">12312</td>
                                <td class="table-ranking-body-cell">Học ngu</td>
                            </tr>
                            <tr class="table-ranking-row" 
                                style="background-color: #e9ebf5;
                                height: 2.5em">
                                <td class="table-ranking-body-cell">2</td>
                                <td class="table-ranking-body-cell">Nguyễn Văn A</td>
                                <td class="table-ranking-body-cell">12312</td>
                                <td class="table-ranking-body-cell">Học ngu</td>
                            </tr>
                            <tr class="table-ranking-row" 
                                style="background-color: #e9ebf5;
                                height: 2.5em">
                                <td class="table-ranking-body-cell">2</td>
                                <td class="table-ranking-body-cell">Nguyễn Văn A</td>
                                <td class="table-ranking-body-cell">12312</td>
                                <td class="table-ranking-body-cell">Học ngu</td>
                            </tr>
                            <tr class="table-ranking-row" 
                                style="background-color: #e9ebf5;
                                height: 2.5em">
                                <td class="table-ranking-body-cell">2</td>
                                <td class="table-ranking-body-cell">Nguyễn Văn A</td>
                                <td class="table-ranking-body-cell">12312</td>
                                <td class="table-ranking-body-cell">Học ngu</td>
                            </tr>
                            <tr class="table-ranking-row" 
                                style="background-color: #e9ebf5;
                                height: 2.5em">
                                <td class="table-ranking-body-cell">2</td>
                                <td class="table-ranking-body-cell">Nguyễn Văn A</td>
                                <td class="table-ranking-body-cell">12312</td>
                                <td class="table-ranking-body-cell">Học ngu</td>
                            </tr>
                            <tr class="table-ranking-row" 
                                style="background-color: #e9ebf5;
                                height: 2.5em">
                                <td class="table-ranking-body-cell">2</td>
                                <td class="table-ranking-body-cell">Nguyễn Văn A</td>
                                <td class="table-ranking-body-cell">12312</td>
                                <td class="table-ranking-body-cell">Học ngu</td>
                            </tr>
                            <tr class="table-ranking-row" 
                                style="background-color: #e9ebf5;
                                height: 2.5em">
                                <td class="table-ranking-body-cell">2</td>
                                <td class="table-ranking-body-cell">Nguyễn Văn A</td>
                                <td class="table-ranking-body-cell">12312</td>
                                <td class="table-ranking-body-cell">Học ngu</td>
                            </tr>
                            <tr class="table-ranking-row" 
                                style="background-color: #e9ebf5;
                                height: 2.5em">
                                <td class="table-ranking-body-cell">2</td>
                                <td class="table-ranking-body-cell">Nguyễn Văn A</td>
                                <td class="table-ranking-body-cell">12312</td>
                                <td class="table-ranking-body-cell">Học ngu</td>
                            </tr>
                            <tr class="table-ranking-row" 
                                style="background-color: #e9ebf5;
                                height: 2.5em">
                                <td class="table-ranking-body-cell">2</td>
                                <td class="table-ranking-body-cell">Nguyễn Văn A</td>
                                <td class="table-ranking-body-cell">12312</td>
                                <td class="table-ranking-body-cell">Học ngu</td>
                            </tr>
                            <tr class="table-ranking-row" 
                                style="background-color: #e9ebf5;
                                height: 2.5em">
                                <td class="table-ranking-body-cell">2</td>
                                <td class="table-ranking-body-cell">Nguyễn Văn A</td>
                                <td class="table-ranking-body-cell">12312</td>
                                <td class="table-ranking-body-cell">Học ngu</td>
                            </tr>
                            <tr class="table-ranking-row" 
                                style="background-color: #e9ebf5;
                                height: 2.5em">
                                <td class="table-ranking-body-cell">2</td>
                                <td class="table-ranking-body-cell">Nguyễn Văn A</td>
                                <td class="table-ranking-body-cell">12312</td>
                                <td class="table-ranking-body-cell">Học ngu</td>
                            </tr>
                            <tr class="table-ranking-row" 
                                style="background-color: #e9ebf5;
                                height: 2.5em">
                                <td class="table-ranking-body-cell">2</td>
                                <td class="table-ranking-body-cell">Nguyễn Văn A</td>
                                <td class="table-ranking-body-cell">12312</td>
                                <td class="table-ranking-body-cell">Học ngu</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>