<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1>Product Discount Calculator</h1>
<form action="/discount" method="post">
    <label for="description">Product Description:</label><br>
    <input type="text" id="description" name="description"><br>
    <label for="price">List Price: </label><br>
    <input type="number" id="price" name="price"><br>
    <label for="percent">Discount Percent: </label><br>
    <input type="number" id="percent" name="percent"><br>
    <input type="submit" id="submit" name="submit" value=" Calculate Discount">
</form>
</body>
</html>