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
<c:url value="/admin/lobby/edit" var="action"/>

<h1 class="title">Cập Nhật Thông Tin Sảnh Cưới</h1>
<div class="container">
    <form:form method="post" action="${action}" modelAttribute="lobby"  enctype="multipart/form-data">
        <label>Mã sảnh cưới</label>
        <form:input value="${lobby.id}" path="id" id="id" cssClass="form-control" type="text" readonly="true"/>
        <div class="form-group">
            <label>Tên sảnh cưới</label>
            <form:input path="lobName" id="lobName" cssClass="form-control" type="text" />
            <form:errors path="lobName" cssClass="alert alert-danger" element="div"/>
            <c:if test="${errMsg != null}">
                <div class="arlet alert-danger">${errMsg}</div>
            </c:if>
        </div>
        <div class="form-group">
            <label>Địa chỉ</label>
            <form:input path="lobAddress" id="lobAddress" cssClass="form-control" type="text" />
            <form:errors path="lobAddress" cssClass="alert alert-danger" element="div"/>
        </div>
        <div class="form-group">
            <label>Giá</label>
            <form:input path="lobPrice" id="lobPrice" cssClass="form-control" type="text" />
            <form:errors path="lobPrice" cssClass="alert alert-danger" element="div"/>
        </div>
        <div class="form-group">
            <label>Số bàn</label>
            <form:input path="lobTotalTable" id="lobTotalTable" cssClass="form-control" type="text" />
            <form:errors path="lobTotalTable" cssClass="alert alert-danger" element="div"/>
        </div>
        <div class="form-group">
            <label>Mô tả</label>
            <form:textarea path="lobDescription" id="lobDescription" cssClass="form-control" type="text" />
            <form:errors path="lobDescription" cssClass="alert alert-danger" element="div"/>
        </div>
        <div class="form-group">
            <label>Trạng Thái</label>
            <form:select path="lobIsActive" id="lobIsActive" cssClass="form-control" type="combobox">
                <c:if test="${lobby.lobIsActive == true}">
                    <form:option value="1">Đang hoạt động</form:option>
                    <form:option value="0">Ngưng hoạt động</form:option>
                </c:if>
                <c:if test="${lobby.lobIsActive == false}">
                    <form:option value="1">Đang hoạt động</form:option>
                    <form:option value="0">Ngưng hoạt động</form:option>
                </c:if>
            </form:select>
        </div>
        <div class="form-group">
            <label>Ảnh sảnh cưới</label>
            <form:input path="file" id="file" cssClass="form-control" type="file" />
        </div>
        <div class="form-group">
            <input type="submit" value="Cập nhật sảnh cưới" class="btn btn-success">
        </div>
    </form:form>
</div>