<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/25/2020
  Time: 8:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List service</title>
    <%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">--%>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body>
<h1>List service in database</h1>
<a href="/service?action=create" class="btn bg-secondary">Add new service</a>
<h3>Search by Name</h3>
<div class="col-4">
    <form action="/service?action=search" method="post">
        <div class="form-group">
            <input type="text" name="name" class="form-control">
            <input type="submit" value="Search" class="btn bg-secondary">
        </div>
    </form>
</div>
<table class="table">
    <tr>
        <th>service_id</th>
        <th>service_name</th>
        <th>service_area</th>
        <th>service_cost</th>
        <th>service_max_people</th>

        <th>rent_type_name</th>
        <th>rent_type_cost</th>
        <th>service_type_name</th>
        <th>standard_room</th>
        <th>description_other_convenient</th>

        <th>pool_area</th>
        <th>number_of_floors name</th>
        <th>Action</th>
    </tr>
    <c:forEach var="service" items="${serviceModelList}">
        <tr>
            <td><c:out value="${service.getServiceId()}"/></td>
            <td><c:out value="${service.getServiceName()}"/></td>
            <td><c:out value="${service.getServiceArea()}"/></td>
            <td><c:out value="${service.getServiceCost()}"/></td>

            <td><c:out value="${service.getServiceMaxPeople()}"/></td>
            <td><c:out value="${service.getRentTypeName()}"/></td>
            <td><c:out value="${service.getRentTypeCost()}"/></td>
            <td><c:out value="${service.getServiceTypeName()}"/></td>

            <td><c:out value="${service.getStandardRoom()}"/></td>
            <td><c:out value="${service.getOtherConvenient()}"/></td>
            <td><c:out value="${service.getPoolArea()}"/></td>
            <td><c:out value="${service.getNumberOfFloor()}"/></td>

            <td>
                    <%--        Sua dong href="/xxxx?action=update&id=${xxxx.getId()}" --%>
                <a href="/service?action=update&id=${service.getServiceId()}" class="btn bg-warning">Update</a>
                    <%--        Sua dong href="/xxxx?action=remove&id=${xxxx.getId()}" --%>
                <a href="/service?action=remove&id=${service.getServiceId()}" class="btn bg-danger">Remove</a>

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
