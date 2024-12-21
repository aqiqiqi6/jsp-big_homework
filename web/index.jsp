<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>欢迎使用物业管理系统</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f9f9fb;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .container {
      max-width: 400px;
      width: 90%;
      padding: 20px;
      background-color: white;
      border-radius: 10px;
      box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
      text-align: center;
      transition: transform 0.2s;
    }

    .container:hover {
      transform: scale(1.02);
    }

    h1 {
      color: #333;
      font-size: 24px;
      margin-bottom: 20px;
    }

    .btn {
      display: inline-block;
      width: 100%;
      padding: 12px 20px;
      margin: 10px 0;
      font-size: 16px;
      color: white;
      background-color: #4CAF50;
      border: none;
      border-radius: 5px;
      text-decoration: none;
      cursor: pointer;
      transition: background-color 0.3s, box-shadow 0.3s;
    }

    .btn:hover {
      background-color: #3e8e41;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    @media (max-width: 480px) {
      h1 {
        font-size: 20px;
      }

      .btn {
        font-size: 14px;
      }
    }
  </style>
</head>
<body>
<div class="container">
  <h1>欢迎使用物业管理系统</h1>
  <a href="YonghuLogin.jsp" class="btn">您是用户</a>
  <a href="login.jsp" class="btn">您是管理员</a>
</div>
</body>
</html>
