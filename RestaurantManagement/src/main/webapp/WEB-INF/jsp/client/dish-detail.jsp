<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<link href="<c:url value="/resources/css/client/dish-detail.css" />" rel="stylesheet"/>

<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


<div class="detail-header">
    <img src="<c:url value="/resources/images/dish-detail-header.jpg" /> " alt="Thành Văn">
</div>

<h2>CHI TIẾT MÓN ĂN</h2>
<h1 style="text-align: center;">Ẩm Thực Thành Văn</h1><br/><br/>
<p style="text-align: center">Hiểu được tầm quan trọng của ẩm thực các đầu bếp của 
    Thành Văn luôn học hỏi và trao dồi về những món ăn mới lạ mang hương sắc từ Á – Âu, 
    từ truyền thống đến hiện đại.</p><br/><br/>
<hr style="width: 100%; background-color: #ff984e; border-width: 2px;"/>
<h1 class="dish-name">${dish.dishName}</h1>
<div class="img">
    <img src="${dish.dishImage}"/>
</div>
<div class="dish-description">${dish.dishDescription}</div>
<h3>MÓN ĂN KHÁC</h3>
<hr/>
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
