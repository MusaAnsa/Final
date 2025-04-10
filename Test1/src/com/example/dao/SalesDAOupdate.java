package com.example.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.example.model.Sales;

public class SalesDAOupdate {
    private String jdbcURL = "jdbc:mysql://localhost:3306/project";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    public SalesDAOupdate() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public boolean updateSales(Sales sales) {
        String sql = "UPDATE sales SET SalespersonName = ?, Target = ?, NumberOfUnits = ?, NumberOfUnitsSold = ?, CompletionStatus = ? WHERE SalesID = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, sales.getSalespersonName());
            statement.setInt(2, sales.getTarget());
            statement.setInt(3, sales.getNumberOfUnits());
            statement.setInt(4, sales.getNumberOfUnitsSold());
            statement.setString(5, sales.getCompletionStatus());
            statement.setInt(6, sales.getSalesID());
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
