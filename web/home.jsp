<%--
  Created by IntelliJ IDEA.
  User: fatih
  Date: 13.11.2019
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Inventory Tracker</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

<jsp:include page="header.jsp" >
    <jsp:param name="pageName" value="locations" />
</jsp:include>
<div class="container" style="height: 100%; margin-left: 0px; width: 180px;">
    <jsp:include page="navbar.jsp" >
        <jsp:param name="pageName" value="locations" />
    </jsp:include>
</div>

</body>
</html>
