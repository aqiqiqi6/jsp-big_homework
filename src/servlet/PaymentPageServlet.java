package servlet;

import dao.FeeStandardDAO;
import model.FeeStandard;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/paymentPage")
public class PaymentPageServlet extends HttpServlet {
    private FeeStandardDAO feeStandardDAO = new FeeStandardDAO();

//    @Override
////    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        try {
//            List<FeeStandard> feeStandards = feeStandardDAO.getFeeStandards();
//            req.setAttribute("feeStandards", feeStandards);
//            req.getRequestDispatcher("paymentPage.jsp").forward(req, resp);
//        } catch (Exception e) {
//            e.printStackTrace();
//            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "加载收费标准失败");
//        }
//    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<FeeStandard> feeStandards = feeStandardDAO.getFeeStandards();
            System.out.println("Fee Standards: " + feeStandards); // 调试输出
            req.setAttribute("feeStandards", feeStandards);
            req.getRequestDispatcher("paymentPage.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "加载收费标准失败");
        }
    }

}
