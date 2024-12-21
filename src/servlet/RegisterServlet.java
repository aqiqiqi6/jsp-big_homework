package servlet;

import dao.UserDAO;
import model.User;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // 验证密码和确认密码是否匹配
        if (password.equals(confirmPassword)) {
            // 创建 User 对象
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);  // 密码应加密存储

            UserDAO userDAO = new UserDAO();
            try {
                // 调用 UserDAO 的 register 方法
                if (userDAO.register(user)) {
                    // 注册成功，重定向到登录页面
                    response.sendRedirect("login.jsp");
                } else {
                    // 注册失败，用户名已存在
                    request.setAttribute("error", "用户名已存在");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                }
            } catch (SQLException e) {
                // 捕获数据库异常
                e.printStackTrace();
                request.setAttribute("error", "注册失败，请稍后再试");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        } else {
            // 密码和确认密码不匹配
            request.setAttribute("error", "密码和确认密码不匹配");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
