<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/24/2020
  Time: 2:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List employee</title>
<%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">--%>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body>
<h1>List employee in database</h1>
<a href="/employee?action=create" class="btn bg-secondary">Add new employee</a>
<h3>Search by Name</h3>
<div class="col-4">
    <form action="/employee?action=search" method="post">
        <div class="form-group">
            <input type="text" name="name" class="form-control">
            <input type="submit" value="Search" class="btn bg-secondary">
        </div>
    </form>
</div>
<table class="table">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Birthday</th>
        <th>Id card</th>
        <th>Salary</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Address</th>
        <th>Position</th>
        <th>Degree</th>
        <th>Division</th>
        <th>User name</th>
        <th>Action</th>
    </tr>
    <c:forEach var="employee" items="${employeeList}">
        <tr>
            <td><c:out value="${employee.getId()}"/></td>
            <td><c:out value="${employee.getName()}"/></td>
            <td><c:out value="${employee.getBirthday()}"/></td>
            <td><c:out value="${employee.getIdCard()}"/></td>
            <td><c:out value="${employee.getSalary()}"/></td>
            <td><c:out value="${employee.getPhone()}"/></td>
            <td><c:out value="${employee.getEmail()}"/></td>
            <td><c:out value="${employee.getAddress()}"/></td>
            <td><c:out value="${employee.getPosName()}"/></td>
            <td><c:out value="${employee.getDegName()}"/></td>
            <td><c:out value="${employee.getDivName()}"/></td>
            <td><c:out value="${employee.getUserName()}"/></td>

            <td>
                    <%--        Sua dong href="/xxxx?action=update&id=${xxxx.getId()}" --%>
                <a href="/employee?action=update&id=${employee.getId()}" class="btn bg-warning">Update</a>
                    <%--        Sua dong href="/xxxx?action=remove&id=${xxxx.getId()}" --%>
                <a href="/employee?action=remove&id=${employee.getId()}" class="btn bg-danger">Remove</a>

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
