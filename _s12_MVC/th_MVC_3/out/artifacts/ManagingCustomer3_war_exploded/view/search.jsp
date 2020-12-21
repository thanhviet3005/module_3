<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/20/2020
  Time: 6:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Customer information</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class="container">
    <h1>Customer information</h1>
    <div class="col-6">
        <div class="form-group">
            <form>
                <div class="form-group">
                    <label>Id</label>
                    <p class="form-control"> ${customer.getId()}</p>
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
                    <label>Id</label>
                    <p class="form-control">${customer.getAddress()}</p>
                </div>
                <div>
                    <a href="/customer" class="btn bg-primary">Back to customer list</a>
                </div>
            </form>

        </div>
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
