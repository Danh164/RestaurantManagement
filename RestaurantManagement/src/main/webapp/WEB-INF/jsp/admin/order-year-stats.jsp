<%--
  Created by IntelliJ IDEA.
  User: Wall D
  Date: 4/24/2022
  Time: 1:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1 class="title">THỐNG KÊ MẬT ĐỘ ĐẶT TIỆC THEO NĂM</h1>
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
        <div class="row">
            <div class="col-md-8">
                <canvas id="myOrderYearChart"></canvas>
            </div>
            <div class="col-md-4">
                <table class="content-table">
                    <thead>
                        <tr>
                            <th>Năm</th>
                            <th>Tổng số tiệc</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="o" items="${orderYearStats}">
                            <tr>
                                <td>${o[0]}</td>
                                <td>${o[1]}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script>
    let labels = [], info = [];
    <c:forEach items="${orderYearStats}" var="o">
        labels.push('${o[0]}')
        info.push(${o[1]})
    </c:forEach>
        window.onload = function () {
            billYearChart("myOrderYearChart", labels, info)
        }
</script>