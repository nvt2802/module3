<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1>Simple Calculator</h1>
<form method="get" action="/SimpleCalculatorServlet">
    <fieldset>
        <legend>Calculator</legend>
        <label for="firstOperation">First operation: </label>
        <input type="number" name="firstOperation" id="firstOperation">
        <label for="operator">Operator</label>
        <select name="operator" id="operator">
            <option value="add">Add</option>
            <option value="sub">Sub</option>
            <option value="multi">Multi</option>
            <option value="div">Div</option>
        </select>
        <label for="secondOperation">Second operator: </label>
        <input type="number" name="secondOperation" id="secondOperation">
        <input type="submit" name="submit"  value="Submit">
    </fieldset>
</form>
</body>
</html>