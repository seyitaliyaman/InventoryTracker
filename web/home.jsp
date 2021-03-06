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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</head>
<body>

<jsp:include page="header.jsp" >
    <jsp:param name="home" value="locations" />
</jsp:include>
<c:out value="${requestScope.get('isAdmin')}"/>
<div>
    <div class="container" >
        <jsp:include page="navbar.jsp" >
            <jsp:param name="pageName" value="locations" />
        </jsp:include>
    </div>
    <div style="margin-left: 175px">
        <c:out value="${requestScope.get('error')}"/>
    </div>
    <div class="container" style="margin-left: 160px;">

        <div class="row" style="margin-top: 10px">

            <div class="col-md-6" style="width:50%">

                <div class="card-body" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                border-radius: 5px; padding: 10px; background-color: #EEEEEE;">
                    <h2 class="card-title">Number of Defined Users</h2>
                    <h1 style="font-size: 70px; text-align: right">${requestScope.userCount}</h1>
                    <a href="displayUsers" class="btn btn-primary">See Users</a>
                </div>
            </div>

            <div class="col-md-6" style="width:50%; ">

                <div class="card-body" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                border-radius: 5px; padding: 10px; background-color: #F5F5F5;">
                    <h2 class="card-title">Number of Defined Products</h2>
                    <h1 style="font-size: 70px; text-align: right">${requestScope.productCount}</h1>
                    <a href="displayProducts" class="btn btn-primary">See Products</a>
                </div>
            </div>

        </div>
        <div>

            <div class="card-body" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                border-radius: 5px; padding: 10px; margin-top: 15px; background-color: #ECEFF1">
                <h2 class="card-title">Number of Daily Visit</h2>
                <h1 style="font-size: 70px; text-align: right">${requestScope.visit}</h1>

            </div>

        </div>
    </div>
</div>
</body>
</html>