<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/7/2023
  Time: 8:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${productList.size() == 0}">
    <p>Can't found product</p>
</c:if>
<c:if test="${productList.size() > 0}">
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
</c:if>
<a href="/ProductServlet">Back</a>
</body>
</html>
