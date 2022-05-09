<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div style="height: 364px;width: 50%; margin: 0 auto">
    <h1 class="text-center" style="margin: 30px 0 30px 0; color: #8d7a4a">ĐĂNG NHẬP</h1>

    <c:url value="/sign-in" var="action" />
    <c:if test="${param.error != null}">
        <div class="alert alert-danger">Tên tài khoản hoặc mật khẩu sai!</div>
    </c:if>
    <form method="post" action="${action}">
        <div class="form-group">
            <label for="userUsename">Tên tài khoản:</label>
            <input type="text" id="userUsename" name="userUsename"  class="form-control" />
        </div>
        <div class="form-group">
            <label for="userPassword">Mật khẩu:</label>
            <input type="password" id="userPassword" name="userPassword" class="form-control" />
        </div>
        <div class="form-group" style="text-align: center; margin: 20xp 0 20px 0">
            <button class="btn btn-success" style="width: 40%;">Đăng nhập</button>
        </div>
    </form>
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