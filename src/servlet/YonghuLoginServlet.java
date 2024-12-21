package servlet;

import dao.YonghuDAO;
import model.Yonghu;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/yonghuLogin")
public class YonghuLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        YonghuDAO yonghuDAO = new YonghuDAO();
        try {
            Yonghu yonghu = yonghuDAO.login(username, password);
            if (yonghu != null) {
                HttpSession session = request.getSession();
                session.setAttribute("yonghu", yonghu);
                response.sendRedirect("YonghuDashboard.jsp");
            } else {
                request.setAttribute("error", "用户名或密码错误！");
                request.getRequestDispatcher("YonghuLogin.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "系统错误，请稍后再试！");
            request.getRequestDispatcher("YonghuLogin.jsp").forward(request, response);
        }
    }
}
