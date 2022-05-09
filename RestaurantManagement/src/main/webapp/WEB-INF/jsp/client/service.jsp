<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<link href="<c:url value="/resources/css/client/service.css" />" rel="stylesheet"/>

<script src="<c:url value="/resources/js/client/service.js" />" ></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>



<div class="detail-header">
    <img src="<c:url value="/resources/images/service-header.jpg" /> " alt="Thành Văn">
</div>
<h2>DỊCH VỤ</h2>
<h3 style="margin-bottom: 30px;">TRANG TRÍ TIỆC CƯỚI ĐẸP TẠI THÀNH VĂN</h3><hr/>
<div style="font-size: 17px; color: #646464; margin-bottom: 50px">Các cặp đôi luôn chia sẻ với chúng tôi về điều mà họ thích nhất tại THÀNH VĂN,
    chính là gu thẩm mĩ tinh tế, thanh lịch. Với thế mạnh sẵn có và mong muốn tất cả các sự kiện 
    diễn ra tại THÀNH VĂN đều được chăm chút đến từng chi tiết, chúng tôi cho ra đời các 
    gói trang trí Tiệc Cưới Đẹp. Đúng với tên gọi, các khách hàng sử dụng dịch vụ tổ chức tiệc 
    cưới của THÀNH VĂN sẽ luôn được chúng tôi chuẩn bị công phu cho một phong cách hoàn 
    hảo nhất theo ý thích của cô dâu và chú rể. Chương trình Tiệc Cưới Đẹp bao gồm trang trí 
    từ cổng hoa, bàn lễ tân, hoa bàn tiệc, hoa lối lên sân khấu. Lãng mạn, nhẹ nhàng, sang 
    trọng và ấm cúng là những gì khách mời có thể cảm nhận được trong không gian lễ cưới của 
    bạn tại THÀNH VĂN.
</div>
<hr style="width: 100%; border-width: 2px; background-color: #fff "/>
<div id="service-show">
    <c:forEach var="l" items="${listService}">
        <h4 class="">${l.serName}</h4>
        <hr/>
        <div class="row">
            <div class="col-md-8">
                <img style="width: 100%; height: 400px;" src="<c:url value="${l.serImage}" /> " alt="Thành Văn">
            </div>
            <div class="col-md-4 text-des">
                <div style="font-size: 25px; color: #e58946; margin-bottom: 20px;">GIÁ: 
                    <fmt:formatNumber value = "${l.serPrice}" type = "currency"/></div>
                <div>${l.serDescription}</div>
            </div>
        </div><br/>
        <hr style="width: 100%; border-width: 2px; background-color: #fff "/>
    </c:forEach>
</div>
<h4 id="flag-scroll">THƯ VIỆN</h4><hr/>
<div class="row1">
    <div class="column">
        <img src="https://riversidepalace.vn/newsmultidata/1-752.jpg" style="width:100%; height: 200px" onclick="openModal();currentSlide(1)" class="hover-shadow cursor">
    </div>
    <div class="column">
        <img src="https://riversidepalace.vn/newsmultidata/qpt03903rr_2.jpg" style="width:100%; height: 200px" onclick="openModal();currentSlide(2)" class="hover-shadow cursor">
    </div>
    <div class="column">
        <img src="https://tdgcenter.vn/wp-content/uploads/2019/09/thoi-diem-to-chuc-tiec-cuoi-tot-nhat-la-khi-nao-1.jpg" style="width:100%; height: 200px" onclick="openModal();currentSlide(3)" class="hover-shadow cursor">
    </div>
    <div class="column">
        <img src="https://huongpho.com.vn/wp-content/uploads/2018/06/P_H-1535.jpg" style="width:100%; height: 200px" onclick="openModal();currentSlide(4)" class="hover-shadow cursor">
    </div>
</div>

<div id="myModal" class="modal">
    <span class="close cursor" onclick="closeModal()">&times;</span>
    <div class="modal-content" style="display: block">

        <div class="mySlides">
            <div class="numbertext">1 / 4</div>
            <img src="https://riversidepalace.vn/newsmultidata/1-752.jpg" style="width:100%; height: 700px">
        </div>

        <div class="mySlides">
            <div class="numbertext">2 / 4</div>
            <img src="https://riversidepalace.vn/newsmultidata/qpt03903rr_2.jpg" style="width:100%; height: 700px">
        </div>

        <div class="mySlides">
            <div class="numbertext">3 / 4</div>
            <img src="https://tdgcenter.vn/wp-content/uploads/2019/09/thoi-diem-to-chuc-tiec-cuoi-tot-nhat-la-khi-nao-1.jpg" style="width:100%; height: 700px">
        </div>

        <div class="mySlides">
            <div class="numbertext">4 / 4</div>
            <img src="https://huongpho.com.vn/wp-content/uploads/2018/06/P_H-1535.jpg" style="width:100%; height: 700px">
        </div>

        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>

        <div class="caption-container">
            <p id="caption"></p>
        </div>


        <div class="column">
            <img class="demo cursor" src="https://riversidepalace.vn/newsmultidata/1-752.jpg" style="width:100%; height: 200px" onclick="currentSlide(1)" alt="Nhà hàng tiệc cưới THÀNH VĂN">
        </div>
        <div class="column">
            <img class="demo cursor" src="https://riversidepalace.vn/newsmultidata/qpt03903rr_2.jpg" style="width:100%; height: 200px" onclick="currentSlide(2)" alt="Nhà hàng tiệc cưới THÀNH VĂN">
        </div>
        <div class="column">
            <img class="demo cursor" src="https://tdgcenter.vn/wp-content/uploads/2019/09/thoi-diem-to-chuc-tiec-cuoi-tot-nhat-la-khi-nao-1.jpg" style="width:100%; height: 200px" onclick="currentSlide(3)" alt="Nhà hàng tiệc cưới THÀNH VĂN">
        </div>
        <div class="column">
            <img class="demo cursor" src="https://huongpho.com.vn/wp-content/uploads/2018/06/P_H-1535.jpg" style="width:100%; height: 200px" onclick="currentSlide(4)" alt="Nhà hàng tiệc cưới THÀNH VĂN">
        </div>
    </div>
</div><br/><br/><br/><br/>
<h4>MÓN ĂN</h4><hr/>
<div class="autoplay" style="height: 350px; margin-bottom: 50px;">
    <c:forEach var="l" items="${listDish}">
        <a class="dish" href="dish?id=${l.id}">
            <img style="width: 100%; height: 300px;" src="<c:url value="${l.dishImage}" /> " alt="Thành Văn">
            <div>${l.dishName}</div>
        </a>
    </c:forEach>
</div>
<script>
    function openModal() {
        document.getElementById("myModal").style.display = "block";
    }

    function closeModal() {
        document.getElementById("myModal").style.display = "none";
    }

    var slideIndex = 1;
    showSlides(slideIndex);

    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    function currentSlide(n) {
        showSlides(slideIndex = n);
    }

    function showSlides(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("demo");
        var captionText = document.getElementById("caption");
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
        captionText.innerHTML = dots[slideIndex - 1].alt;
    }


    $('.autoplay').slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 2000,
        prevArrow: '<div class="slick-prev"><i class="fa fa-chevron-circle-left" style="font-size:35px;" aria-hidden="true"></i></div>',
        nextArrow: '<div class="slick-next"><i class="fa fa-chevron-circle-right" style="font-size:35px;" aria-hidden="true"></i></div>'
    });
</script>