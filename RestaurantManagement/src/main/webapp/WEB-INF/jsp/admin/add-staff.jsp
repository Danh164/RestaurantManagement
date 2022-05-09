<%--
  Created by IntelliJ IDEA.
  User: Wall D
  Date: 4/24/2022
  Time: 1:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2 class="text-center text-danger">Thêm Mới Nhân Viên</h2>
<div class="container">
    <%--@elvariable id="staff" type="user"--%>
    <form:form method="post" action="" modelAttribute="staff"  enctype="multipart/form-data">
        <div class="form-group">
            <label>Họ và đệm</label>
            <form:input path="userLastName" id="userLastName" cssClass="form-control" type="text" />
            <form:errors path="userLastName" cssClass="alert alert-danger" element="div" />
        </div>
        <div class="form-group">
            <label>Tên</label>
            <form:input path="userFirstName" id="userFirstName" cssClass="form-control" type="text" />
            <form:errors path="userFirstName" cssClass="alert alert-danger" element="div" />
        </div>
        <div class="form-group">
            <label>Giới tính</label>
            <form:select path="userSex" id="userSex" cssClass="form-control" type="combobox">
                <form:option value="1">Nam</form:option>
                <form:option value="0">Nữ</form:option>
            </form:select>
        </div>
        <div class="form-group">
            <label>Số điện thoại</label>
            <form:input path="userPhoneNumber" id="userPhoneNumber" cssClass="form-control" type="text" />
            <form:errors path="userPhoneNumber" cssClass="alert alert-danger" element="div" />
        </div>
        <div class="form-group">
            <label>Số CCCD/CMND</label>
            <form:input path="userIdCard" id="userIdCard" cssClass="form-control" type="text" />
            <form:errors path="userIdCard" cssClass="alert alert-danger" element="div" />
            <c:if test="${errMsg != null}">
                <div class="alert alert-danger">${errMsg}</div>
            </c:if>
        </div>
        <div class="form-group">
            <label>Địa chỉ</label>
            <form:input path="userAddress" id="userAddress" cssClass="form-control" type="text" />
            <form:errors path="userAddress" cssClass="alert alert-danger" element="div" />
        </div>

        <div class="form-group">
            <label>Ngày sinh</label>
            <form:input path="dob" id="dob" type="date" cssClass="form-control"/>
            <form:errors path="dob" cssClass="alert alert-danger" element="div" />
        </div>
        <div class="form-group">
            <label>Ảnh đại diện</label>
            <form:input path="file" id="file" cssClass="form-control" type="file" />
        </div>
        <div class="form-group">
            <input type="submit" value="Thêm nhân viên" class="btn btn-success">
        </div>
    </form:form>
</div>