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

    // 获取用户ID
    int userId = yonghu.getId();  // 假设 getUserId() 返回用户ID
%>

<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>用户缴费</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 400px;
            padding: 20px;
            box-sizing: border-box;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            font-size: 16px;
            color: #555;
        }
        select, input[type="number"], input[type="text"] {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        input[type="number"]:focus, input[type="text"]:focus, select:focus {
            border-color: #007BFF;
            outline: none;
        }
        .result {
            margin-top: 20px;
            font-size: 18px;
            font-weight: bold;
            color: #333;
            text-align: center;
        }
        button {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #218838;
        }
        .form-group input[type="number"], .form-group select {
            margin-top: 5px;
        }
        .payment-method {
            margin-top: 30px;
        }
        .payment-method label {
            display: block;
            font-size: 16px;
            margin-bottom: 10px;
        }
        .payment-method input[type="radio"] {
            margin-right: 10px;
        }
        .qr-code {
            display: none;
            text-align: center;
            margin-top: 20px;
        }
        .qr-code img {
            width: 200px;
            height: 200px;
            border-radius: 8px;
        }
    </style>
    <script>
        function calculateTotal() {
            const price = parseFloat(document.getElementById("price").value || 0);
            const quantity = parseFloat(document.getElementById("quantity").value || 0);
            const total = price * quantity;
            document.getElementById("total").innerText = `总费用: ¥${total.toFixed(2)}`;
        }

        // 显示二维码
        function toggleQRCode(paymentMethod) {
            if (paymentMethod === 'wechat') {
                document.getElementById("wechatQRCode").style.display = "block";
                document.getElementById("alipayQRCode").style.display = "none";
            } else if (paymentMethod === 'alipay') {
                document.getElementById("alipayQRCode").style.display = "block";
                document.getElementById("wechatQRCode").style.display = "none";
            } else {
                document.getElementById("wechatQRCode").style.display = "none";
                document.getElementById("alipayQRCode").style.display = "none";
            }
        }
    </script>
</head>
<body>

<div class="container">
    <h1>用户缴费</h1>
    <form action="PaymentServlet" method="post">
        <div class="form-group">
            <label for="item">选择项目:</label>
            <select id="item" name="item" onchange="document.getElementById('price').value = this.options[this.selectedIndex].dataset.price; calculateTotal()" required>
                <option value="">--请选择--</option>
                <option value="水费" data-price="3.00">水费 (单价: ¥3.00/吨)</option>
                <option value="电费" data-price="0.50">电费 (单价: ¥0.50/千瓦时)</option>
                <option value="停车费" data-price="10.00">停车费 (单价: ¥10.00/小时)</option>
                <option value="暖气费" data-price="200.00">暖气费 (单价: ¥200.00/季)</option>
            </select>
        </div>
        <div class="form-group">
            <label for="quantity">输入数量:</label>
            <input type="number" id="quantity" name="quantity" oninput="calculateTotal()" required>
        </div>
        <div class="form-group">
            <label for="price">单价:</label>
            <input type="text" id="price" name="price" readonly>
        </div>
        <div class="result" id="total">总费用: ¥0.00</div>

        <!-- 添加隐藏的用户ID字段 -->
        <input type="hidden" name="user_id" value="<%= userId %>">

        <!-- 支付方式选择 -->
        <div class="payment-method">
            <label>
                <input type="radio" name="paymentMethod" value="direct" onclick="toggleQRCode('none')" required> 直接支付
            </label>
            <label>
                <input type="radio" name="paymentMethod" value="wechat" onclick="toggleQRCode('wechat')"> 微信支付
            </label>
            <label>
                <input type="radio" name="paymentMethod" value="alipay" onclick="toggleQRCode('alipay')"> 支付宝
            </label>

            <!-- 微信支付二维码 -->
            <div id="wechatQRCode" class="qr-code">
                <img src="./wechat_qr-code.png" alt="微信支付二维码">
            </div>

            <!-- 支付宝二维码 -->
            <div id="alipayQRCode" class="qr-code">
                <img src="./alipay_qr-code.png" alt="支付宝二维码">
            </div>
        </div>

        <div class="form-group">
            <button type="submit">提交缴费</button>
        </div>
    </form>
</div>

</body>
</html>
