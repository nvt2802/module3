<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/7/2023
  Time: 7:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Product details</h1>
<p>
  <a href="/ProductServlet">Back to product list</a>
</p>
<table>
  <tr>
    <td>Name: </td>
    <td>${requestScope["product"].getName()}</td>
  </tr>
  <tr>
    <td>Price: </td>
    <td>${requestScope["product"].getPrice()}</td>
  </tr>
  <tr>
    <td>Description: </td>
    <td>${requestScope["product"].getDescription()}</td>
  </tr>
  <tr>
    <td>Producer: </td>
    <td>${requestScope["product"].getProducer()}</td>
  </tr>
</table>
</body>
</html>
