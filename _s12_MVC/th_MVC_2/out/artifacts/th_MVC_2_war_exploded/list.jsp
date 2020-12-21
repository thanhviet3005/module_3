<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/19/2020
  Time: 5:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List customer</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

</head>
<body>
<div class="container">
<h1>List customer</h1>
    <a href="/customer?action=create" class="btn btn-primary">Add new customer</a>

    <div class="form-group">
        <form action="/customer?action=search" method="post">
            <label>Find by Id</label>
            <input type="text" name="id" class="text-input bg-light">
            <input type="submit" value="Search">
        </form>
    </div>

<table class="table" >
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Email</th>
        <th>Address</th>
        <th>Action</th>
    </tr>
    <c:forEach var="customer" items="${listCustomer}">
        <tr>
            <td><c:out value="${customer.getId()}"/></td>
            <td><c:out value="${customer.getName()}"/></td>
            <td><c:out value="${customer.getEmail()}"/></td>
            <td><c:out value="${customer.getAddress()}"/></td>
            <td>
                <a href="/customer?action=edit&id=${customer.getId()}" class="btn bg-warning">
                    Edit
                </a>
                <a href="/customer?action=delete&id=${customer.getId()}" class="btn bg-danger">
                    Delete
                </a>
<%--                <button type="button" class="btn bg-warning">Edit</button>--%>
<%--                <button type="button" class="btn bg-danger">Delete</button>--%>
            </td>
        </tr>
    </c:forEach>
</table>
</div>

<%-- +__+__+__+__+__+__+__+__--%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
