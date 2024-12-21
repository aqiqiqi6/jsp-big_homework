package servlet;

import dao.FeeStandardDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updateFeeStandard")
public class UpdateFeeStandardServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));

        FeeStandardDAO dao = new FeeStandardDAO();
        try {
            if (dao.updateFeeStandard(id, name, price)) {
                response.sendRedirect("feeStandard.jsp");
            } else {
                request.setAttribute("error", "Update failed!");
                request.getRequestDispatcher("feeStandard.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
