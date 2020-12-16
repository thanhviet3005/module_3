<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/15/2020
  Time: 11:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>ProductDiscount</title>
    <link href="simpleCSS.css" rel="stylesheet" type="text/css">
  </head>
  <body>
    <form action="display-discount" method="post">
      <h3>Product Description</h3>
      <input type="text" name="description" placeholder="xyz">

      <h3>List Price</h3>
      <input type="text" name="price" placeholder="number" >
      <h3>Discount Percent</h3>
      <input type="text" name="percent" placeholder="number">
      <br><br>
      <input type="submit" name="calculate" value="Calculate Discount">
    </form>
  $END$
  </body>
</html>
