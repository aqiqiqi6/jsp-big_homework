package servlet;

import dao.YonghuDAO;
import model.Yonghu;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/yonghuRegister")
public class YonghuRegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // 获取用户注册信息
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String name = request.getParameter("name");
        String buildingNumber = request.getParameter("buildingNumber");
        String unitNumber = request.getParameter("unitNumber");
        String roomNumber = request.getParameter("roomNumber");
        String userType = request.getParameter("userType");
        String carNumber = request.getParameter("carNumber");
        String phoneNumber = request.getParameter("phoneNumber");

        // 验证密码和确认密码是否匹配
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "密码和确认密码不匹配");
            request.getRequestDispatcher("YonghuRegister.jsp").forward(request, response);
            return;
        }

        // 创建用户对象并设置属性
        Yonghu yonghu = new Yonghu();
        yonghu.setUsername(username);
        yonghu.setPassword(password); // 注意：应在此处对密码进行加密存储
        yonghu.setName(name);
        yonghu.setBuildingNumber(buildingNumber);
        yonghu.setUnitNumber(unitNumber);
        yonghu.setRoomNumber(roomNumber);
        yonghu.setUserType(userType);
        yonghu.setCarNumber(carNumber);
        yonghu.setPhoneNumber(phoneNumber);

        // 使用 DAO 进行数据库操作
        YonghuDAO yonghuDAO = new YonghuDAO();
        try {
            if (yonghuDAO.register(yonghu)) {
                response.sendRedirect("YonghuLogin.jsp");
            } else {
                request.setAttribute("error", "用户名已存在");
                request.getRequestDispatcher("YonghuRegister.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "注册失败，请稍后再试！");
            request.getRequestDispatcher("YonghuRegister.jsp").forward(request, response);
        }
    }
}
