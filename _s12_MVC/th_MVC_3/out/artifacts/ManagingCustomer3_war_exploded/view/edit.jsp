<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/20/2020
  Time: 6:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edit customer information</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="col-6">
        <div class="form-group">
            <form action="/customer?action=edit" method="post">
                <div class="form-group">
                    <label>Id</label>
                    <input type="text" name="id" value="${customer.getId()}" class="form-control">
                </div>
                <div class="form-group">
                    <label>Name</label>
                    <input type="text"name="name" value="${customer.getName()}" class="form-control">
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <input type="text"name="email" value="${customer.getEmail()}" class="form-control">
                </div>
                <div class="form-group">
                    <label>Id</label>
                    <input type="text"name="address" value="${customer.getAddress()}" class="form-control">
                </div>
                <div>
                    <input type="submit" value="Edit" class="btn bg-secondary">
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
