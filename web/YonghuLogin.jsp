<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>物业管理系统 - 用户登录</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 400px;
            margin: 50px auto;
            background-color: white;
            padding: 20px;
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
        input[type="password"] {
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

        .register-link {
            display: block;
            text-align: center;
            margin-top: 10px;
        }

        .register-link a {
            color: #4CAF50;
            text-decoration: none;
        }

        .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>用户登录</h2>
    <form action="yonghuLogin" method="post">
        <label for="username">用户名:</label>
        <input type="text" id="username" name="username" required>

        <label for="password">密码:</label>
        <input type="password" id="password" name="password" required>

        <button type="submit">登录</button>

        <!-- 显示错误信息 -->
        <% if(request.getAttribute("error") != null) { %>
        <p class="error-message"><%= request.getAttribute("error") %></p>
        <% } %>
    </form>

    <div class="register-link">
        <a href="YonghuRegister.jsp">还没有账户？立即注册</a>
    </div>
</div>

</body>
</html>
