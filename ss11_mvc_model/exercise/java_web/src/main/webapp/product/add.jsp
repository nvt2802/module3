<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/7/2023
  Time: 2:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>Form add product</h3>
<form action="/ProductServlet?action=add" method="post">
    <label for="name">Name: </label><br>
    <input type="text" name="name" id="name"><br>
    <label for="price">Price: </label><br>
    <input type="text" name="price" id="price"><br>
    <label for="description">Description: </label><br>
    <input type="text" name="description" id="description"><br>
    <label for="producer">Producer: </label><br>
    <input type="text" name="producer" id="producer"><br>
  <input type="submit" value="Submit">
</form>
<a href="/ProductServlet"><button>Back</button></a>
</body>
</html>
