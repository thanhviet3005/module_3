<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/26/2020
  Time: 5:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List contract in database</title>
    <%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">--%>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1>Add new contract</h1>
    <div class="col-6">
        <%--        Sua action = "/customer" lai--%>
        <form action="/contract?action=create" method="post">
            <div class="form-group">
                <label>contract_id</label>
                <input type="text" name="contract_id" class="form-control">
            </div>
            <div class="form-group">
                <label>contract_start_date</label>
                <input type="text" name="contract_start_date" class="form-control">
            </div>
            <div class="form-group">
                <label>contract_end_date</label>
                <input type="text" name="contract_end_date" class="form-control">
            </div>
            <div class="form-group">
                <label>contract_deposition</label>
                <input type="text" name="contract_deposition" class="form-control">
            </div>
            <div class="form-group">
                <label>contract_total_money</label>
                <input type="text" name="contract_total_money" class="form-control">
            </div>
            <div class="form-group">
                <label>employee_id</label>
                <%-- sua lai name, value, trong the c:foreach, <option>, <c:out>--%>
                <select name="employee_id" class="custom-select">
                    <c:forEach var="employee" items="${employeeList}">
                        <option value="${employee.getId()}">
                            <c:out value="${employee.getName()}"/>
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label>customer_id</label>
                <%-- sua lai name, value, trong the c:foreach, <option>, <c:out>--%>
                <select name="customer_id" class="custom-select">
                    <c:forEach var="customer" items="${customerList}">
                        <option value="${customer.getId()}">
                            <c:out value="${customer.getName()}"/>
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label>service_id</label>
                <%-- sua lai name, value, trong the c:foreach, <option>, <c:out>--%>
                <select name="service_id" class="custom-select">
                    <c:forEach var="service" items="${serviceModelList}">
                        <option value="${service.getServiceId()}">
                            <c:out value="${service.getServiceName()}"/>
                        </option>
                    </c:forEach>
                </select>
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
