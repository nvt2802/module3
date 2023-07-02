<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2/7/2023
  Time: 3:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="add_student.jsp"><button name="add" id="add">ADD</button></a>
<table>
    <tr>
        <th>STT</th>
        <th>Name</th>
        <th>Gender</th>
        <th>Point</th>
    </tr>
<c:forEach var="student" items="${studentsList}" varStatus="loop">
<tr>
    <td>${loop.count}</td>
    <td><c:out value="${student.name}"></c:out></td>
    <td>
        <c:if test="${student.gender == true}">
            Nam
        </c:if>
        <c:if test="${student.gender == false}">
            Nu
        </c:if>
    </td>
    <td><c:out value="${student.point}"></c:out></td>
</tr>
</c:forEach>
</table>
</body>
</html>
