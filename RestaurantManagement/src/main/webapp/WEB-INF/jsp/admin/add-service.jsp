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
<h1 class="title">Thêm Mới Dịch Vụ</h1>
<div class="container">
    <%--@elvariable id="service" type="service"--%>
    <c:url value="/admin/service/add" var="action" />
    <form:form method="post" action="${action}" modelAttribute="service"  enctype="multipart/form-data">
        <div class="form-group">
            <label>Tên dịch vụ</label>
            <form:input path="serName" id="serName" cssClass="form-control" type="text" />
            <form:errors path="serName" cssClass="alert alert-danger" element="div"/>
            <c:if test="${errMsg != null}">
                <div class="arlet alert-danger">${errMsg}</div>
            </c:if>
        </div>
        <div class="form-group">
            <label>Giá</label>
            <form:input path="serPrice" id="serPrice" cssClass="form-control" type="text" />
            <form:errors path="serPrice" cssClass="alert alert-danger" element="div"/>
        </div>
        <div class="form-group">
            <label>Mô tả</label>
            <form:textarea path="serDescription" id="serDescription" cssClass="form-control" type="text" />
            <form:errors path="serDescription" cssClass="alert alert-danger" element="div"/>
        </div>
        <div class="form-group">
            <label>Ảnh dịch vụ</label>
            <form:input path="file" id="file" cssClass="form-control" type="file" />
        </div>
        <div class="form-group">
            <input type="submit" value="Thêm dịch vụ" class="btn btn-success">
        </div>
    </form:form>
</div>