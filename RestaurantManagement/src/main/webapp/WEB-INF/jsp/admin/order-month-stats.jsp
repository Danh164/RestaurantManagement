<%--
  Created by IntelliJ IDEA.
  User: Wall D
  Date: 4/24/2022
  Time: 1:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1 class="title">THỐNG KÊ MẬT ĐỘ ĐẶT TIỆC THEO THÁNG</h1>
<h4 class="text-center text-success">
    <c:choose>
        <c:when test="${toYear == 0 && fromYear == 0}">
            Mật độ từ trước đến nay
        </c:when>
        <c:when test="${fromYear == toYear && fromYear != 0}">
            Trong năm ${fromYear}
        </c:when>
        <c:when test="${fromYear < toYear && fromYear != 0 && toYear != 0}">
            Từ năm ${fromYear} đến năm ${toYear}
        </c:when>
        <c:when test="${fromYear == 0 && toYear != 0}">
            Từ lúc kinh doanh đến năm ${toYear}
        </c:when>
        <c:when test="${toYear == 0 && fromYear != 0}">
            Từ năm ${fromYear} đến nay
        </c:when>
        <c:when test="${fromYear > toYear && fromYear != 0 && toYear != 0}">
            Từ năm ${fromYear} đến năm ${toYear}
            <h5 class="text-center text-warning">Khoảng thời gian chưa hợp lệ!!!</h5>
        </c:when>
    </c:choose>
</h4>
<div class="container">
    <div>
        <form action="">
            <label>Từ năm</label>
            <select name="fromYear">
                <option value="0"></option>
                <c:forEach var="y" items="${years}">
                    <option value="${y}">${y}</option>
                </c:forEach>
            </select>
            <label>Đến năm</label>
            <select name="toYear">
                <option value="0"></option>
                <c:forEach var="y" items="${years}">
                    <option value="${y}">${y}</option>
                </c:forEach>
            </select>
            <input type="submit" class="btn btn-danger"  value="Thống kê">
        </form>
        <div>
            <canvas id="myOrderMonthChart"></canvas>
        </div>
        <table class="content-table">
            <thead>
                <tr>
                    <th>Tháng</th>
                    <th>Tổng số tiệc</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="o" items="${orderMonthStats}">
                    <tr>
                        <td>${o[0]}/${o[1]}</td>
                        <td>${o[2]}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script>
    let Labels = [], Infos = [];
    <c:forEach items="${orderMonthStats}" var="o">
        Labels.push('${o[0]}/${o[1]}')
        Infos.push(${o[2]})
    </c:forEach>
        window.onload = function () {
            billMonthChart("myOrderMonthChart", Labels, Infos)
        }
</script>