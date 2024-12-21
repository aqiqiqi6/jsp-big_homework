<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>收费标准</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
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
            font-size: 18px;
        }

        td {
            background-color: #f9f9f9;
            font-size: 16px;
        }

        .footer {
            text-align: center;
            margin-top: 20px;
            color: #4CAF50;
        }

        .footer a {
            text-decoration: none;
            color: #4CAF50;
            font-size: 16px;
        }

        .footer a:hover {
            text-decoration: underline;
        }

        .info {
            font-size: 18px;
            margin-top: 20px;
            color: #555;
        }

        .info strong {
            color: #333;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>收费标准</h2>

    <table>
        <tr>
            <th>收费项目</th>
            <th>单价</th>
            <th>单位</th>
        </tr>
        <tr>
            <td>水费</td>
            <td>3.00</td>
            <td>每吨</td>
        </tr>
        <tr>
            <td>电费</td>
            <td>0.50</td>
            <td>千瓦时</td>
        </tr>
        <tr>
            <td>停车费</td>
            <td>10.00</td>
            <td>每小时</td>
        </tr>
        <tr>
            <td>暖气费</td>
            <td>200.00</td>
            <td>每季</td>
        </tr>
    </table>

    <div class="footer">
        <a href="YonghuDashboard.jsp">返回首页</a>
    </div>
</div>

</body>
</html>
