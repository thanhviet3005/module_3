<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/21/2020
  Time: 11:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User information</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class="container">
    <h1>User information</h1>
    <div class="col-4">
        <form>
            <div class="form-group">
                <label>Id</label>
                <input type="text" name="id" placeholder="${user.getId()}" class="form-control">
            </div>
            <div class="form-group">
                <label>Name</label>
                <input type="text" name="name" placeholder="${user.getName()}" class="form-control" >
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="text" name="email" placeholder="${user.getEmail()}" class="form-control" >
            </div>
            <div class="form-group">
                <label>Country</label>
                <input type="text" name="country" placeholder="${user.getCountry()}" class="form-control" >
            </div>
            <div>
                <a href="/user" class="btn bg-secondary">Back to user list</a>
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
