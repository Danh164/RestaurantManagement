<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link href="<c:url value="/resources/css/client/sign-up.css" />" rel="stylesheet"/>
<script src="<c:url value="/resources/js/client/sign-up.js" />" ></script>

<h1 class="text-center" style="margin: 30px 0 30px 0; color: #8d7a4a">ĐĂNG KÝ</h1>

<c:url value="/sign-up" var="action" />
<div class="container">
    <c:if test="${messErr != null}">
        <div class="alert alert-danger">${messErr}</div>
    </c:if>
    <form:form method="post" action="${action}" modelAttribute="user" enctype="multipart/form-data">
        <div class="form-group">
            <label for="userLastName">Họ và  đệm:</label>
            <form:input type="text" id="userLastName" path="userLastName" class="form-control" />
            <form:errors path="userLastName" cssClass="text-danger" />
        </div>
        <div class="form-group">
            <label for="userFirstName">Tên:</label>
            <form:input type="text" id="userFirstName" path="userFirstName" class="form-control" />
            <form:errors path="userFirstName" cssClass="text-danger" />
        </div>
        <div class="form-group">
            <label for="file">Ảnh đại diện:</label>
            <form:input type="file" id="file" path="file" class="form-control" />
            <form:errors path="file" cssClass="text-danger" />
            <c:if test="${errFile != null}">
                <div class=" text-danger">${errFile}</div>
            </c:if>
        </div>
        <div class="form-group">
            <label for="userIdCard">Số CMND/CCCD:</label>
            <form:input type="text" id="userIdCard" path="userIdCard" class="form-control" />
            <form:errors path="userIdCard" cssClass="text-danger" />
        </div>
        <div class="form-group">
            <label for="userPhoneNumber">Số điện thoại:</label>
            <form:input type="text" id="userPhoneNumber" path="userPhoneNumber" class="form-control" />
            <form:errors path="userPhoneNumber" cssClass="text-danger" />
        </div>
        <div class="form-group">
            <label for="userEmail">Email:</label>
            <form:input type="email" id="userEmail" path="userEmail" class="form-control" />
        </div>
        <div class="row">
            <div class="form-group col-lg-4">
                <label for="sex">Tỉnh/thành:</label>
                <form:select  path="userCity" id="city" cssClass="input" onclick="setDistricts()">
                </form:select>    
            </div>
            <div class="form-group col-lg-4">
                <label for="sex">Huyện/Quận:</label>
                <form:select  path="userDistrict" id="district" cssClass="input">
                </form:select>    
            </div>
            <div class="form-group col-lg-4">
                <div class="row">
                    <label for="userCommune" class="col-lg-4">Xã/phường:</label>
                    <form:input type="text" id="userCommune" cssClass="input" path="userCommune" class="form-control col-lg-7" />
                </div>
            </div>
            <form:errors path="userCommune" cssClass="text-danger" cssStyle="margin-left: 15px; margin-top: -20px"/>
        </div>
        <div class="form-group">
            <label for="sex">Giới tính:</label> 
            <form:select  path="userSex" cssStyle="width: 100%; padding:5px;">
                <form:option value = "1" label = "Nam" />
                <form:option value = "0" label = "Nữ" />
            </form:select>    
            <form:errors path="userSex" cssClass="text-danger" />
        </div>
        <div class="form-group">
            <label for="dob">Ngày sinh:</label>
            <form:input type="date" id="dob" path="dob" class="form-control" />
            <form:errors path="dob" cssClass="text-danger" />
        </div>
        <div class="form-group">
            <label for="userUsename">Tên tài khoản:</label>
            <form:input type="text" id="userUsename" path="userUsename" class="form-control" />
            <form:errors path="userUsename" cssClass="text-danger" />
        </div>
        <div class="form-group">
            <label for="userPassword">Mật khẩu:</label>
            <form:input type="password" id="userPassword" path="userPassword" class="form-control" />
            <form:errors path="userPassword" cssClass="text-danger" />
        </div>
        <div class="form-group">
            <label for="confirmPassword">Mật khẩu:</label>
            <form:input type="password" id="confirmPassword" path="confirmPassword" class="form-control" />
            <form:errors path="confirmPassword" cssClass="text-danger" />
        </div>
        <div class="form-group" style="text-align: end; margin: 20xp 0 20px 0">
            <form:button class="btn btn-success" >Đăng ký</form:button>
        </div>
    </form:form>
</div>