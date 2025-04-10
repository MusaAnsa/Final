package com.example.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.example.dao.CustomerDAODelete;

public class CustomerControllerServletDelete extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve customer ID from the request parameter
        int customerID = Integer.parseInt(request.getParameter("CustomerID"));

        // Delete customer data from the database
        CustomerDAODelete customerDAO = new CustomerDAODelete();
        boolean isSuccess = customerDAO.deleteCustomer(customerID);

        if (isSuccess) {
            // If the deletion is successful, dispatch to success.jsp
            request.setAttribute("successMessage", "Customer data deleted successfully!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("success.jsp");
            dispatcher.forward(request, response);
        } else {
            // If the deletion fails, you might want to redirect or show an error message
            response.sendRedirect("customer-delete.jsp");
        }
    }
}
