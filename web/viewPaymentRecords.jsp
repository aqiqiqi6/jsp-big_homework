<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.PaymentRecord" %>
<%@ page import="dao.PaymentRecordDAO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%
    // 获取所有的缴费记录
    PaymentRecordDAO paymentRecordDAO = new PaymentRecordDAO();
    List<PaymentRecord> paymentRecords = paymentRecordDAO.getAllPaymentRecords();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // 设置日期格式
%>

<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>所有用户的缴费记录</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 30px auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            font-size: 28px;
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

        .footer {
            text-align: center;
            margin-top: 30px;
        }

        .footer a {
            text-decoration: none;
            color: #4CAF50;
            font-size: 16px;
        }

        .footer a:hover {
            text-decoration: underline;
        }

        .action-buttons {
            text-align: center;
            margin-top: 20px;
        }

        .action-buttons a {
            color: #4CAF50;
            text-decoration: none;
            font-size: 16px;
        }

        .action-buttons a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>所有用户的缴费记录</h2>

    <table>
        <tr>
            <th>用户ID</th>
            <th>缴费项目</th>
            <th>数量</th>
            <th>缴费金额</th>
            <th>缴费时间</th>
        </tr>
        <%
            if (paymentRecords != null && !paymentRecords.isEmpty()) {
                for (PaymentRecord record : paymentRecords) {
        %>
        <tr>
            <td><%= record.getUserId() %></td>
            <td><%= record.getItemName() %></td>
            <td><%= record.getQuantity() %></td>
            <td><%= record.getTotalAmount() %></td>
            <td>
                <%
                    if (record.getPaymentTime() != null) {
                        out.print(sdf.format(record.getPaymentTime()));  // 格式化并显示支付时间
                    } else {
                        out.print("未设置时间");
                    }
                %>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="5" style="text-align:center;">没有记录</td>
        </tr>
        <% } %>
    </table>

    <div class="footer">
        <a href="adminDashboard.jsp">返回首页</a>
    </div>
</div>

</body>
</html>
