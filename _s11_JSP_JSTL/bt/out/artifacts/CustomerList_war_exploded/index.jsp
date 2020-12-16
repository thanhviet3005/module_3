
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="customer.Customer" %>
<%@ page import="customer.CustomerList" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/16/2020
  Time: 9:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>CustomerListJSP</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
          crossorigin="anonymous">
  </head>
  <body>
    <%
      List<Customer> customerListJSP = CustomerList.getCustomerList();
      request.setAttribute("customerList", customerListJSP);
    %>
  <table>
    <tr><th>DANH SACH KHACH HANG</th></tr>
    <tr>
      <th>Ten</th>
      <th>Ngay sinh</th>
      <th>Gioi tinh</th>
      <th>Dia chi</th>
      <th>Avatar</th>
      <th>Tuy chinh</th>
    </tr>
    <c:forEach var="customer" items="${customerList}"  >
      <tr>
        <td><c:out value="${customer.name}"/></td>
        <td><c:out value="${customer.age}"/></td>
        <td><c:out value="${customer.birthDate}"/></td>
        <td><c:out value="${customer.address}"/></td>
        <td>
          <img src=<c:out value="${customer.avatar}"/> alt=""
                 style="height: 100px; width: 100px">
        </td>
        <td>
          <button type="button" name="edit" value="Edit">Edit</button>
          <button type="button" name="delete" value="delete">Delete</button>
        </td>
      </tr>
    </c:forEach>
  </table>


    $END$
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  </body>
</html>
