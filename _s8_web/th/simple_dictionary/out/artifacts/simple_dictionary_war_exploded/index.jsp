<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/15/2020
  Time: 10:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <head>
    <title>SimpleDictionary</title>
    <link href="SimpleDictionaryCSS.css" rel="stylesheet" type="text/css">
  </head>
  <body>
  <h2>Vietnamese Dictionary</h2>
  <form action="/translate" method="post">
    <input type="text" name="txtSearch" placeholder="Enter your word">
    <input type="submit" id="submit" value="Search">
  </form>
  $END$
  </body>
</html>
