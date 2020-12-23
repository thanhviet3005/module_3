<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/21/2020
  Time: 5:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Update user information</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1>Update user information</h1>
    <div class="col-6">
        <form action="/user?action=edit" method="post">
            <div class="form-group">
                <label>Id</label>
                <input type="text" name="id" value="${user.getId()}" class="form-control">
            </div>
            <div class="form-group">
                <label>Name</label>
                <input type="text" name="name" value="${user.getName()}" class="form-control">
            </div>
            <div class="form-group">
                <label>Age</label>
                <input type="text" name="age" value="${user.getAge()}" class="form-control">
            </div>
            <div class="form-group">
                <label>Gender</label>
                <input type="text" name="gender" value="${user.getGender()}" class="form-control">
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="text" name="email" value="${user.getEmail()}" class="form-control">
            </div>
            <div class="form-group">
                <label>Country</label>
                <input type="text" name="country" value="${user.getCountry()}" class="form-control">
            </div>
            <div>
                <input type="submit" value="Update" class="btn bg-primary">
            </div>
        </form>
    </div>
</div>



<%--__+__+__+__+__+__+__+__+__+__+__+__+__--%>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
