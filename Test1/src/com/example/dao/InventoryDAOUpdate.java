package com.example.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InventoryDAOUpdate {
    private String jdbcURL = "jdbc:mysql://localhost:3306/project";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    public InventoryDAOUpdate() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public boolean updateItem(String itemID, String itemName, int quantity, int availableQuantity, int daysOfSupply, String recentSalesTrend, int minimumStockLevel) {
        String sql = "UPDATE inventory SET ItemName = ?, Quantity = ?, AvailableQuantity = ?, DaysOfSupply = ?, RecentSalesTrend = ?, MinimumStockLevel = ? WHERE ItemID = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, itemName);
            statement.setInt(2, quantity);
            statement.setInt(3, availableQuantity);
            statement.setInt(4, daysOfSupply);
            statement.setString(5, recentSalesTrend);
            statement.setInt(6, minimumStockLevel);
            statement.setString(7, itemID);
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
