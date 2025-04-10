package com.example.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.example.model.Customer;

public class CustomerDAOUpdate {
    private String jdbcURL = "jdbc:mysql://localhost:3306/project";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    public CustomerDAOUpdate() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public boolean updateCustomer(Customer customer) {
        String sql = "UPDATE customer SET CustomerName=?, TotalLifetimeValue=?, AverageOrderValue=?, CustomerSegmentCategory=? WHERE CustomerID=?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, customer.getCustomerName());
            statement.setDouble(2, customer.getTotalLifetimeValue());
            statement.setDouble(3, customer.getAverageOrderValue());
            statement.setString(4, customer.getCustomerSegmentCategory());
            statement.setInt(5, customer.getCustomerID());
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
