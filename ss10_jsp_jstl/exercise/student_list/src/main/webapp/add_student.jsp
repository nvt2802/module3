<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2/7/2023
  Time: 3:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/StudentsServlet" method="post">
    <h3>Add Student</h3>
    <label for="id">ID:</label><br>
    <input type="text" name="id" id="id"><br>
    <label for="name">Name: </label><br>
    <input type="text" name="name" id="name"><br>
    <label>Gender:
        <select name="gender">
            <option value="nam">Nam</option>
            <option value="nu">Nu</option>
        </select>
    </label><br>
    <label for="point" >Point: </label><br>
    <input type="number" name="point" id="point"><br>
    <input type="submit" name="submit" value="Submit">
</form>
<a href="/StudentsServlet">back</a>

</body>
</html>
