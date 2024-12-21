<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.YonghuDAO" %>
<%@ page import="model.Yonghu" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>用户信息</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1000px;
            margin: 50px auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
            font-size: 18px;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        td {
            font-size: 16px;
            color: #333;
        }

        .text-muted {
            color: #888 !important;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>用户信息列表</h1>
    <table>
        <thead>
        <tr>
            <th>姓名</th>
            <th>楼号</th>
            <th>单元号</th>
            <th>房间号</th>
            <th>用户类型</th>
            <th>车牌号</th>
            <th>手机号</th>
            <th>水费余额</th>
            <th>电费余额</th>
        </tr>
        </thead>
        <tbody>
        <%
            YonghuDAO yonghuDAO = new YonghuDAO();
            List<Yonghu> userList = yonghuDAO.getAllUserDetails();
            if (userList != null && !userList.isEmpty()) {
                for (Yonghu user : userList) {
        %>
        <tr>
            <td><%= user.getName() %></td>
            <td><%= user.getBuildingNumber() %></td>
            <td><%= user.getUnitNumber() %></td>
            <td><%= user.getRoomNumber() %></td>
            <td><%= user.getUserType() %></td>
            <td><%= user.getCarNumber() %></td>
            <td><%= user.getPhoneNumber() %></td>
            <td><%= user.getWaterBalance() %></td>
            <td><%= user.getElectricityBalance() %></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="9" class="text-center text-muted">暂无用户信息</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
