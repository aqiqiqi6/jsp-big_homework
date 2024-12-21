<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.Yonghu" %>
<%
    // 从 session 中获取用户对象
    Yonghu yonghu = (Yonghu) session.getAttribute("yonghu");

    // 如果用户未登录，重定向到登录页面
    if (yonghu == null) {
        response.sendRedirect("YonghuLogin.jsp");
        return;
    }

    // 获取传递过来的数据
    String itemName = (String) request.getAttribute("item");
    double totalAmount = (Double) request.getAttribute("totalAmount");
%>

<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>支付成功</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 100%;
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h1 {
            font-size: 32px;
            color: #28a745;
            margin-bottom: 20px;
        }
        .info {
            font-size: 20px;
            color: #555;
            margin-bottom: 30px;
        }
        .info p {
            margin: 15px 0;
        }
        .thank-you-message {
            font-size: 18px;
            color: #333;
            margin-bottom: 40px;
        }
        .thank-you-message strong {
            font-size: 20px;
            color: #28a745;
        }
        .button-container {
            margin-top: 30px;
        }
        .btn {
            padding: 12px 20px;
            font-size: 16px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
            text-decoration: none;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>支付成功！</h1>

    <div class="info">
        <p>您选择的缴费项目是: <strong><%= itemName %></strong></p>
        <p>总费用: <strong>¥<%= totalAmount %></strong></p>
    </div>

    <div class="thank-you-message">
        <p><strong>感谢您的支持！</strong></p>
        <p>您的支付已成功处理，感谢您选择我们的服务。</p>
    </div>

    <div class="button-container">
        <a href="YonghuDashboard.jsp" class="btn">返回首页</a>
    </div>
</div>

</body>
</html>
