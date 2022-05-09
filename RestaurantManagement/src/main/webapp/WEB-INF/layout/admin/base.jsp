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
        <title><tiles:insertAttribute name="title"/></title>
        <link rel="icon" type="image/x-icon" href="<c:url value="/resources/images/admin.png"/>" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="<c:url value="/resources/css/admin/sidebar.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/css/admin/button.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/css/admin/base.css" />">
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="wrapper">
            <!-- Sidebar -->
            <tiles:insertAttribute name="sidebar"/>
            <div id="content">
                <!-- header -->
                <tiles:insertAttribute name="header"/>
                <!-- Page Content -->
                <tiles:insertAttribute name="content"/>
            </div>
        </div>   
    </body>
    <script src="<c:url value="/resources/js/admin/feedback.js" />"></script>
    <script src="<c:url value="/resources/js/admin/stats.js"/>"></script>
    <script src="<c:url value="/resources/js/admin/sidebar.js" />"></script>
</html>
