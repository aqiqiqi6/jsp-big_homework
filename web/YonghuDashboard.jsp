<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.Yonghu" %>
<%
    Yonghu yonghu = (Yonghu) session.getAttribute("yonghu");
    if (yonghu == null) {
        response.sendRedirect("YonghuLogin.jsp");
        return;
    }
%>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>用户信息</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 100px auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .info {
            font-size: 18px;
            color: #555;
            margin: 10px 0;
        }

        .info strong {
            color: #333;
        }

        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 25px;
            font-size: 16px;
            color: white;
            background-color: #4CAF50;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            width: 100%;
            text-align: center;
        }

        .btn:hover {
            background-color: #45a049;
        }

        .logout-link {
            margin-top: 20px;
        }

        .logout-link a {
            color: #4CAF50;
            text-decoration: none;
            font-size: 16px;
        }

        .logout-link a:hover {
            text-decoration: underline;
        }

        .action-buttons {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            justify-content: space-between;
            margin-top: 30px;
        }

        .action-buttons a {
            text-decoration: none;
            color: white;
            background-color: #007BFF;
            padding: 12px 25px;
            border-radius: 4px;
            flex: 1 1 calc(33% - 10px);
            text-align: center;
        }

        .action-buttons a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>欢迎, <%= yonghu.getName() %></h1>

    <div class="info">
        <strong>住户类型:</strong> <strong><%= yonghu.getUserType() %></strong>
    </div>

    <div class="action-buttons">
        <!-- 添加缴费功能按钮 -->
        <a href="paymentPage.jsp" class="btn">缴费</a>
        <!-- 添加查看历史缴费记录按钮 -->
        <a href="viewPaymentHistory.jsp" class="btn">查看历史缴费记录</a>
        <!-- 添加查询收费标准按钮 -->
        <a href="viewFeeStandards.jsp" class="btn">查询收费标准</a>
        <!-- 添加查看余额按钮 -->
        <a href="viewBalance.jsp" class="btn">查看余额</a> <!-- 新增查看余额按钮 -->
    </div>

    <div class="logout-link">
        <a href="index.jsp">退出登录</a>
    </div>
</div>

</body>
</html>
