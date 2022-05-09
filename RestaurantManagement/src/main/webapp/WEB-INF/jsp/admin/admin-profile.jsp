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
<c:url value="/admin/profile/edit" var="action"/>
<h1 class="text-center">Thông tin quản trị viên</h1>
<div class="container">
    <form:form method="post" action="${action}" modelAttribute="admin"  enctype="multipart/form-data">
        <div class="form-group">
            <label>Mã nhân viên</label>
            <form:input path="id" cssClass="form-control" type="text" value="${admin.id}" readonly="true"/>
        </div>
        <div class="form-group">
            <label>Họ và đệm</label>
            <form:input path="userLastName" id="userLastName" value="${admin.userLastName}" cssClass="form-control" type="text" />
            <form:errors path="userLastName" cssClass="alert alert-danger" element="div" />
        </div>
        <div class="form-group">
            <label>Tên</label>
            <form:input path="userFirstName" id="userFirstName" value="${admin.userFirstName}" cssClass="form-control" type="text" />
            <form:errors path="userFirstName" cssClass="alert alert-danger" element="div" />
        </div>
        <div class="form-group">
            <label>Giới tính</label>
            <form:select path="userSex" id="userSex" cssClass="form-control" type="combobox">
                <c:if test="${admin.userSex == true}">
                    <form:option value="1">Nam</form:option>
                    <form:option value="0">Nữ</form:option>
                </c:if>
                <c:if test="${admin.userSex == false}">
                    <form:option value="1">Nam</form:option>
                    <form:option value="0">Nữ</form:option>
                </c:if>
            </form:select>
        </div>
        <div class="form-group">
            <label>Số điện thoại</label>
            <form:input path="userPhoneNumber" id="userPhoneNumber" value="${admin.userPhoneNumber}" cssClass="form-control" type="text" />
            <form:errors path="userPhoneNumber" cssClass="alert alert-danger" element="div" />
        </div>
        <div class="form-group">
            <label>Số CCCD/CMND</label>
            <form:input path="userIdCard" id="userIdCard" value="${admin.userIdCard}" cssClass="form-control" type="text" />
            <form:errors path="userIdCard" cssClass="alert alert-danger" element="div" />
        </div>
        <div class="form-group">
            <label>Ngày sinh</label>
            <form:input path="dob" id="dob" type="date" cssClass="form-control"/>
            <form:errors path="dob" cssClass="alert alert-danger" element="div" />
        </div>
        <div class="form-group">
            <label>Địa chỉ</label>
            <form:input path="userAddress" id="userAddress" value="${admin.userAddress}" cssClass="form-control" type="text" />
            <form:errors path="userAddress" cssClass="alert alert-danger" element="div" />
        </div>
         <div class="form-group">
            <label>Email</label>
            <form:input path="userEmail" id="userEmail" value="${admin.userEmail}" cssClass="form-control" type="text" />
            <form:errors path="userEmail" cssClass="alert alert-danger" element="div" />
        </div>
        <div class="form-group">
            <label>Trạng thái hoạt động</label>
            <form:select path="userIsActive" id="userIsActive" cssClass="form-control" type="combobox">
                <c:if test="${admin.userIsActive == true}">
                    <form:option value="1">Đang hoạt động</form:option>
                    <form:option value="0">Ngưng hoạt động</form:option>
                </c:if>
                <c:if test="${admin.userIsActive == false}">
                    <form:option value="1">Đang hoạt động</form:option>
                    <form:option value="0">Ngưng hoạt động</form:option>
                </c:if>
            </form:select>
        </div>
        <div class="form-group">
            <label>Ảnh đại diện</label>
            <form:input path="file" id="file" cssClass="form-control" type="file" />
        </div>
        <div class="form-group">
            <label>Ngày tham gia </label>
            <form:input path="jd" cssClass="form-control" type="date" value="${admin.jd}" readonly="true"/>
        </div>
        <div class="form-group">
             <label>Tài khoản </label>
             <form:input path="userUsename" cssClass="form-control" type="text" value="${admin.userUsename}" readonly="true"/>
        </div>
        <div class="form-group">
            <label>Mật khẩu</label>
            <form:input path="userPassword" cssClass="form-control" type="text" value="${admin.userPassword}" readonly="true"/>
        </div>
        <div class="form-group">
            <label>Loại tài khoản</label>
            <form:input path="userRole" cssClass="form-control" type="text" value="${admin.userRole}" readonly="true"/>
        </div>
        <div class="form-group">
            <input type="submit" value="Cập nhật thông tin" class="btn btn-success">
        </div>
    </form:form>
</div>