package com.example.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.example.model.Customer;
import com.example.dao.CustomerDAO;

public class CustomerControllerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
    	int customerID = Integer.parseInt(request.getParameter("CustomerID"));
        String customerName = request.getParameter("CustomerName");
        double totalLifetimeValue = Double.parseDouble(request.getParameter("TotalLifetimeValue"));
        double averageOrderValue = Double.parseDouble(request.getParameter("AverageOrderValue"));
        String customerSegmentCategory = request.getParameter("CustomerSegmentCategory");

        // Create a new Customer object and set its properties
        Customer customer = new Customer();
        customer.setCustomerID(customerID);
        customer.setCustomerName(customerName);
        customer.setTotalLifetimeValue(totalLifetimeValue);
        customer.setAverageOrderValue(averageOrderValue);
        customer.setCustomerSegmentCategory(customerSegmentCategory);

        // Insert customer data into the database
        CustomerDAO customerDAO = new CustomerDAO();
        boolean isSuccess = customerDAO.insertCustomer(customer);

        if (isSuccess) {
            // If the insert is successful, dispatch to success.jsp
            request.setAttribute("successMessage", "Customer data inserted successfully!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("success.jsp");
            dispatcher.forward(request, response);
        } else {
            // If the insert fails, you might want to redirect or show an error message
            response.sendRedirect("customer-insert.jsp");
        }
    }
}
