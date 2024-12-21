package servlet;

import dao.FeeStandardDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteFeeStandard")
public class DeleteFeeStandardServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr != null) {
            int id = Integer.parseInt(idStr);

            FeeStandardDAO feeStandardDAO = new FeeStandardDAO();
            try {
                feeStandardDAO.deleteFeeStandard(id);
                response.setStatus(HttpServletResponse.SC_OK); // 设置200状态码
                response.getWriter().write("删除成功");
                response.sendRedirect("feeStandard.jsp");
            } catch (Exception e) {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 设置500状态码
                response.getWriter().write("删除失败");
            }
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 设置400状态码
            response.getWriter().write("无效的ID");
        }
    }
}
