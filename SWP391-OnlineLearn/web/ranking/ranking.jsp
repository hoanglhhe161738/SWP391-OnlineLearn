<%-- 
    Document   : ranking
    Created on : Mar 14, 2023, 4:03:11 PM
    Author     : Khangnekk
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
              integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- <style>
            .close:hover {
                color: white;
            }
    
            .content {
                background-image: url('../Assets/images/bgNoBlur.png');
            }
        </style> -->
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
                background: #e9ebf5;
            }
            th, td {
                padding: 8px;
                text-align: center;
                border-bottom: 1px solid #ddd;
            }
            th {
                color: white;
                background-color: #00de7a;
                position: sticky;
                top: 0;
            }
            /* Căn giữa nội dung bảng */
            .table-container {
                overflow-x: auto;
            }
            .table-ranking-body-cell  img{
                width: 2em;
            }
            .table-ranking-body-cell{
                font-size: 18px;
                font-weight: bold;
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
                        <form action="./rankingPage" method="POST">
                            <div class="input-group rounded" style="width: 30em">
                                <input id="inputTotal" name="keyName" type="search" class="form-control rounded" placeholder="Tìm kiếm theo tên" aria-label="Search" aria-describedby="search-addon" />
                                <input style="border: none; border-radius: 0 8px 8px 0; margin-left: 0.25em" type="submit" value="Tìm kiếm">
                            </div>
                        </form>
                    </div>
                    <div class="ranking-item-three">
                        <div class="container" style="margin-top: 1em;">
                            <div class="table-container" style="overflow: auto; height: 70vh; border-radius: 10px;">
                            <c:if test="${requestScope.rankings ne null}">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Xếp hạng</th>
                                            <th>Họ và tên</th>
                                            <th>Điểm số</th>
                                            <th>Ghi chú</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.rankings}" var="r">
                                            <tr class="table-ranking-row">
                                                <td class="table-ranking-body-cell">

                                                    <c:if test="${r.rank eq 1}">
                                                        <img src="../Assets/images/1.png">
                                                    </c:if>
                                                    <c:if test="${r.rank eq 2}">
                                                        <img src="../Assets/images/2.png">
                                                    </c:if>
                                                    <c:if test="${r.rank eq 3}">
                                                        <img src="../Assets/images/3.png">
                                                    </c:if>
                                                    <c:if test="${r.rank > 3}">
                                                        ${r.rank}
                                                    </c:if>
                                                </td>
                                                <td class="table-ranking-body-cell"style="text-align: left">${r.full_name}</td>
                                                <td class="table-ranking-body-cell">${r.points}</td>
                                                <td class="table-ranking-body-cell"> - </td>
                                            </tr>
                                        </c:forEach>  
                                    </tbody>
                                </table>
                            </c:if>
                            <c:if test="${requestScope.rankingsByKeyName ne null}">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Xếp hạng</th>
                                            <th>Họ và tên</th>
                                            <th>Điểm số</th>
                                            <th>Ghi chú</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.rankingsByKeyName}" var="rKey">
                                            <tr class="table-ranking-row">
                                                <td class="table-ranking-body-cell">
                                                    <c:if test="${rKey.rank eq 1}">
                                                        <img src="../Assets/images/1.png">
                                                    </c:if>
                                                    <c:if test="${rKey.rank eq 2}">
                                                        <img src="../Assets/images/2.png">
                                                    </c:if>
                                                    <c:if test="${rKey.rank eq 3}">
                                                        <img src="../Assets/images/3.png">
                                                    </c:if>
                                                    <c:if test="${rKey.rank > 3}">
                                                        ${rKey.rank}
                                                    </c:if>
                                                </td>
                                                <td class="table-ranking-body-cell" style="text-align: left">${rKey.full_name}</td>
                                                <td class="table-ranking-body-cell">${rKey.points}</td>
                                                <td class="table-ranking-body-cell"> - </td>
                                            </tr>
                                        </c:forEach>  
                                    </tbody>
                                </table>
                            </c:if>
                        </div>
                    </div>
                </div>
                </body>
                </html>