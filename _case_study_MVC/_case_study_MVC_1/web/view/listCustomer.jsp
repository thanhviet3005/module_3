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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <%--    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">--%>
    <%--    dataTables 1.10.21 support boostrap <= 4.13--%>
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<h1>List customer in database</h1>
<%-- Sua dong customer = xxxx --%>
<div class="row">
    <div class="col-4">
        <a href="/customer?action=create" class="btn bg-primary">Add new customer</a>
    </div>
    <div class="col-8">
<%--        <h3>Search by Name</h3>--%>
        <form action="/customer?action=search" method="post">
            <div class="form-group">
                <input type="text" name="customerName" class="form-control">
                <input type="submit" value="Search by name" class="btn bg-secondary">
            </div>
        </form>
    </div>
</div>


<table class="table">
    <tr>
        <td>Id</td>
<%--        <td>Type Id</td>--%>
        <td>Customer type</td>
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
<%--            <td><c:out value="${customer.getTypeId()}"/></td>--%>
            <td><c:out value="${customer.getTypeName()}"/></td>
            <td><c:out value="${customer.getName()}"/></td>
            <td><c:out value="${customer.getBirthday()}"/></td>
            <td><c:out value="${customer.getGender()}"/></td>
            <td><c:out value="${customer.getIdCard()}"/></td>
            <td><c:out value="${customer.getPhone()}"/></td>
            <td><c:out value="${customer.getEmail()}"/></td>
            <td><c:out value="${customer.getAddress()}"/></td>

            <td>
                    <%--        Sua dong href="/xxxx?action=update&id=${xxxx.getId()}" --%>
                <a href="/customer?action=update&id=${customer.getId()}" class="btn bg-warning">Update</a>
                    <%--        Sua dong href="/xxxx?action=remove&id=${xxxx.getId()}" --%>
                <a Sua dong href="/customer?action=remove&id=${customer.getId()}" class="btn bg-danger">Remove</a>

<%--                <a href="/user?action=update&id=${user.getId()}" class="btn bg-warning">Update</a>--%>
<%--                <a href="/user?action=delete&id=${user.getId()}" class="btn bg-danger">Delete</a>--%>
            </td>
        </tr>
    </c:forEach>
</table>

<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function(){
        $('#tableStudent').dataTable({
            "dom": 'lrtip',
            "lengthChance": false,
            "pageLength": 5
        } );
    } );
</script>

<%--&lt;%&ndash;&lt;%&ndash;__+__+__+__+__+__+__+__+__+__+__+__+__&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash; Thu vien jQuery da nen phuc vu cho bootstrap.min.js&ndash;%&gt;--%>
<%--<script src = "lib/jquery-3.5.1.min.js"></script>--%>
<%--&lt;%&ndash; Thu vien popper da nen phuc vu cho bootstrap.min.js&ndash;%&gt;--%>
<%--<script src = "lib/popper.min.js"></script>--%>
<%--&lt;%&ndash; Thu vien popper da nen phuc vu cho bootstrap.min.js&ndash;%&gt;--%>
<%--<script src = "js/bootstrap.min.js"></script>--%>

<%--__+__+__+__+__+__+__+__+__+__+__+__+__--%>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
