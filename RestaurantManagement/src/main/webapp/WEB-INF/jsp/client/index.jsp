<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<c:url value="/resources/css/client/home.css" />" rel="stylesheet"/>
<script src="<c:url value="/resources/js/client/home.js" />" ></script>

<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


<div id="demo" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ul class="carousel-indicators">
        <li data-target="#demo" data-slide-to="0" class="active"></li>
        <li data-target="#demo" data-slide-to="1"></li>
        <li data-target="#demo" data-slide-to="2"></li>
    </ul>

    <!-- The slideshow -->
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="<c:url value="/resources/images/lobby5.jpg" /> " alt="Thành Văn"  width="1100" height="500">
        </div>
        <div class="carousel-item">
            <img src="<c:url value="/resources/images/lobby1.jpg" /> " alt="Thành Văn"  width="1100" height="500">
        </div>
        <div class="carousel-item">
            <img src="<c:url value="/resources/images/lobby3.jpg" /> " alt="Thành Văn"  width="1100" height="500">
        </div>
    </div>

    <!-- Left and right controls -->
    <a class="carousel-control-prev" href="#demo" data-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </a>
    <a class="carousel-control-next" href="#demo" data-slide="next">
        <span class="carousel-control-next-icon"></span>
    </a>
</div>

<h1 class="text-h1">
    Lễ Cưới
</h1>
<div class="landing">
    <p>Tình yêu là đam mê, là khát khao, là cháy bỏng, nếu đã yêu nhau không thể tách rời thì hôn lễ sẽ dẫn lối đôi ta bên nhau trọn đời. </p><br>
    <p id="lobbyTV"><b style="color: #9c7a4a">Thành Văn</b> sẽ đồng hành cùng đôi bạn sẻ chia những khoảnh khắc hạnh phúc và lan tỏa cảm xúc tuyệt vời trong ngày trọng đại ấy đến tất cả mọi người với chương trình ưu đãi giảm giá lên đến 50%.</p>
</div>
<div>
    <h1 class="text-h1">Các Khu Vực Sảnh Tiệc Cưới</h1>
    <form action="">
        <div class="row">
            <div class="col-md-9">
                <input class="form-control" type="text" name="kw" placeholder="Tìm kiếm theo tên sảnh">
            </div>
            <div class="col-md-3">
                <input style="background-color: #9c7a4a;color: white;height: 38px;width: 116px; " type="submit" value="Tìm kiếm ">
            </div>
        </div>
    </form>
    <c:choose>  
        <c:when test="${numberPage >0}">
            <%! boolean flag = true;%>
            <c:forEach var="l" items="${lobbies}">
                <% if (flag) { %>
                <div class="row lobbies">
                    <div class="col-lg-6">
                        <img src="<c:url value="${l.lobImage}" /> " alt="${l.lobName}"><br><br><br>
                    </div>
                    <div class="col-lg-6">
                        <h2>${l.lobName}</h2>
                        <hr>
                        <p>${l.lobDescription}</p>
                        <div class="btn-ct">
                            <a href="lobby-detail?id=${l.id}" class="snip1582">Chi tiết</a>
                        </div>
                    </div>
                </div>
                <% flag = false; %>
                <% } else { %>
                <div class="row lobbies">
                    <div class="col-lg-6">
                        <h2>${l.lobName}</h2>
                        <hr>
                        <p>${l.lobDescription}</p>
                        <div class="btn-ct">
                            <a href="lobby-detail?id=${l.id}"class="snip1582">Chi tiết</a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <img src="<c:url value="${l.lobImage}" /> " alt="${l.lobName}"><br><br><br>
                    </div>
                </div>
                <% flag = true; %>
                <% }%>
            </c:forEach>
            <div style="display: flex">
                <ul class="pagination" style="margin: 30px auto">
                    <li class="page-item" style="cursor: pointer;"><a class="page-link" onclick="previous()" >Previous</a></li>
                        <%--   Phan trang     --%>
                        <c:forEach begin="1" end="${Math.ceil(numberPage/5)}" var="i">
                            <c:choose>
                                <c:when test="${kw==''}">
                                <li class="page-item"><a id="page${i}" class="page-link" href="<c:url value="" />?page=${i} ">${i}</a></li>
                                </c:when>
                                <c:otherwise>
                                <li class="page-item"><a id="page${i}" class="page-link" href="?kw=${kw}&page=${i}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>
                            <%--                <li class="page-item"><a class="page-link" href="<c:url value="" />?page=${i} ">${i}</a></li>--%>
                        </c:forEach>
                    <li class="page-item" style="cursor: pointer;"><a class="page-link" onclick="next(${Math.ceil(numberPage/5)})">Next</a></li>
                </ul>
            </div>
        </c:when>
        <c:otherwise>
            <div style="text-align: center;margin: 80px 0; color: #8f444b;font-size: 20px;"><i>Không có sảnh nào!!!</i></div>
        </c:otherwise>
    </c:choose>

</div>
<hr/>
<h4>MÓN ĂN</h4>
<hr style="border-width: 3px;
    background-color: #ff984e;
    width: 30%;
    margin-bottom: 30px;"/>
<div class="autoplay" style="height: 350px; margin-bottom: 50px;">
    <c:forEach var="l" items="${listDish}">
        <a class="dish" href="dish?id=${l.id}">
            <img style="width: 100%; height: 300px;" src="<c:url value="${l.dishImage}" /> " alt="Thành Văn">
            <div>${l.dishName}</div>
        </a>
    </c:forEach>
</div>
<script>
    $('.autoplay').slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 2000,
        prevArrow: '<div class="slick-prev"><i class="fa fa-chevron-circle-left" style="font-size:35px;" aria-hidden="true"></i></div>',
        nextArrow: '<div class="slick-next"><i class="fa fa-chevron-circle-right" style="font-size:35px;" aria-hidden="true"></i></div>'
    });
</script>
