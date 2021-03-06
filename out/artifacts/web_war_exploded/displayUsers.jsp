<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Users - Inventory Tracker</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <style>
        #myInput {
            background-position: 10px 10px;
            background-repeat: no-repeat;
            width: 100%;
            font-size: 16px;
            padding: 12px 20px 12px 40px;
            border: 1px solid #ddd;
            margin-bottom: 12px;
        }
    </style>

</head>
<body>
<jsp:include page="header.jsp" >
    <jsp:param name="pageName" value="displayUsers" />
</jsp:include>
<c:out value="${requestScope.get('isAdmin')}"/>

<div class="container">
    <div class="head">
        <jsp:include page="navbar.jsp">
            <jsp:param name="pageName" value="displayUsers"/>
        </jsp:include>
    </div>

    <div class="container" style="position: absolute; left: 150px;">
        <div >
            <div class="modal fade" id="addUserModal" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Modal Header</h4>
                        </div>
                        <div class="modal-body">
                            <form action="addUser" method="post" class="form-inline" >
                                <label class=mr-sm-2">Name</label>
                                <input type="text" class="form-control validate" name="firstName"><br>

                                <label class=mr-sm-2">LastName</label>
                                <input type="text" class="form-control validate" name="lastName"><br>

                                <label class=mr-sm-2">Username</label>
                                <input type="text" class="form-control validate" name="username"><br>

                                <label class=mr-sm-2">Phone Number</label>
                                <input type="text" class="form-control validate" name="phone"><br>

                                <label class="mr-sm-2">Email address:</label>
                                <input type="email" class="form-control validate" name="email"><br>

                                <label class="mr-sm-2">Password:</label>
                                <input type="password" class="form-control validate" name="password"><br>

                                <label class="mr-sm-2">IsAdmin</label>
                                <select name="item">
                                    <option value="false">false</option>
                                    <option value="true">true</option>
                                </select>

                                <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">
                                <table id="myTable" class ="table table-stripped">
                                    <thead>
                                    <tr>
                                        <th scope="col">Name</th>
                                        <th scope="col">Quantity</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach items="${requestScope.productList}" var="item" varStatus="count">
                                        <tr class="product">

                                            <td><input id="cb${count.index}" name="pname${count.index}" type="checkbox" value="${item.get("name")}" onchange="valueChanged(${count.index})"> ${item.get("name")} </td>
                                            <td><input id="q${count.index}" name="quantity${count.index}" type="text" value="0" style="visibility:hidden"></td>
                                        </tr>
                                    </c:forEach>

                                    <script>

                                        function valueChanged(a) {
                                            let cb = document.getElementById("q"+a);
                                            if(cb.style.visibility == "hidden")
                                                cb.style.visibility = "visible";
                                            else
                                                cb.style.visibility = "hidden";
                                        }

                                        function myFunction() {
                                            var input, filter, table, tr, td, i, txtValue;
                                            input = document.getElementById("myInput");
                                            filter = input.value.toUpperCase();
                                            table = document.getElementById("myTable");
                                            tr = table.getElementsByTagName("tr");
                                            for (i = 0; i < tr.length; i++) {
                                                td = tr[i].getElementsByTagName("td")[0];
                                                if (td) {
                                                    txtValue = td.textContent || td.innerText;
                                                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                                        tr[i].style.display = "";
                                                    } else {
                                                        tr[i].style.display = "none";
                                                    }
                                                }
                                            }
                                        }

                                    </script>
                                    </tbody>
                                </table>
                                <!--<div class="form-check mb-2 mr-sm-2">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox"> Remember me
                                    </label>
                                </div> -->
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary mb-2">Submit</button>
                                </div>

                            </form>

                        </div>

                    </div>

                </div>
            </div>

        </div>
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">First Name</th>
                <th scope="col">Last Name</th>
                <th scope="col">Phone Number</th>
                <th scope="col">E-Mail</th>
                <th scope="col">Product Count</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.userList}" var="item" varStatus="count">
                <tr>
                <td>${item.firstname}</td>
                <td>${item.lastname}</td>
                <td>${item.phoneNumber}</td>
                <td>${item.email}</td>
                <td>
                    <c:forEach items="${item.userProduct}" var="users">
                        <c:out value="${users}"/><br>
                    </c:forEach>
                </td>
                <td>
                    <button type="button" data-toggle="modal" data-target="#edit-user${count.index}" style="width: 78px !important" class="btn btn-primary" >Edit</button>
                    <button type="button" data-toggle="modal" data-target="#delete-user${count.index}" style="width: 78px !important" class="btn btn-danger">Delete</button>
                </td>
                </tr>
            <div>
                <div class="modal fade" id="edit-user${count.index}" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Modal Header</h4>
                            </div>
                            <div class="modal-body">
                                <form action="displayUsers" method="post">
                                    <input value="${count.index}" name="editId" hidden>
                                    <input value="${item.id}" type="hidden" name="id" size="32" readonly class="form-control validate">
                                    First Name: <input value="${item.firstname}"  type="text" name="name" size="32" class="form-control validate" contenteditable="true"><br>
                                    Last Name: <input  value="${item.lastname}" type="text" name="lastname" size="32" class="form-control validate"><br>
                                    Phone Number: <input value="${item.phoneNumber}" type="text" name="phone" size="32" class="form-control validate"><br>
                                    E-Mail: <input  value="${item.email}" type="text" name="email" size="32" class="form-control validate"><br>
                                    <c:forEach items="${item.userProduct}" var="uProd" varStatus="cnt">
                                        <input hidden value="${uProd.key}" name="prodKey${cnt}">
                                        ${uProd.key} : <input  value="${uProd.value}" type="number" name="prodVal${cnt.index}" size="32" class="form-control validate"><br>
                                    </c:forEach>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <input type="submit" value="Save changes" class="btn btn-primary">
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div>
                <div class="modal fade" id="delete-user${count.index}" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Delete User</h4>
                            </div>
                            <div class="modal-body">
                                <h3>Are you sure?</h3>
                            </div>
                            <form action="displayUsers" method="post">
                                <input value="${item.id}" type="hidden" name="deletedId" size="32" readonly class="form-control validate">
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Dismiss</button>
                                    <input type="submit" value="Delete" class="btn btn-primary"></input>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
            </tbody>
        </table>
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#addUserModal">Add User</button>
    </div>
</div>
</body>
</html>



