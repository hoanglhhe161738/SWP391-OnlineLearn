<%-- 
    Document   : userManagementController
    Created on : Mar 15, 2023, 1:56:39 PM
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
        <link rel="stylesheet" href="../Assets/css/action.css">
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
        <style>
            .custom-icon{
                font-size: 3em;
            }
            .element-part{
                padding: 0.5em;
                border: 1px solid #ccc;
                border-radius: 10px;
                color: white;
            }
            .part{
                margin-top: 1em;
                text-align: center;
            }
            .part a{
                text-decoration: none;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            th {
                background-color: #f2f2f2;
                position: sticky;
                top: 0;
            }
            /* Căn giữa nội dung bảng */
            .table-container {
                overflow-x: auto;
            }
        </style>
        <title>Quản lý người dùng</title>
    </head>

    <body>
        <jsp:include page="../custom/navForAdmin.jsp"></jsp:include>
            <div>
                <div class="container part">
                    <div class="row">
                        <div class="col-md-4">
                            <a href="./manageTotalUser">
                                <div class="element-part" style="background: red">
                                    <i class="custom-icon fa-solid fa-database"></i><span style="font-size: 3em; margin-left: 1em">${sessionScope.total}</span><br>
                                    <h3 class="element-title">Tổng số người dùng</h3>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="./manageNomalUser">
                                <div class="element-part" style="background: #0081e2">
                                    <i class="custom-icon fa-solid fa-circle"></i><span style="font-size: 3em; margin-left: 1em">${sessionScope.normal}</span>
                                    <h3 class="element-title">Người dùng thường</h3>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="./managePremiumUser">
                                <div class="element-part" style="background: #00ed7a">
                                    <i class="custom-icon fa-sharp fa-solid fa-gem"></i><span style="font-size: 3em; margin-left: 1em">${sessionScope.premium}</span>
                                    <h3 class="element-title">Người dùng premium</h3>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="container" style="display: flex; justify-content: start; margin-top: 1em;">
                    <div class="row">
                    <c:if test="${requestScope.totalUsers ne null}">
                        <form id="formTotal" action="./manageTotalUser" method="POST">
                            <div class="input-group rounded" style="width: 30em">
                                <input id="inputTotal" name="keyTotal" type="search" class="form-control rounded" placeholder="Tìm kiếm theo tên" aria-label="Search" aria-describedby="search-addon" />
                                <input style="border: none; border-radius: 0 8px 8px 0; margin-left: 0.25em" type="submit" value="Tìm kiếm">
                            </div>
                        </form>
                    </c:if>
                    <c:if test="${requestScope.normalUsers ne null}">
                        <form id="formNormal" action="./manageNomalUser" method="POST">
                            <div class="input-group rounded" style="width: 30em">
                                <input id="inputNormal" name="keyNormal" type="search" class="form-control rounded" placeholder="Tìm kiếm theo tên" aria-label="Search" aria-describedby="search-addon" />
                                <input style="border: none; border-radius: 0 8px 8px 0; margin-left: 0.25em" type="submit" value="Tìm kiếm">
                            </div>
                        </form>
                    </c:if>
                    <c:if test="${requestScope.premiumUsers ne null}">
                        <form id="formPremium" action="./managePremiumUser" method="POST">
                            <div class="input-group rounded" style="width: 30em">
                                <input id="inputPremium" name="keyPremium" type="search" class="form-control rounded" placeholder="Tìm kiếm theo tên" aria-label="Search" aria-describedby="search-addon" />
                                <input style="border: none; border-radius: 0 8px 8px 0; margin-left: 0.25em" type="submit" value="Tìm kiếm">
                            </div>
                        </form>
                    </c:if>
<!--                    <script>
                        const inputTotal = document.getElementById('inputTotal');
                        const formTotal = document.getElementById('formTotal');

                        inputTotal.addEventListener('input', () => {
                            formTotal.submit();
                        });
                        
                        const inputNormal = document.getElementById('inputNormal');
                        const formNormal = document.getElementById('formNormal');

                        inputNormal.addEventListener('input', () => {
                            formNormal.submit();
                        });
                        
                        const inputPremium = document.getElementById('inputPremium');
                        const formPremium = document.getElementById('formPremium');

                        inputPremium.addEventListener('input', () => {
                            formPremium.submit();
                        });

                    </script>-->
                </div>
            </div>
            <div class="container" style="margin-top: 1em;">
                <div class="table-container" style="overflow: auto; height: 70vh; border-radius: 10px;">
                    <table>
                        <thead>
                            <tr>
                                <th>STT</th>
                                <th>Họ và tên</th>
                                <th>Ngày sinh</th>
                                <th>Giới tính</th>
                                <th>Họ tên phụ huynh</th>
                                <th>Email phụ huynh</th>
                                <th>Số điện thoại</th>
                                <th>Username</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${requestScope.totalUsers ne null}">
                                <% int stt = 0;%>
                                <c:forEach items="${requestScope.totalUsers}" var="tu">
                                    <%stt++;%>
                                    <tr>
                                        <td><%=stt%></td>
                                        <td>${tu.full_name}</td>
                                        <td>${tu.dob}</td>
                                        <c:if test="${tu.gender eq true}">
                                            <td>Nam</td>
                                        </c:if>
                                        <c:if test="${tu.gender eq false}">
                                            <td>Nữ</td>
                                        </c:if>
                                        <td>${tu.parent_name}</td>
                                        <td>${tu.parent_email}</td>
                                        <td>${tu.parent_phone_number}</td>
                                        <td>${tu.username}</td>
                                    </tr>
                                </c:forEach>   
                            </c:if>
                            <c:if test="${requestScope.premiumUsers ne null}">
                                <% int stt1 = 0;%>
                                <c:forEach items="${requestScope.premiumUsers}" var="pu">
                                    <%stt1++;%>
                                    <tr>
                                        <td><%=stt1%></td>
                                        <td>${pu.full_name}</td>
                                        <td>${pu.dob}</td>
                                        <c:if test="${pu.gender eq true}">
                                            <td>Nam</td>
                                        </c:if>
                                        <c:if test="${pu.gender eq false}">
                                            <td>Nữ</td>
                                        </c:if>
                                        <td>${pu.parent_name}</td>
                                        <td>${pu.parent_email}</td>
                                        <td>${pu.parent_phone_number}</td>
                                        <td>${pu.username}</td>
                                    </tr>
                                </c:forEach>   
                            </c:if>
                            <c:if test="${requestScope.normalUsers ne null}">
                                <% int stt2 = 0;%>
                                <c:forEach items="${requestScope.normalUsers}" var="nu">
                                    <%stt2++;%>
                                    <tr>
                                        <td><%=stt2%></td>
                                        <td>${nu.full_name}</td>
                                        <td>${nu.dob}</td>
                                        <c:if test="${nu.gender eq true}">
                                            <td>Nam</td>
                                        </c:if>
                                        <c:if test="${nu.gender eq false}">
                                            <td>Nữ</td>
                                        </c:if>
                                        <td>${nu.parent_name}</td>
                                        <td>${nu.parent_email}</td>
                                        <td>${nu.parent_phone_number}</td>
                                        <td>${nu.username}</td>
                                    </tr>
                                </c:forEach>   
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>

</html>