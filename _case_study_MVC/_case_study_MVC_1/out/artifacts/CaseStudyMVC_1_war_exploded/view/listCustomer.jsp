<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/22/2020
  Time: 8:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List customer</title>
<%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">--%>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body>
<h1>List user in database</h1>
<a href="/customer?action=create" class="btn bg-secondary">Add new customer</a>

<table class="table">
    <tr>
        <td>Id</td>
        <td>Type Id</td>
        <td>Name</td>
        <td>Birthday</td>
        <td>Gender</td>
        <td>Id card</td>
        <td>Phone</td>
        <td>Email</td>
        <td>Address</td>
        <td>Action</td>
    </tr>
    <c:forEach var="customer" items="${customerList}">
        <tr>
            <td><c:out value="${customer.getId()}"/></td>
            <td><c:out value="${customer.getTypeId()}"/></td>
            <td><c:out value="${customer.getName()}"/></td>
            <td><c:out value="${customer.getBirthday()}"/></td>
            <td><c:out value="${customer.getGender()}"/></td>
            <td><c:out value="${customer.getIdCard()}"/></td>
            <td><c:out value="${customer.getPhone()}"/></td>
            <td><c:out value="${customer.getEmail()}"/></td>
            <td><c:out value="${customer.getAddress()}"/></td>

            <td>
                <a href="/customer?action=update&id=${customer.getId()}" class="btn bg-warning">Update</a>
                <a class="btn bg-danger">Delete</a>

<%--                <a href="/user?action=update&id=${user.getId()}" class="btn bg-warning">Update</a>--%>
<%--                <a href="/user?action=delete&id=${user.getId()}" class="btn bg-danger">Delete</a>--%>
            </td>
        </tr>
    </c:forEach>
</table>

<%-- Thu vien jQuery da nen phuc vu cho bootstrap.min.js--%>
<script src = "lib/jquery-3.5.1.min.js"></script>
<%-- Thu vien popper da nen phuc vu cho bootstrap.min.js--%>
<script src = "lib/popper.min.js"></script>
<%-- Thu vien popper da nen phuc vu cho bootstrap.min.js--%>
<script src = "js/bootstrap.min.js"></script>

<%--&lt;%&ndash;__+__+__+__+__+__+__+__+__+__+__+__+__&ndash;%&gt;--%>
<%--<!-- jQuery library -->--%>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>--%>
<%--<!-- Popper JS -->--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>--%>
<%--<!-- Latest compiled JavaScript -->--%>
<%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>--%>
</body>
</html>
