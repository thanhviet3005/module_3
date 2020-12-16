<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/16/2020
  Time: 9:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Converter</title>
</head>
<body>
<%
    Float rate = Float.parseFloat(request.getParameter("rate"));
    Float usd = Float.parseFloat(request.getParameter("usd"));
    Float vnd = usd * rate;
%>
<h4>Rate: <%=rate %></h4>
<h4>USD: <%=usd %></h4>
<h4>VND: <%=vnd %></h4>

</body>
</html>
