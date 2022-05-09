<%--
  Created by IntelliJ IDEA.
  User: Wall D
  Date: 4/22/2022
  Time: 8:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<section class="home">
    <h1 class="text-center">QUẢN LÍ SẢNH CƯỚI</h1>
    <div>
        <form action="">
            <div class="box">
                <i class="fa fa-search" aria-hidden="true"></i>
                <input class="form-control" type="text" name="kw" placeholder="Nhập tên cần tìm...."/>
            </div>
        </form>
        <div>
            <a href="<c:url value="/admin/lobby/add" />"><input class="button button-edit" type="button" value="Thêm sảnh cưới"/></a>
        </div>
        <table class="content-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên sảnh cưới</th>
                    <th>Địa chỉ</th>
                    <th>Giá</th>
                    <th>Số bàn</th>
                    <th>Trạng thái</th>
                    <!--            <th>Mô tả</th>
                                <th>Ảnh</th>-->
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="l" items="${lobbies}">
                    <c:set value="black" var="color"/>
                    <c:if test="${l.lobIsActive == false}">
                        <c:set value="red" var="color"/>
                    </c:if>
                    <tr>
                        <td style="color: ${color}">${l.id}</td>
                        <td style="color: ${color}">${l.lobName}</td>
                        <td style="color: ${color}">${l.lobAddress}</td>
                        <td style="color: ${color}"><fmt:formatNumber value = "${l.lobPrice}" type = "number"/> VND</td>
                        <td style="color: ${color}">${l.lobTotalTable}</td>
                        <c:if test="${l.lobIsActive == true}">
                            <td style="color: ${color}">Còn hoạt động</td>
                        </c:if>
                        <c:if test="${l.lobIsActive == false}">
                            <td style="color: ${color}">Ngưng hoạt động</td>
                        </c:if>
        <!--                <td>${l.lobImage}</td>
                        <td>${l.lobDescription}</td>-->
                        <td><a href="<c:url value="/admin/lobby/edit?id=${l.id}"/>"><input class="button button-edit" type="button" value="Sửa"/></a></td>
                        <td><a href="<c:url value="/admin/lobby/delete?id=${l.id}"/>"><input class="button button-delete" onclick="confirmForm(event)" type="button" value="Xoá"/></a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</section>
<script>
    function confirmForm(e) {
        if (!confirm("Xác nhận xoá?"))
            e.preventDefault();
    }
</script>