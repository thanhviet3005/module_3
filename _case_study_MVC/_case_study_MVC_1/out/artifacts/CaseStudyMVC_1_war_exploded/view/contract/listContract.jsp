<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/26/2020
  Time: 4:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List contract in database</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<%--    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">--%>
<%--    dataTables 1.10.21 support boostrap <= 4.13--%>
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<h1>List contract in database</h1>
<a href="/contract?action=create" class="btn bg-primary">Add new contract</a>
<table id="tableStudent" class="table table-striped table-bordered" style="width:100%">
    <thead>
    <tr>
        <th>contract_id</th>
        <th>contract_start_date</th>
        <th>contract_end_date</th>
        <th>contract_deposition</th>

        <th>contract_total_money</th>
        <th>employee_name</th>
        <th>customer_name</th>
        <th>service_name</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="contract" items="${contractList}">
        <tr>
            <td><c:out value="${contract.getContract_id()}"/></td>
            <td><c:out value="${contract.getContract_start_date()}"/></td>
            <td><c:out value="${contract.getContract_end_date()}"/></td>
            <td><c:out value="${contract.getContract_deposition()}"/></td>

            <td><c:out value="${contract.getContract_total_money()}"/></td>
            <td><c:out value="${contract.getEmployee_name()}"/></td>
            <td><c:out value="${contract.getCustomer_name()}"/></td>
            <td><c:out value="${contract.getService_name()}"/></td>
        </tr>
    </c:forEach>
    </tbody>
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
