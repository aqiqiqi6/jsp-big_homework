package dao;

import model.PaymentRecord;
import model.UserBalances;
import util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PaymentRecordDAO {

    // 使用 DBUtil 获取数据库连接
    public static boolean savePaymentRecord(PaymentRecord record) {
        String sql = "INSERT INTO payment_records (user_id, item_name, quantity, total_amount) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();  // 获取数据库连接
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // 设置 SQL 语句中的参数
            stmt.setInt(1, record.getUserId());
            stmt.setString(2, record.getItemName());
            stmt.setDouble(3, record.getQuantity());
            stmt.setDouble(4, record.getTotalAmount());

            // 执行 SQL 插入语句
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;  // 如果插入成功，返回 true
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 根据 userId 查询缴费记录
    public static List<PaymentRecord> getPaymentRecordsByUserId(int userId) {
        List<PaymentRecord> records = new ArrayList<>();
        String sql = "SELECT * FROM payment_records WHERE user_id = ? ORDER BY id DESC";

        try (Connection conn = DBUtil.getConnection();  // 获取数据库连接
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);  // 设置查询条件：用户ID

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    PaymentRecord record = new PaymentRecord();
                    record.setUserId(rs.getInt("user_id"));
                    record.setItemName(rs.getString("item_name"));
                    record.setQuantity(rs.getDouble("quantity"));
                    record.setTotalAmount(rs.getDouble("total_amount"));
                    record.setPaymentTime(rs.getTimestamp("payment_time"));  // 使用 getTimestamp() 获取时间字段

                    records.add(record);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return records;  // 返回查询结果列表
    }

    public static List<PaymentRecord> getAllPaymentRecords() {
        List<PaymentRecord> records = new ArrayList<>();
        String sql = "SELECT * FROM payment_records ORDER BY id DESC";  // 查询所有记录，按 ID 降序排列

        try (Connection conn = DBUtil.getConnection();  // 获取数据库连接
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                PaymentRecord record = new PaymentRecord();
                record.setUserId(rs.getInt("user_id"));
                record.setItemName(rs.getString("item_name"));
                record.setQuantity(rs.getDouble("quantity"));
                record.setTotalAmount(rs.getDouble("total_amount"));

                // 获取支付时间并设置到 PaymentRecord 中
                Timestamp paymentTime = rs.getTimestamp("payment_time");
                if (paymentTime != null) {
                    record.setPaymentTime(new Date(paymentTime.getTime()));  // 将 Timestamp 转为 Date
                }

                records.add(record);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return records;  // 返回查询到的所有记录
    }
}
