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
                font-size: 5em;
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
                        <a href="">
                            <div class="element-part" style="background: red">
                                <i class="custom-icon fa-solid fa-database"></i><br>
                                <h3 class="element-title">Tổng số người dùng</h3>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="">
                            <div class="element-part" style="background: #0081e2">
                                <i class="custom-icon fa-solid fa-circle"></i>
                                <h3 class="element-title">Người dùng thường</h3>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="">
                            <div class="element-part" style="background: #00ed7a">
                                <i class="custom-icon fa-sharp fa-solid fa-gem"></i>
                                <h3 class="element-title">Người dùng premium</h3>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="container" style="display: flex; justify-content: start; margin-top: 1em;">
                <div class="row">
                    <div class="input-group rounded" style="width: 30em">
                        <input type="search" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" />
                        <span class="input-group-text border-0" id="search-addon">
                            <i class="fas fa-search"></i>
                        </span>
                    </div>
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
                            <% int stt = 0;%>
                        <c:forEach items="${requestScope.users}" var="u">
                            <%stt++;%>
                            <tr>
                                <td><%=stt%></td>
                                <td>${u.full_name}</td>
                                <td>${u.dob}</td>
                                <c:if test="${u.gender eq true}">
                                    <td>Nam</td>
                                </c:if>
                                <c:if test="${u.gender eq false}">
                                    <td>Nữ</td>
                                </c:if>
                                <td>${u.parent_name}</td>
                                <td>${u.parent_email}</td>
                                <td>${u.parent_phone_number}</td>
                                <td>${u.username}</td>
                            </tr>
                        </c:forEach>    
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>

</html>