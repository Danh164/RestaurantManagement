
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<link href="<c:url value="/resources/css/client/menu.css" />" rel="stylesheet"/>
<script src="<c:url value="/resources/js/client/menu.js" />" ></script>
<div class="detail-header">
    <img src="<c:url value="/resources/images/menu-header.jpg" /> " alt="Thành Văn">
</div>
<h2>THỰC ĐƠN</h2>
<h1 style="text-align: center;">Ẩm Thực Thành Văn</h1><br/><br/>
<div style="text-align: center">
    <p>Nếu không gian tiệc cưới sang trọng, đẳng cấp gây ấn tượng đầu tiên cho khách mời thì hương vị, cách bày trí món ăn lại đem đến thành công quyết định cho một buổi tiệc hoàn hảo</p>
</div><br/><br/>
<hr style="border-width: 2px; width: 100%">
<div>
    <label style="font-size: 19px;">Sắp xếp: </label>
    <input checked="checked"  name="gender" type="radio" id="input-def" onclick="setArrange(0)" /> Mặc định
    <input name="gender" type="radio" id="input-asc" onclick="setArrange(1)" /> Tăng dần
    <input name="gender" type="radio" id="input-desc" onclick="setArrange(-1)" /> Giảm dần
</div>
<div id="items">
    <c:forEach var="m" items="${listMenu}">
        <div id="item">
            <h4 class="menu-name">${m.menuName}</h4>
            <div class="menu-price">Giá: <fmt:formatNumber value = "${m.menuPrice}" type = "currency"/></div>
            <div class="row" style="margin-bottom: 30px; margin-left: -40px;">
                <div class="col-lg-7">
                    <img style="width: 100%; height: 400px;" src="${m.menuImage}" alt="Thành Văn"/>
                </div>

                <div class="col-lg-5">
                    <div class="menu-dish">
                        <c:forEach var="d" items="${listDish}">
                            <c:if test="${d[1].id == m.id}">
                                <a href="dish?id=${d[0].id}" class="row dish" style="margin-bottom: 10px;">
                                    <div class="col-lg-6">
                                        <img style="width: 100%; height: 100px;" src="${d[0].dishImage}" alt="Thành Văn"/>
                                    </div>
                                    <div class="col-lg-6">
                                        <p class="dish-name">${d[0].dishName}</p>   
                                    </div>
                                </a>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div><br/><br/><br/><br/>
