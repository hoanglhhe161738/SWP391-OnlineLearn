<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Module</title>
    <link rel="stylesheet" href="../Assets/css/Style.css">
    <link rel="stylesheet" href="../Assets/css/course.css">
    <link rel="icon" href="../Assets/icon/favicon.png"/>
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
    <style>
        button.btn-close {
            color: white;
            background-color: white;
            border-color: #dc3545;
        }
        .modal{
            text-align: justify;
        }
    </style>
</head>

<body>
    <div class="main">
        <!--nav bar-->
        <jsp:include page="../custom/nav.jsp"></jsp:include>
            <!--content-->
            <div class="content">
                <div class="container main-content">
                    <div class="row">
                        <div>
                            <div class="col-m-12 item-course">                       
                                <h1>${requestScope.module.module_name}</h1>                  
                            <div class="col-m-12">
                                <div class="process-module" style="margin: 2rem">
                                    <div class="progress-bar-bg" style="margin-left: -2em;">
                                        <div class="progress-bar-custom" style="width:${requestScope.percent}%;">
                                            <p>${requestScope.percent}%</p>
                                        </div>	
                                    </div>
                                </div>
                            </div>          
                        </div>
                    </div>
                    <div>
                        <div class="lesson-items " style="margin-left: 0">
                            <c:forEach items="${requestScope.lessons}" var="l">
                                <div class="lesson-item" style="line-height: 1.6em;">
                                    <c:forEach items="${sessionScope.Lesson_learns}" var="lls">
                                        <c:if test="${(lls.lesson_id eq l.lesson_id) and (lls.llearn eq true)}">
                                            <img src="../Assets/icon/icon (74).png" height="30px" width="30px">
                                        </c:if>
                                    </c:forEach>
                                    <c:forEach items="${sessionScope.Lesson_learns}" var="lls">
                                        <c:if test="${(lls.lesson_id eq l.lesson_id) and (lls.llearn eq false)}">
                                            <img src="../Assets/icon/icon (75).png" height="30px" width="30px">
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${requestScope.lesson_idIn1st eq null}">
                                        <a href="./lessonChoice?lesson_id=${l.lesson_id}" style="padding: 1em;"
                                           data-bs-toggle="modal" data-bs-target="#exampleModal">
                                            ${l.lesson_name}
                                        </a>  
                                    </c:if>
                                    <c:if test="${requestScope.lesson_idIn1st ne null}">
                                        <a href="./lessonChoice?lesson_id=${l.lesson_id}" style="padding: 1em;"
                                           <c:forEach items="${sessionScope.Lesson_learns}" var="llss">
                                               <c:if test="${(llss.lesson_id eq l.lesson_id) and (llss.llearn eq true)}">
                                                   data-bs-toggle="modal" data-bs-target="#exampleModal2"
                                               </c:if>
                                           </c:forEach>
                                           >
                                            ${l.lesson_name}
                                        </a>  
                                    </c:if>

                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="background: red; color: white">
                    <h5 class="modal-title" id="exampleModalLabel" style="align-items: center">
                        <i class="fa-sharp fa-solid fa-bell"></i> Thông báo từ hệ thống                            </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="min-height: 200px">
                    <div style="font-size: 20px;">Không thể truy cập khi chưa đăng kí học phần,
                        bạn nên trở lại trang trước để đăng kí học phần để có thể truy cập phần này</div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="background: #008aff; color: white">
                    <h5 class="modal-title" id="exampleModalLabel" style="align-items: center">
                        <i class="fa-sharp fa-solid fa-bell"></i> Thông báo từ hệ thống                            </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="min-height: 200px">
                    <div style="font-size: 20px;">Bạn đã học xong học phần này. 
                        Sau khi học xong sẽ không thể truy cập lại học phần nữa</div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>