package com.example.dao;

import com.example.model.InventoryItem;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class InventoryShowDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/project";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String SELECT_ALL_ITEMS = "SELECT * FROM inventory";

    public InventoryShowDAO() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public List<InventoryShowDAO> selectAllItems() {
        List<InventoryShowDAO> items = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ITEMS)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int itemID = rs.getInt("ItemID");
                String itemName = rs.getString("ItemName");
                int quantity = rs.getInt("Quantity");
                int availableQuantity = rs.getInt("AvailableQuantity");
                int daysOfSupply = rs.getInt("DaysOfSupply");
                String recentSalesTrend = rs.getString("RecentSalesTrend");
                int minimumStockLevel = rs.getInt("MinimumStockLevel");
//                items.add(new InventoryItem());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return items;
    }
}
