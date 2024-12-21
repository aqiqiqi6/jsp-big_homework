package servlet;

import dao.PaymentRecordDAO;
import dao.YonghuDAO;
import model.PaymentRecord;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            // 获取表单数据
            String item = request.getParameter("item");
            String quantityStr = request.getParameter("quantity");
            String priceStr = request.getParameter("price");
            String userIdStr = request.getParameter("user_id");

            // 校验输入数据
            if (item == null || quantityStr == null || priceStr == null || userIdStr == null) {
                throw new IllegalArgumentException("请求参数不完整");
            }

            double quantity = Double.parseDouble(quantityStr);
            double price = Double.parseDouble(priceStr);
            int userId = Integer.parseInt(userIdStr);

            // 计算总金额
            double totalAmount = price * quantity;

            // 创建 PaymentRecord 对象
            PaymentRecord record = new PaymentRecord();
            record.setUserId(userId);
            record.setItemName(item);
            record.setQuantity(quantity);
            record.setTotalAmount(totalAmount);

            // 保存支付记录到数据库
            boolean isSaved = PaymentRecordDAO.savePaymentRecord(record);

            if (isSaved) {
                // 更新余额
                boolean isBalanceUpdated = YonghuDAO.updateBalance(userId, totalAmount, item);


                // 检查余额更新结果
                if (isBalanceUpdated) {
                    // 跳转到支付成功页面
                    request.setAttribute("item", item);
                    request.setAttribute("totalAmount", totalAmount);
                    request.getRequestDispatcher("/payment_success.jsp").forward(request, response);
                } else {
                    throw new RuntimeException("余额更新失败");
                }
            } else {
                throw new RuntimeException("支付记录保存失败");
            }

        } catch (NumberFormatException e) {
            // 参数解析错误
            e.printStackTrace();
            request.setAttribute("errorMessage", "输入的参数格式错误！请检查后重新提交。");
            request.getRequestDispatcher("/payment_failure.jsp").forward(request, response);
        } catch (IllegalArgumentException e) {
            // 参数校验失败
            e.printStackTrace();
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("/payment_failure.jsp").forward(request, response);
        } catch (Exception e) {
            // 其他异常
            e.printStackTrace();
            request.setAttribute("errorMessage", "系统发生错误，请稍后重试！");
            request.getRequestDispatcher("/payment_failure.jsp").forward(request, response);
        }
    }
}
