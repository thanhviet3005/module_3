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
<div class="container">
    <h1>Add new service</h1>
    <a href="/service" class="btn btn-primary">Back to list service page </a>
    <div class="col-6">
        <%--        Sua action = "/customer" lai--%>
        <form action="/service?action=create" method="post">
            <div class="form-group">
                <label>service_id</label>
                <input type="text" name="service_id" class="form-control">
            </div>
            <div class="form-group">
                <label>service_name</label>
                <input type="text" name="service_name" class="form-control">
            </div>
            <div class="form-group">
                <label>service_area</label>
                <input type="text" name="service_area" class="form-control">
            </div>
            <div class="form-group">
                <label>service_cost</label>
                <input type="text" name="service_cost" class="form-control">
            </div>
            <div class="form-group">
                <label>service_max_people</label>
                <input type="text" name="service_max_people" class="form-control">
            </div>

            <div class="form-group">
                <label>rent_type_id</label>
                <input value="Prev: ${rentType.getRentTypeName()}" class="form-control" disabled>
                <%-- sua lai name, value, trong the c:foreach, <option>, <c:out>--%>
                <select name="rent_type_id" class="custom-select">
                    <c:forEach var="rentType" items="${rentTypeModelList}">
                        <option value="${rentType.getRentTypeId()}">
                            <c:out value="${rentType.getRentTypeName()}"/>
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label>service_type_id</label>
                <input value="Prev: ${serviceType.getServiceTypeName()}" class="form-control" disabled>
                <%-- sua lai name, value, trong the c:foreach, <option>, <c:out>--%>
                <select name="service_type_id" class="custom-select">
                    <c:forEach var="serviceType" items="${serviceTypeModelList}">
                        <option value="${serviceType.getServiceTypeId()}">
                            <c:out value="${serviceType.getServiceTypeName()}"/>
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label>standard_room</label>
                <select name="standard_room" class="custom-select">
                    <option value="vip"><c:out value="vip"/></option>
                    <option value="business"><c:out value="business"/></option>
                    <option value="normal"><c:out value="normal"/></option>
                </select>
            </div>
            <div class="form-group">
                <label>description_other_convenient</label>
                <input type="text" name="description_other_convenient" class="form-control">
            </div>
            <div class="form-group">
                <label>pool_area</label>
                <input type="text" name="pool_area" class="form-control">
            </div>

            <div class="form-group">
                <label>number_of_floors</label>
                <input type="text" name="number_of_floors" class="form-control">
            </div>

            <div>
                <input type="submit" value= "Add" class="btn bg-primary">
            </div>
        </form>
    </div>
</div>

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
