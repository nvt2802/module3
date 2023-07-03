<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/7/2023
  Time: 8:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/ProductServlet?action=search" method="post">
  <label for="searchId"></label>
  <input type="search" id="searchId" name="searchProduct" placeholder="Search...">
  <input type="submit" value="Search">
  <table>
    <tr>
      <th>STT</th>
      <th>Name</th>
      <th>Price</th>
      <th>Description</th>
      <th>Producer</th>
    </tr>
    <c:forEach var="product" items="${productList}" varStatus="loop">
      <tr>
        <td>${loop.count}</td>
        <td>${product.name}</td>
        <td>${product.price}</td>
        <td>${product.description}</td>
        <td>${product.producer}</td>
      </tr>
    </c:forEach>
  </table>
</form>
</body>
</html>
