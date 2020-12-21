<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/20/2020
  Time: 3:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer information</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h3>Customer information</h3><br>
    <div class="row col-6">

        <form>
            <div class="form-group">
                <label>Id</label>
<%--                <input value="${customer.getId()}" class="form-control">--%>
                <p class="form-control">${customer.getId()}</p>
            </div>
            <div class="form-group">
                <label>Name</label>
                <p class="form-control">${customer.getName()}</p>
            </div>
            <div class="form-group">
                <label>Email</label>
                <p class="form-control">${customer.getEmail()}</p>
            </div>
            <div class="form-group">
                <label>Address</label>
                <p class="form-control">${customer.getAddress()}</p>
            </div>
        </form>
    </div>
</div>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
