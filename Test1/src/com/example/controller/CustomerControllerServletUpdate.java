package com.example.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.example.dao.CustomerDAOUpdate;
import com.example.model.Customer;

public class CustomerControllerServletUpdate extends HttpServlet {
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

        // Update customer data in the database
        CustomerDAOUpdate customerDAO = new CustomerDAOUpdate();
        boolean isSuccess = customerDAO.updateCustomer(customer);

        if (isSuccess) {
            // If the update is successful, dispatch to success.jsp
            request.setAttribute("successMessage", "Customer data updated successfully!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("success.jsp");
            dispatcher.forward(request, response);
        } else {
            // If the update fails, you might want to redirect or show an error message
            response.sendRedirect("customer-update.jsp");
        }
    }
}
