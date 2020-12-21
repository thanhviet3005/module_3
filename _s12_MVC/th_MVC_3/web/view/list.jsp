<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/20/2020
  Time: 5:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List customer</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
<h1>List customer</h1>
<a href="/customer?action=create" class="btn bg-primary">Add new customer</a>

    <form action="/customer?action=search" method="post">
        <h3>Search by Id</h3>
        <input type="text" name="id">
        <input type="submit" value="Search" class="btn bg-secondary">
    </form>

<table class="table">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Email</th>
        <th>Address</th>
        <th>Action</th>
    </tr>
    <c:forEach var="customer" items="${customerList}">
        <tr>
            <td><c:out value="${customer.getId()}"/></td>
            <td><c:out value="${customer.getName()}"/></td>
            <td><c:out value="${customer.getEmail()}"/></td>
            <td><c:out value="${customer.getAddress()}"/></td>
            <td>
                <a href="/customer?action=edit&id=${customer.getId()}" class="btn bg-warning">Edit
                </a>
                <a href="/customer?action=delete&id=${customer.getId()}" class="btn bg-danger" >Delete
                </a>
            </td>
        </tr>
    </c:forEach>

</table>

</div>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
