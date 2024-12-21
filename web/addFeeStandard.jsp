<%--
  Created by IntelliJ IDEA.
  User: 七
  Date: 2024/12/9
  Time: 18:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>添加缴费标准</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .form-container {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
        }
        label {
            display: block;
            margin-bottom: 8px;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
        }
        button:hover {
            background-color: #218838;
        }
        .error {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>添加缴费标准</h2>
    <form action="addFeeStandard" method="post">
        <label for="name">标准名称:</label>
        <input type="text" id="name" name="name" required>

        <label for="price">价格:</label>
        <input type="number" id="price" name="price" step="0.01" required>

        <button type="submit">添加标准</button>
    </form>

    <%-- 显示错误信息 --%>
    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>
</div>

</body>
</html>
