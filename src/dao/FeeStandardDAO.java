package dao;

import model.FeeStandard;
import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FeeStandardDAO {
    public List<FeeStandard> getFeeStandards() throws Exception {
        List<FeeStandard> list = new ArrayList<>();
        String sql = "SELECT * FROM fee_standard";
        try (Connection conn = DBUtil.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                // 调试日志，确保数据从数据库中读取出来
//                System.out.println("ID: " + rs.getInt("id"));
//                System.out.println("Name: " + rs.getString("name"));
//                System.out.println("Price: " + rs.getBigDecimal("price"));

                // 创建 FeeStandard 对象
                FeeStandard feeStandard = new FeeStandard(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getBigDecimal("price")
                );
                list.add(feeStandard);
            }
        }
        return list;
    }


    public boolean updateFeeStandard(int id, String name, double price) throws Exception {
        String sql = "UPDATE fee_standard SET name = ?, price = ? WHERE id = ?";
        try (Connection conn = DBUtil.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, name);
            stmt.setDouble(2, price);
            stmt.setInt(3, id);
            return stmt.executeUpdate() > 0;
        }
    }
    // 添加新的收费标准
    public boolean addFeeStandard(FeeStandard feeStandard) throws SQLException {
        String sql = "INSERT INTO fee_standard (name, price) VALUES (?, ?)";
        try (Connection conn = DBUtil.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, feeStandard.getName());
            stmt.setDouble(2, feeStandard.getPrice().doubleValue());
            return stmt.executeUpdate() > 0;
        }
    }

    // 删除收费标准的方法
    public void deleteFeeStandard(int id) throws Exception {
        String sql = "DELETE FROM fee_standard WHERE id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
        System.out.println("example1");
        System.out.println("example2");
        System.out.println("example3");
    }

}
