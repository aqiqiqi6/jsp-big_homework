<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.Yonghu" %>
<%@ page import="dao.PaymentRecordDAO" %>
<%@ page import="model.PaymentRecord" %>
<%@ page import="java.util.List" %>
<%
    // 获取当前用户信息
    Yonghu yonghu = (Yonghu) session.getAttribute("yonghu");
    if (yonghu == null) {
        response.sendRedirect("YonghuLogin.jsp");
        return;
    }

    // 获取用户的缴费记录
    PaymentRecordDAO paymentRecordDAO = new PaymentRecordDAO();
    List<PaymentRecord> paymentRecords = paymentRecordDAO.getPaymentRecordsByUserId(yonghu.getId());
%>

<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>历史缴费记录</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
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
            margin-top: 20px;
            text-align: center;
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
    <h2><%= yonghu.getName() %>的历史缴费记录</h2>

    <table>
        <tr>
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
            <td><%= record.getItemName() %></td>
            <td><%= record.getQuantity() %></td>
            <td><%= record.getTotalAmount() %></td>
            <td><%= record.getPaymentTime() %></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="3" style="text-align:center;">没有找到历史缴费记录</td>
        </tr>
        <% } %>
    </table>

    <div class="footer">
        <a href="YonghuDashboard.jsp">返回上一页</a>
    </div>

</div>

</body>
</html>
