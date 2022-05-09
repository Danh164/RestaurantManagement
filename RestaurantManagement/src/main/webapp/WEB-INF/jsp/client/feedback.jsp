<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link href="<c:url value="/resources/css/client/feedback.css" />" rel="stylesheet"/>
<script src="<c:url value="/resources/js/client/feedback.js" />" ></script>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<div class="detail-header">
    <img src="<c:url value="/resources/images/feedback-header.jpg" /> " alt="Thành Văn">
</div>
<h2>LIÊN HỆ</h2>
<hr>

<p style=" margin-bottom: 0"><span style="color: #8d7a4a;font-weight: bold;">Địa chỉ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&emsp; :</span> 371 Nguyễn Kiệm, phường 3, Gò Vấp, Hồ Chí Minh</p>
<p style=" margin-bottom: 0"><span style="color: #8d7a4a;font-weight: bold;">Fanpage &nbsp;&nbsp;&nbsp;&nbsp;&ensp;&ensp; :</span> https://www.facebook.com/nhahangthanhvan</p>
<p><span style="color: #8d7a4a;font-weight: bold;">Số điện thoại :</span> 0789 449 550</p>

<div class="row" style="margin-bottom: 90px">
    <div class="col-lg-6">
        <div>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.930998327024!2d106.6764274143173!3d10.816592561409921!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317528e1f241211f%3A0xc9ef195798144b1f!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBN4bufIFRQLkhDTSAoT1UpIC0gQ8ahIHPhu58gTmd1eeG7hW4gS2nhu4dt!5e0!3m2!1svi!2s!4v1651374524010!5m2!1svi!2s" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div> 
    </div>
    <div class="col-lg-6">
        <p style="color: #8d7a4a"><i class="fa fa-share" aria-hidden="true"></i> Góp ý hoặc phản hồi từ bạn:</p>
        <textarea id="content" class="form-control" rows="9" width="100%" placeholder="Nội dung ..."></textarea>  
        <div class="captcha">
            <div id="captcha-text"></div>
            <div class="btn-captcha">
                <input id="text-captcha" onkeyup="checkCaptcha(this, event)" type="text" placeholder="Nhập mã"/> 
                <span id="err-captcha" style="display: none"> <i class="fa fa-exclamation-triangle" aria-hidden="true" style="color: red"></i></span>
                <span id="pass-captcha" style="display: none"><i class="fa fa-check" aria-hidden="true" style="color: green"></i></span>
                <div disabled>
                    <button id="btn-send" type="button" onclick="sendFeedback()">Gửi</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    //ghi dè bass
    window.onscroll = function () {
        var winScroll = document.body.scrollTop || document.documentElement.scrollTop;
        var height = document.documentElement.clientHeight - document.body.clientHeight;

        var scrolled = (winScroll / height) * 100;
        document.getElementById("myBar").style.width = scrolled + "%";
        if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
            document.getElementById("header-nav").style.position = "fixed"
            document.getElementById("header-nav").style.zIndex = "10000"
            document.getElementById("header-nav").style.width = "100%"
            document.getElementById("header-nav").style.marginTop = "-10px"
        } else {
            document.getElementById("header-nav").style.position = "initial";
            document.getElementById("header-nav").style.marginTop = "0px"
        }
    }
</script>
