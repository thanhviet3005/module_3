<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/21/2020
  Time: 12:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List User</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<h1>List user in database</h1>
<a href="/user?action=create" class="btn bg-primary">Add new user</a>

    <h3>Search by Id</h3>
    <div class="col-4">
        <form action="/user?action=find" method="post">
            <div class="form-group">
                <input type="text" name="id" class="form-control">
                <input type="submit" value="Search" class="btn bg-secondary">
            </div>
        </form>
    </div>

<table class="table">
    <tr>
        <td>Id</td>
        <td>Name</td>
        <td>Email</td>
        <td>Country</td>
        <td>Action</td>
    </tr>
    <c:forEach var="user" items="${userList}">
        <tr>
            <td><c:out value="${user.getId()}"/></td>
            <td><c:out value="${user.getName()}"/></td>
            <td><c:out value="${user.getEmail()}"/></td>
            <td><c:out value="${user.getCountry()}"/></td>
            <td>
                <a href="/user?action=edit&id=${user.getId()}" class="btn bg-warning">Edit</a>
                <a href="/user?action=delete&id=${user.getId()}" class="btn bg-danger">Delete</a>
            </td>
        </tr>
    </c:forEach>


</table>




<%--__+__+__+__+__+__+__+__+__+__+__+__+__--%>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
