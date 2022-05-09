<%--
  Created by IntelliJ IDEA.
  User: Wall D
  Date: 4/21/2022
  Time: 10:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>
            <tiles:insertAttribute name="title"/>
        </title>
        <link rel="icon" type="image/x-icon" href="<c:url value="/resources/images/toast.png"/>" />
        <link href="<c:url value="/resources/css/client/base.css" />" rel="stylesheet"/>
        <link rel="stylesheet" href="<c:url value="/resources/css/client/table.css"/>"/>
        <script src="<c:url value="/resources/js/client/base.js" />" ></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
                integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>
    <!-- HEADER -->
    <tiles:insertAttribute name="header"/>
        <div class="container">
            <!-- CONTENT -->
            <tiles:insertAttribute name="content"/>
        </div>
        <tiles:insertAttribute name="content2"/>
    <!-- FOOTER -->
    <tiles:insertAttribute name="footer"/>
        <!-- back to top-->

    <div title="Back to top" id="back-to-top" onclick="topFunction()"><i class="fa fa-angle-double-up "></i></div>
    </body>
</html>
