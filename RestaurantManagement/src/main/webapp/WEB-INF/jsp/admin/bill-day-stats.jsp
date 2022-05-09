<%--
  Created by IntelliJ IDEA.
  User: Wall D
  Date: 4/24/2022
  Time: 1:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h1 class="title">THỐNG KÊ DOANH THU THEO NGÀY</h1>
<div class="container">
    <div>
        <form action="">
            <label>Từ ngày</label>
            <input type="date" name="fromDate">
            <label>Đến ngày</label>
            <input type="date" name="toDate">
            <input type="submit" class="btn btn-danger"  value="Thống kê">
        </form>
        <div>
            <canvas id="myBillChart"></canvas>
        </div>
        <table class="content-table">
            <thead>
            <tr>
                <th>Ngày tạo</th>
                <th>Tổng tiền</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="b" items="${billStats}">
                <tr>
                    <td>${b[0]}</td>
                    <td><fmt:formatNumber value = "${b[1]}" type = "number"/> VND</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script>
    let billLabels=[], billInfo=[];
    <c:forEach items="${billStats}" var="b">
        billLabels.push('${b[0]}')
        billInfo.push(${b[1]})
    </c:forEach>
    window.onload = function (){
        billDateStats("myBillChart", billLabels, billInfo)
    }
</script>