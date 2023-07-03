<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/7/2023
  Time: 1:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List</title>
</head>
<body>
<a href="/ProductServlet?action=search">search</a>
<table>
    <tr>
        <th>STT</th>
        <th>Name</th>
        <th>Price</th>
        <%--        <th>Description</th>--%>
        <%--        <th>Producer</th>--%>
        <th>EDIT</th>
        <th>DELETE</th>
    </tr>
    <c:forEach var="product" items="${list}" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td><a href="/ProductServlet?action=detail&id=${product.id}">${product.name}</a></td>
            <td>${product.price}</td>
                <%--    <td>${product.description}</td>--%>
                <%--    <td>${product.producer}</td>--%>
            <td><a href="/ProductServlet?action=edit&id=${product.id}">Edit</a></td>
            <td><a href="/ProductServlet?action=delete&id=${product.id}">delete</a></td>
        </tr>
    </c:forEach>
</table>
<a href="/ProductServlet?action=add">
    <button>ADD</button>
</a>
<c:if test="${msg != null}">
    <p style="color: green"><c:out value="${msg}"></c:out></p>
</c:if>
</body>
</html>
