<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="dao.YonghuDAO" %>
<%@ page import="model.Yonghu" %>
<%
    // 获取当前用户信息
    Yonghu yonghu = (Yonghu) session.getAttribute("yonghu");
    if (yonghu == null) {
        response.sendRedirect("YonghuLogin.jsp");
        return;
    }

    // 使用 YonghuDAO 获取用户余额信息
    double[] balances = YonghuDAO.getYonghuBalanceById(yonghu.getId());
    double waterBalance = balances != null ? balances[0] : 0.0;
    double electricityBalance = balances != null ? balances[1] : 0.0;
%>

<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>用户余额查询</title>
    <style>
        .container {
            width: 80%;
            margin: 50px auto;
            padding: 20px;
            border-radius: 8px;
            background-color: #f9f9f9;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
            font-size: 28px;
            margin-bottom: 20px;
        }
        .balance {
            font-size: 18px;
            margin-bottom: 15px;
            padding: 10px;
            background-color: #e3f7e5;
            border-radius: 5px;
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>
<body>

<div class="container">
    <h2><%= yonghu.getName() %>的余额信息</h2>

    <div class="balance">
        <span>水费余额：</span>
        <span><%= waterBalance %> 元</span>
    </div>

    <div class="balance">
        <span>电费余额：</span>
        <span><%= electricityBalance %> 元</span>
    </div>

</div>

</body>
</html>