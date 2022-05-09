<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="<c:url value="/resources/css/client/contification.css" />" rel="stylesheet"/>

<!--<h2 class="text-center" style="margin-bottom: 5px; color: #8d7a4a">Phản Hồi Của Khách Hàng</h2>-->
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

