<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>管理员主页</title>
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
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            color: #333;
        }

        .btn {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            background-color: #4CAF50;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            width: 80%;
            text-align: center;
        }

        .btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>管理员主页</h1>
    <a href="feeStandard.jsp" class="btn">设置收费标准</a>
    <a href="viewPaymentRecords.jsp" class="btn">查询业主缴费记录</a>
    <a href="YonghuInfo.jsp" class="btn">查询用户信息</a> <!-- 新增按钮 -->
</div>

</body>
</html>
