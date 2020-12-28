<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/23/2020
  Time: 8:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Update customer information</title>
    <%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">--%>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1>Update user information</h1>
    <div class="col-6">
<%--        Sua dong action="/xxxx?action=update"--%>
        <form action="/customer?action=update" method="post">
            <div class="form-group">
                <label>Id</label>
                <%--        Sua dong name = "xxxx" value="${xxxx.getId()} --%>
                <input type="text" name="id" value="${employee.getId()}" class="form-control" >
            </div>
            <div class="form-group">
                <label></label>
                <%--        Sua dong name = "xxxx" value="${xxxx.getId()} --%>
                <input type="text" name="" value="${customer.getId()}" class="form-control" >
            </div>




            <div class="form-group">
                <label>Type name</label>
                <select name="typeId" class="custom-select" id="inputGroupSelect01">
                    <c:forEach var="cusType" items="${customerTypeList}">
                        <option value="${cusType.getId()}">
                            <c:out value="${cusType.getCusTypeName()}"/>
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label>Name</label>
                <%--        Sua dong name = "xxxx" value="${xxxx.getTTTT()} --%>
                <input type="text" name="name" value="${customer.getName()}" class="form-control" >
            </div>

            <div class="form-group">
                <label>Birthday</label>
                <%--        Sua dong name = "xxxx" value="${xxxx.getTTTT()} --%>
                <input type="text" name="birthday" value="${customer.getBirthday()}" class="form-control" >
            </div>

            <div class="form-group">
                <label>Gender</label>
                <%--        Sua dong name = "xxxx" value="${xxxx.getTTTT()} --%>
                <input type="text" name="gender" value="${customer.getGender()}" class="form-control" >
            </div>

            <div class="form-group">
                <label>Id card</label>
                <%--        Sua dong name = "xxxx" value="${xxxx.getTTTT()} --%>
                <input type="text" name="idCard" value="${customer.getIdCard()}" class="form-control" >
            </div>

            <div class="form-group">
                <label>Phone</label>
                <%--        Sua dong name = "xxxx" value="${xxxx.getTTTT()} --%>
                <input type="text" name="phone" value="${customer.getPhone()}" class="form-control" >
            </div>

            <div class="form-group">
                <label>Email</label>
                <%--        Sua dong name = "xxxx" value="${xxxx.getTTTT()} --%>
                <input type="text" name="email" value="${customer.getEmail()}" class="form-control" >
            </div>

            <div class="form-group">
                <label>Address</label>
                <%--        Sua dong name = "xxxx" value="${xxxx.getTTTT()} --%>
                <input type="text" name="address" value="${customer.getAddress()}" class="form-control" >
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
