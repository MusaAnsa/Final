package com.example.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.example.model.Sales;

public class SalesDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/project";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    public SalesDAO() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public boolean insertSales(Sales sales) {
        String sql = "INSERT INTO sales (SalesID, SalespersonName, Target, NumberOfUnits, NumberOfUnitsSold, CompletionStatus) VALUES (?,?, ?, ?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
        	statement.setInt(1, sales.getSalesID());
            statement.setString(2, sales.getSalespersonName());
            statement.setInt(3, sales.getTarget());
            statement.setInt(4, sales.getNumberOfUnits());
            statement.setInt(5, sales.getNumberOfUnitsSold());
            statement.setString(6, sales.getCompletionStatus());
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
