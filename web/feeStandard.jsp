<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.FeeStandardDAO" %>
<%@ page import="model.FeeStandard" %>
<%
    FeeStandardDAO feeStandardDAO = new FeeStandardDAO();
    List<FeeStandard> feeStandards = feeStandardDAO.getFeeStandards();
%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>物业管理系统 - 收费标准</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 900px;
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        td {
            background-color: #f9f9f9;
        }

        input[type="text"],
        input[type="number"] {
            width: 150px;
            padding: 8px;
            margin: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        .form-container {
            margin-top: 20px;
            text-align: center;
        }

        .form-container input[type="text"],
        .form-container input[type="number"] {
            width: 200px;
            margin-right: 10px;
        }

        .form-container button {
            padding: 10px;
            background-color: #2196F3;
        }

        .form-container button:hover {
            background-color: #1e88e5;
        }

        .logout {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #4CAF50;
        }

        .logout a {
            text-decoration: none;
            color: #4CAF50;
        }

        .logout a:hover {
            text-decoration: underline;
        }

        .tips {
            background-color: #fffae6;
            border: 1px solid #ffe5a3;
            padding: 15px;
            border-radius: 5px;
            margin-top: 20px;
            margin-bottom: 20px;
            color: #666;
        }

        .tips h4 {
            margin-top: 0;
            color: #333;
        }

        .tips ul {
            padding-left: 20px;
            margin: 0;
        }

        .tips li {
            margin-bottom: 5px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>收费标准</h2>

    <!-- 提示信息 -->
    <div class="tips">
        <h4>温馨提示：表中均为单价</h4>
        <ul>
            <li>水费：单价以吨</li>
            <li>电费：单价以千瓦时</li>
            <li>停车费：单价以小时</li>
            <li>暖气费：单价为季</li>
        </ul>
    </div>

    <!-- 新增收费标准表单 -->
    <div class="form-container">
        <h3>添加新的收费标准</h3>
        <form action="addFeeStandard" method="post">
            <input type="text" name="name" placeholder="标准名称" required>
            <input type="number" step="0.01" name="price" placeholder="价格" required>
            <button type="submit">添加</button>
        </form>
    </div>

    <!-- 显示收费标准 -->
    <table>
        <tr>
            <th>项目</th>
            <th>价格</th>
            <th>操作</th>
        </tr>
        <% for (FeeStandard fee : feeStandards) { %>
        <tr>
            <td><%= fee.getName() %></td>
            <td><%= fee.getPrice() %></td>
            <td>
                <!-- 更新收费标准表单 -->
                <form action="updateFeeStandard" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="<%= fee.getId() %>">
                    <input type="text" name="name" value="<%= fee.getName() %>" required>
                    <input type="number" name="price" value="<%= fee.getPrice() %>" step="0.01" required>
                    <button type="submit">更新</button>
                </form>

                <!-- 删除收费标准表单 -->
                <form action="deleteFeeStandard" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="<%= fee.getId() %>">
                    <button type="submit" onclick="return confirm('确定要删除此项收费标准吗？')">删除</button>
                </form>
            </td>
        </tr>
        <% } %>
    </table>

    <!-- 退出登录 -->
    <div class="logout">
        <a href="index.jsp">退出登录</a>
    </div>
</div>

</body>
</html>
