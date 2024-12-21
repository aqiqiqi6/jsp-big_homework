package dao;

import model.Yonghu;
import util.DBUtil;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class YonghuDAO {
    public boolean register(Yonghu yonghu) {
        String sql = "INSERT INTO yonghu (username, password, name, building_number, unit_number, room_number, user_type, car_number, phone_number) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, yonghu.getUsername());
            pstmt.setString(2, yonghu.getPassword());
            pstmt.setString(3, yonghu.getName());
            pstmt.setString(4, yonghu.getBuildingNumber());
            pstmt.setString(5, yonghu.getUnitNumber());
            pstmt.setString(6, yonghu.getRoomNumber());
            pstmt.setString(7, yonghu.getUserType());
            pstmt.setString(8, yonghu.getCarNumber());
            pstmt.setString(9, yonghu.getPhoneNumber());

            System.out.println("Executing SQL: " + pstmt);

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Yonghu login(String username, String password) {
        String sql = "SELECT * FROM yonghu WHERE username = ? AND password = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, username);
            pstmt.setString(2, password);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Yonghu yonghu = new Yonghu();
                    yonghu.setId(rs.getInt("id"));
                    yonghu.setUsername(rs.getString("username"));
                    yonghu.setName(rs.getString("name"));
                    yonghu.setBuildingNumber(rs.getString("building_number"));
                    yonghu.setUnitNumber(rs.getString("unit_number"));
                    yonghu.setRoomNumber(rs.getString("room_number"));
                    yonghu.setUserType(rs.getString("user_type"));
                    yonghu.setCarNumber(rs.getString("car_number"));
                    yonghu.setPhoneNumber(rs.getString("phone_number"));
                    return yonghu;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    /**
     * 获取用户的余额
     *
     * @param userId 用户ID
     * @return 包含用户水费余额和电费余额的数组，[0] 为水费余额, [1] 为电费余额；如果用户不存在返回 null
     */
    public static double[] getYonghuBalanceById(int userId) {
        String sql = "SELECT water_balance, electricity_balance FROM yonghu WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, userId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    double waterBalance = rs.getDouble("water_balance");
                    double electricityBalance = rs.getDouble("electricity_balance");
                    return new double[]{waterBalance, electricityBalance};
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static boolean updateBalance(int userId, double amount, String item) {
        String sql = "";
        if ("水费".equalsIgnoreCase(item)) {
            sql = "UPDATE yonghu SET water_balance = water_balance + ? WHERE id = ?";
        } else if ("电费".equalsIgnoreCase(item)) {
            sql = "UPDATE yonghu SET electricity_balance = electricity_balance + ? WHERE id = ?";
        } else {
            return false;  // 无效的项目
        }

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setDouble(1, amount);
            pstmt.setInt(2, userId);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    // 获取所有用户详细信息（除用户名和密码）
    public List<Yonghu> getAllUserDetails() {
        String sql = "SELECT name, building_number, unit_number, room_number, user_type, car_number, phone_number, water_balance, electricity_balance FROM yonghu";
        List<Yonghu> userList = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Yonghu yonghu = new Yonghu();
                yonghu.setName(rs.getString("name"));
                yonghu.setBuildingNumber(rs.getString("building_number"));
                yonghu.setUnitNumber(rs.getString("unit_number"));
                yonghu.setRoomNumber(rs.getString("room_number"));
                yonghu.setUserType(rs.getString("user_type"));
                yonghu.setCarNumber(rs.getString("car_number"));
                yonghu.setPhoneNumber(rs.getString("phone_number"));
                yonghu.setWaterBalance(rs.getBigDecimal("water_balance"));
                yonghu.setElectricityBalance(rs.getBigDecimal("electricity_balance"));
                userList.add(yonghu);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userList;
    }


}
