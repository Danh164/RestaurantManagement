
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<link href="<c:url value="/resources/css/client/lobby-detail.css" />" rel="stylesheet"/>
<script src="<c:url value="/resources/js/client/coefficient.js" />" ></script>
<script src="<c:url value="/resources/js/client/comment.js" />" ></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>


<div class="detail-header">
    <img src="<c:url value="https://riversidepalace.vn/multidata/_mg_9983.jpg" /> " alt="">
</div>
<h2>SẢNH TIỆC CƯỚI</h2>


<c:choose>
    <c:when test="${detail != null }">
        <h1 class="lobby-name">${detail.lobName}</h1>
        <hr/>
        <p class="text-des">&emsp;&emsp;${detail.lobDescription}</p><br/><br/>
        <div class="row" >
            <div class="col-lg-6">
                <img style="height: 350px" src="<c:url value="${detail.lobImage}" /> " alt="${detail.lobName}">
                <div>
                    <button class="snip1547" onclick="openNav()"><span>Xem thêm</span></button>
                </div>
            </div>
            <div class="col-lg-6" style="padding-left: 35px">
                <h3 style="text-align: center">Bảng giá</h3>
                <table border="1" >
                    <tr>
                        <th style="width: 100px;"></th>
                        <th colspan="1" style="background-color: lightblue">Ngày thường</th>
                        <th colspan="1" style="background-color: lightblue">Chủ nhật</th>
                    </tr>
                    <tr>
                        <td>Sáng</td>
                        <c:forEach var="c" items="${listCoeff}">
                            <c:if test ="${c.coefTypeDate.equals('ngày thường') && c.coefTypeLesson.equals('sáng')}">
                                <fmt:setLocale value = "en_US"/>
                                <td><fmt:formatNumber value = "${c.coefValue * detail.lobPrice}" type = "currency"/>/buổi</td>
                            </c:if>
                            <c:if test ="${c.coefTypeDate.equals('cuối tuần') && c.coefTypeLesson.equals('sáng')}">
                                <fmt:setLocale value = "en_US"/>
                                <td><fmt:formatNumber value = "${c.coefValue * detail.lobPrice}" type = "currency"/>/buổi</td>
                            </c:if>
                        </c:forEach>
                    </tr>
                    <tr>
                        <td>Trưa</td>
                        <c:forEach var="c" items="${listCoeff}">
                            <c:if test ="${c.coefTypeDate.equals('ngày thường') && c.coefTypeLesson.equals('trưa')}">
                                <fmt:setLocale value = "en_US"/>
                                <td><fmt:formatNumber value = "${c.coefValue * detail.lobPrice}" type = "currency"/>/buổi</td>
                            </c:if>
                            <c:if test ="${c.coefTypeDate.equals('cuối tuần') && c.coefTypeLesson.equals('trưa')}">
                                <fmt:setLocale value = "en_US"/>
                                <td><fmt:formatNumber value = "${c.coefValue * detail.lobPrice}" type = "currency"/>/buổi</td>
                            </c:if>
                        </c:forEach>
                    </tr>
                    <tr>
                        <td>Tối</td>
                        <c:forEach var="c" items="${listCoeff}">
                            <c:if test ="${c.coefTypeDate.equals('ngày thường') && c.coefTypeLesson.equals('tối')}">
                                <fmt:setLocale value = "en_US"/>
                                <td><fmt:formatNumber value = "${c.coefValue * detail.lobPrice}" type = "currency"/>/buổi</td>
                            </c:if>
                            <c:if test ="${c.coefTypeDate.equals('cuối tuần') && c.coefTypeLesson.equals('tối')}">
                                <fmt:setLocale value = "en_US"/>
                                <td><fmt:formatNumber value = "${c.coefValue * detail.lobPrice}" type = "currency"/>/buổi</td>
                            </c:if>
                        </c:forEach>
                    </tr>
                </table>
                <p style="margin:20px 0 10px 0"><b style="color: #c47135">Diện tích&emsp;&emsp; :</b> 1000 m<sup>2</sup></p>
                <p style="margin:0 0 10px 0"><b style="color: #c47135">Số bàn tối đa :</b> ${detail.lobTotalTable} bàn</p>
                <p style="margin:0 0 0 0"><b style="color: #c47135">Địa chỉ&emsp;&emsp;&emsp; :</b> ${detail.lobAddress}</p>
            </div>
        </div>
        <div id="more" class="overlay">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <div class="overlay-content">

                <!--update-->

                <div class="slideshow-container">
                    <div class="mySlides fade" style="opacity: 1">
                        <img src="${detail.lobImage}" style="width:700px; height: 450px">
                    </div>
                    <c:forEach var="i" items="${listImage}">
                        <div class="mySlides fade" style="opacity: 1">
                            <img src="${i.image}" style="width:700px; height: 450px">
                        </div>
                    </c:forEach>

                    <a class="prev" onclick="plusSlides(-1)" style="color: white">❮</a>
                    <a class="next" onclick="plusSlides(1)" style="color: white">❯</a>

                </div>
                <div style="text-align:center">
                    <span class="dot" onclick="currentSlide(1)" style="opacity: 1"></span> 
                    <c:forEach var="i"  begin='2' end='${listImage.size()+1}'>
                        <span class="dot" onclick="currentSlide(${i})" style="opacity: 1"></span> 
                    </c:forEach>
                </div>


                <!--update-->

            </div>
        </div>
        <hr style="width:100%; background-color: #ddd; border-width: 1px">
        <div class="promotion">
            <p><b>*** [KHUYẾN MÃI HOT]: ƯU ĐÃI 50% DÀNH CHO 10 CẶP ĐÔI ĐẦU TIÊN TRẢI NGHIỆM</b> chương trình Cưới theo cách bạn yêu. </p>
            <p style="margin-top:-10px"><b>***[NHÂN ĐÔI ƯU ĐÃI KHI TỔ CHỨC ĐÁM CƯỚI ĐỘC NHẤT TẠI <span style="color:#c47135">THÀNH VĂN</span>]</b>
                Tại Thành Văn <b>BAO NHIÊU BÀN TIỆC BẤY NHIÊU TIỀN</b> 
                không phát sinh thêm chi phí. Chỉ cần đặt tiệc tại Thành Văn bạn sẽ nhận ngay các <b>ƯU ĐÃI</b> sau:</p>
            <ul>
                <li>Giảm giá trực tiếp <b>10% giá trị tiệc</b></li>
                <li><b>Tặng thức uống</b> (bia, nước ngọt, nước suối) suốt tiệc</li>
                <li>Tặng trọn gói <b>Nghi thức lễ và Trang trí tiêu chuẩn</b> trị giá 38.000.000đ</li>
                <li>Tặng <b>01 đến 02 bàn tiệc</b></li>
                <li>Tặng toàn bộ <b>chi phí phục vụ</b> trong tiệc</li>
                <li>Tặng <b>màn hình led</b> xuyên suốt tiệc và <b>bộ thiệp cưới</b></li>
                <li><b>Tặng quà</b> cho cô dâu - chú rể và <b>xố số may mắn</b> cho khách mời</li>
                <li><b>‎Giảm 100.000đ/bàn</b> cho lần đặt tiếp theo và nhiều ưu đãi cưới khác</li>
                <li><b>Giữ nguyên giá tiệc và khuyến mãi</b> cho đến ngày tiệc ngay khi đặt cọc</li>
            </ul>
        </div>
        <!--comment-->
        <div id="username" style="display: none">${pageContext.request.userPrincipal.name}</div>
        <h3>ĐÁNH GIÁ</h3>
        <hr/>
        <div style="width: 70%">
            <div id="comment">

            </div><br/>
            <div id="avg-stars" style="border: 1px solid #b0b0b0;font-size: 20px; font-weight: bold;padding: 10px">
                <p style="">Đánh giá ${detail.lobName}</p>
                <span id="avg-star-lob" style="color: #fe8b23; font-weight: bold; font-size: 20px; margin: 0 10px;">0.0</span>
                <span id="avg-star-icon">
                </span>
                <span id="total-cmt" style="font-weight: 300; margin-left: 5px">0 đánh giá</span>
                <div id="star-detail" style="font-size: 15px;margin-left: 10px; margin-top: 10px">
                    
                </div>
            </div>
            <div id="list-comment" style="border: 1px solid #b0b0b0; padding: 20px">

            </div>
        </div><br/><br/>
        <!--comment-->
        <h3>SẢNH KHÁC</h3>
        <hr/>
        <div class="lobby-more">
            <div class="row">
                <c:forEach var="l" items="${lobbies}">
                    <div class="col-md-4">
                        <a href="lobby-detail?id=${l.id}" class="more-lob">
                            <div class="card">
                                <img class="card-img-top" style="height: 250px" src="${l.lobImage}" alt="${l.lobName}">
                                <div class="card-body">
                                    <h5 style="color: #e58946">${l.lobName}</h5>
                                    <p class="card-text">${l.lobDescription.substring(0, 110)}...</p>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <div style="text-align: center;margin: 80px 0; color: #8f444b;font-size: 20px;"><i>Sảnh không tồn tại hoặc đã xóa!!!</i></div>
    </c:otherwise>
</c:choose>

<!--update-->
<script>
    let slideIndex = 1;
    showSlides(slideIndex);

    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    function currentSlide(n) {
        showSlides(slideIndex = n);
    }

    function showSlides(n) {
        let i;
        let slides = document.getElementsByClassName("mySlides");
        let dots = document.getElementsByClassName("dot");
        if (n > slides.length) {
            slideIndex = 1
        }
        if (n < 1) {
            slideIndex = slides.length
        }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex - 1].style.display = "block";
        dots[slideIndex - 1].className += " active";
    }
</script>