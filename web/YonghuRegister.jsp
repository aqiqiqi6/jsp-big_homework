<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>物业管理系统 - 用户注册</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 500px;
            margin: 50px auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            font-size: 16px;
            margin: 10px 0 5px;
        }

        input[type="text"],
        input[type="password"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        .error-message {
            color: red;
            text-align: center;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .login-link {
            display: block;
            text-align: center;
            margin-top: 10px;
        }

        .login-link a {
            color: #4CAF50;
            text-decoration: none;
        }

        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>用户注册</h2>
    <form action="yonghuRegister" method="post">
        <label for="username">用户名:</label>
        <input type="text" id="username" name="username" required>

        <label for="password">密码:</label>
        <input type="password" id="password" name="password" required>

        <label for="confirmPassword">确认密码:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required>

        <label for="name">姓名:</label>
        <input type="text" id="name" name="name" required>

        <label for="buildingNumber">楼号:</label>
        <input type="text" id="buildingNumber" name="buildingNumber" required>

        <label for="unitNumber">单元号:</label>
        <input type="text" id="unitNumber" name="unitNumber" required>

        <label for="roomNumber">房号:</label>
        <input type="text" id="roomNumber" name="roomNumber" required>

        <label for="userType">类型:</label>
        <select name="userType" id="userType">
            <option value="户主">户主</option>
            <option value="租户">租户</option>
        </select>

        <label for="carNumber">车牌号:</label>
        <input type="text" id="carNumber" name="carNumber">

        <label for="phoneNumber">手机号:</label>
        <input type="text" id="phoneNumber" name="phoneNumber" required>

        <button type="submit">注册</button>

        <!-- 显示错误信息 -->
        <% if(request.getAttribute("error") != null) { %>
        <p class="error-message"><%= request.getAttribute("error") %></p>
        <% } %>
    </form>

    <div class="login-link">
        <a href="YonghuLogin.jsp">已有账户？立即登录</a>
    </div>
</div>

</body>
</html>
