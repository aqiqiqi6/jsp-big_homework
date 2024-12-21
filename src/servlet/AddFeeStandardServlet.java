package servlet;
import dao.FeeStandardDAO;

import model.FeeStandard;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;

@WebServlet("/addFeeStandard")
public class AddFeeStandardServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        // 获取请求参数
        String name = request.getParameter("name");
        String priceStr = request.getParameter("price");

        // 参数校验
        if (name == null || name.trim().isEmpty()) {
            request.setAttribute("error", "标准名称不能为空！");
            request.getRequestDispatcher("addFeeStandard.jsp").forward(request, response);
            return;
        }

        double price = 0.0;
        try {
            price = Double.parseDouble(priceStr);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "价格格式不正确！");
            request.getRequestDispatcher("addFeeStandard.jsp").forward(request, response);
            return;
        }

        // 创建 FeeStandard 对象并设置其属性
        FeeStandard feeStandard = new FeeStandard();
        feeStandard.setName(name);
        feeStandard.setPrice(BigDecimal.valueOf(price));

        FeeStandardDAO feeStandardDAO = new FeeStandardDAO();

        try {
            // 调用 DAO 方法插入数据到数据库
            boolean success = feeStandardDAO.addFeeStandard(feeStandard);
            if (success) {
                // 操作成功，跳转回收费标准页面
                response.sendRedirect("feeStandard.jsp");
            } else {
                // 如果插入失败，传递错误信息
                request.setAttribute("error", "添加缴费标准失败，请重试！");
                request.getRequestDispatcher("addFeeStandard.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // 数据库操作失败时返回错误信息
            request.setAttribute("error", "数据库操作失败，请重试！");
            request.getRequestDispatcher("addFeeStandard.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            // 其他未知错误
            request.setAttribute("error", "发生未知错误，请重试！");
            request.getRequestDispatcher("addFeeStandard.jsp").forward(request, response);
        }
    }

}

