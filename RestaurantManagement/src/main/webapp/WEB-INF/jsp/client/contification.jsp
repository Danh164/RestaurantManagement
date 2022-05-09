<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="<c:url value="/resources/css/client/contification.css" />" rel="stylesheet"/>

<h1 class="text-center" style="margin: 30px 0 50px 0; color: #8d7a4a">THÔNG BÁO</h1>
<div class="main-conti">
    <div class="row">
        <div class="col-lg-5" style="padding-right: 0">
            <div ><input id="text-search" type="text" placeholder="Tìm kiếm ..." onkeyup="searchFeedback(this)"></div>
            <div id="list-username" class="list-username" >
               
            </div>
        </div>
        <div class="col-lg-7" style="padding-left: 0">
            <div id="header-detail">
                <img id="img-detail"/> 
                <span id="name-detail"></span>
            </div>
            <div id="list-feedback">
                <div id="flag-detail" style="text-align: center;margin-top: 40%;color: #848484;">
                    <i>Nhà hàng tiệc cưới Thành Văn</i>
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
            document.getElementById("header-nav").style.marginTop = "-30px"
        } else {
            document.getElementById("header-nav").style.position = "initial";
            document.getElementById("header-nav").style.marginTop = "0px"
        }
    }
</script>