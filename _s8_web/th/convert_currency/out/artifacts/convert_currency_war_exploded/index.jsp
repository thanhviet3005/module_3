<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/14/2020
  Time: 3:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>ConvertCurrency</title>
    <link rel="stylesheet" type="text/css" href="CurrencyServlet.css">

  </head>
  <body>
  <h2>Currency converter</h2>
  <form action="/converter" method="get">

    <lable>Rate:</lable>
    <input type="text" name="rate" placeholder="RATE" value="2200"><br>
    <label>USD</label>
    <input type="text" name="usd" placeholder="USD" value = "0"><br>
    <input type="submit" id="submit" value="Converter">
  $END$
  </form>
  </body>
</html>
