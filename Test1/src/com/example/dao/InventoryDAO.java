package com.example.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.example.model.InventoryItem;

public class InventoryDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/project";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    public InventoryDAO() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public boolean insertItem(InventoryItem item) {
        String sql = "INSERT INTO inventory (ItemID, ItemName, Quantity, AvailableQuantity, DaysOfSupply, RecentSalesTrend, MinimumStockLevel) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, item.getItemID());
            statement.setString(2, item.getItemName());
            statement.setInt(3, item.getQuantity());
            statement.setInt(4, item.getAvailableQuantity());
            statement.setInt(5, item.getDaysOfSupply());
            statement.setString(6, item.getRecentSalesTrend());
            statement.setInt(7, item.getMinimumStockLevel());
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
