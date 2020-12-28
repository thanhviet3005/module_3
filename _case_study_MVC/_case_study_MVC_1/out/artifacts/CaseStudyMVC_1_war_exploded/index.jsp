<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/22/2020
  Time: 2:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <title>Home</title>
    <%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">--%>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
  </head>
  <body>
  <div class="container" style="height: auto">
    <header class="row">
      <img src="logofurama@2x.png" class="col-sm-1" style="height: auto ; width: auto">
      <div class="col-sm-7 shopping-mall text-center">

      </div>
      <div class="col-sm-4 shopping-mall text-lg-right">
        <!--            <h1>Online shopping mall</h1>-->
        <h5>CodeGym_Hieu_Ngoc</h5>
      </div>
      <!-- __+__+__+__+__+__+__+__+__+__+__+__+__-->
    </header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-info">
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link  btn btn-success" href="">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link btn btn-success" href="/employee" >Employee</a>
          </li>
          <li class="nav-item">
            <a class="nav-link btn btn-success" href="/customer">Customer</a>
          </li>
          <li class="nav-item">
            <a class="nav-link btn btn-success" href="/service">Service</a>
          </li>
          <li class="nav-item">
            <a class="nav-link btn btn-success" href="/contract">Contract</a>
          </li>
          <!-- __+__+__+__+__+__+__+__+__+__+__+__+__-->
        </ul>
        <form class="form-inline my-2 my-lg-0">
          <input type="text" placeholder="Search" class="form-control mr-sm-2" aria-label="Search">
          <input  type="submit" value="Search" class="btn bg-success my-2 my-sm-0">
        </form>
      </div>
    </nav>

    <div class="row">
      <div class="col-sm-2">
        <div class="card">
          <div class="card-header">

            <strong>Item list</strong>
          </div>
          <div class="list-group">
            <a href="#" class="list-group-item">Item 1</a>
            <a href="#" class="list-group-item">Item 2</a>
            <a href="#" class="list-group-item">Item 3</a>
            <a href="#" class="list-group-item">Item 4</a>
            <a href="#" class="list-group-item">Item 5</a>
            <a href="#" class="list-group-item">Item 6</a>
          </div>
        </div>
      </div>
      <!--        <div class="col-sm-10">-->
      <img class="col-sm-10"
           src="furama-resort-da-nang-1.jpg"
           style="align-content: center">

      <!--        </div>-->
    </div>
    <footer class="panel panel-default">
      <div class="panel-heading text-center bg-primary" >
        <p>CodeGym © 2017</p>
      </div>
    </footer>

  </div>




  $END$
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
