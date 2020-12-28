<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/24/2020
  Time: 9:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Update employee information</title>
    <%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">--%>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body>

<div class="container">
    <h1>Update employee information</h1>
    <div class="col-6">
        <%--        Sua dong action="/xxxx?action=update"--%>
        <form action="/employee?action=update" method="post">
            <div class="form-group">
                <label>Id</label>
                <input type="text" name="id" value="${employee.getId()}" class="form-control" >
            </div>
            <div class="form-group">
                <label>Name</label>
                <input type="text" name="name" value="${employee.getName()}" class="form-control" >
            </div>
            <div class="form-group">
                <label>Birthday</label>
                <input type="text" name="birthday" value="${employee.getBirthday()}" class="form-control" >
            </div>
            <div class="form-group">
                <label>Id card</label>
                <input type="text" name="idCard" value="${employee.getIdCard()}" class="form-control" >
            </div>
            <div class="form-group">
                <label>Salary</label>
                <input type="text" name="salary" value="${employee.getSalary()}" class="form-control" >
            </div>
            <div class="form-group">
                <label>Phone</label>
                <input type="text" name="phone" value="${employee.getPhone()}" class="form-control" >
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="text" name="email" value="${employee.getEmail()}" class="form-control" >
            </div>
            <div class="form-group">
                <label>Address</label>
                <input type="text" name="address" value="${employee.getAddress()}" class="form-control" >
            </div>

            <div class="form-group">
                <label>Position</label>
                <input value="${employee.getPosName()}" class="form-control" disabled >
                <%-- sua lai name, value, trong the c:foreach, <option>, <c:out>--%>
                <select name="positionId" class="custom-select">
                    <c:forEach var="position" items="${positionList}">
                        <option value="${position.getId()}">
                            <c:out value="${position.getPositionName()}"/>
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label>Degree</label>
                <input value="${employee.getDegName()}" class="form-control" disabled >
                <%-- sua lai name, value, trong the c:foreach, <option>, <c:out>--%>
                <select name="degreeId" class="custom-select">
                    <c:forEach var="degree" items="${degreeList}">
                        <option value="${degree.getId()}">
                            <c:out value="${degree.getDegreeName()}"/>
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label>Division</label>
                <input value="${employee.getDivName()}" class="form-control"  disabled>
                <select name="divisionId" class="custom-select">
                    <c:forEach var="division" items="${divisionList}">
                        <option value="${division.getId()}">
                            <c:out value="${division.getDivisionName()}"/>
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label>User name</label>
                <input value="${employee.getUserName()}" class="form-control" disabled>
                <select name="userName" class="custom-select">
                    <c:forEach var="user" items="${userList}">
                        <option value="${user.getUserName()}">
                            <c:out value="${user.getUserName()}"/>
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div>
                <input type="submit" value="Update" class="btn bg-secondary" >
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
