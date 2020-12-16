<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/16/2020
  Time: 9:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
    <title>$Title$</title>

  </head>
  <body>
  <form action="converter.jsp" method="post">
    <c:out value="${'this is true:'}"/>
    <h2>Currency converter</h2>
    <p>USD </p>
    <input type="number" name="usd" placeholder="number">
    <p>Rate </p>
    <input type="number" name="rate" placeholder="number"><br>
    <input type="submit" id="submit" value="Converter">
  </form>
  </body>
</html>
