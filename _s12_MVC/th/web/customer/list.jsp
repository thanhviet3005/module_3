<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/16/2020
  Time: 4:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer List</title>
</head>
<body>
<h1>Customers</h1>
<p>
    <a href="/customers?action=create">Create new customer</a>
</p>
<table border="1">
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Address</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
<c:forEach var= "customer" items='${requestScope["customers"]}'>
    <tr>
        <td><a href="/customers?action=view&id=${customer.getId()}">${customer.getName()}</a></td>
        <td>${customer.getEmail()}</td>
        <td>${customer.getAddress()}</td>
        <td><a href="/customers?action=edit&id=${customer.getId()}">edit</a></td>
        <td><a href="/customers?action=delete&id=${customer.getId()}">delete</a></td>
    </tr>
</c:forEach>
</table>

</body>
</html>
