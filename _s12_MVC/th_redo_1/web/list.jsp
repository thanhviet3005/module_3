<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/19/2020
  Time: 3:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List Customer</title>
</head>
<body>
<h2>List customer</h2>
<table>
    <tr>
        <td>Id</td>
        <td>Name</td>
        <td>Email</td>
        <td>Address</td>
        <td>Action</td>
    </tr>
    <c:forEach var="customer" items="customerList">
        <tr>
            <td>${customer.getId()}</td>
            <td>${customer.getName()}</td>
            <td>${customer.getEmail()}</td>
            <td>${customer.getAddress()}</td>
            <td>
                <button type="button">Edit</button>
                <button type="button">Delete</button>
            </td>
        </tr>
    </c:forEach>
</table>

<%--/* +_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+ */--%>

<%--<script src="../bootstrap413/js/popper.min.js"></script>--%>
<%--<script src="../datatables/js/jquery.dataTables.min.js"></script>--%>
<%--<script src="../datatables/js/dataTables.bootstrap4.min.js"></script>--%>
<%--<script src="../bootstrap413/js/bootstrap.min.js"></script>--%>
<%--<script src="../bootstrap413/js/bootstrap.bundle.js"></script>--%>
</body>
</html>
