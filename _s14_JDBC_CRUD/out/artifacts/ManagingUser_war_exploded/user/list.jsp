<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/18/2020
  Time: 11:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
    <script src="../bootstrap413/js/bootstrap.bundle.js"></script>
    <link rel="stylesheet" href="../bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="../datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<div style="text-align: center;">
<h1>User Management</h1>
<h2>
    <a href="/users?action=create">Add new user</a>
</h2>
</div>

<div align="center">
    <table border="1" cellpadding="5">
        <caption>
            <h2>List of Users</h2>
        </caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Action</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"></c:out></td>
                <td><c:out value="${user.name}"></c:out></td>
                <td><c:out value="${user.email}"></c:out></td>
                <td><c:out value="${user.country}"></c:out></td>
                <td>
                    <button type="button" href="/users?action=edit&id=${user.id}" class="btn btn-warning">
                        Edit
                    </button>
                    <button type="button" href="/users?action=delete&id=${user.id}" class="btn btn-danger">
                        Delete
                    </button>
<%--                    <a href="/users?action=edit&id=${user.id}">Edit</a>--%>
<%--                    <a href="/users?action=delete&id=${user.id}">Delete</a>--%>
                </td>
            </tr>
        </c:forEach>


    </table>

</div>

<%--/* +_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+ */--%>

<script src="../bootstrap413/js/popper.min.js"></script>
<script src="../datatables/js/jquery.dataTables.min.js"></script>
<script src="../datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="../bootstrap413/js/bootstrap.min.js"></script>
<script src="../bootstrap413/js/bootstrap.bundle.js"></script>
</body>
</html>
