package com.example.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.example.dao.SalesDAODelete;

public class SalesControllerServletDelete extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieving form data
        int salesID = Integer.parseInt(request.getParameter("SalesID"));

        // Delete sales data in the database
        SalesDAODelete salesDAO = new SalesDAODelete();
        boolean isSuccess = salesDAO.deleteSales(salesID);

        if (isSuccess) {
            // If the delete is successful, dispatch to success.jsp
            request.setAttribute("successMessage", "Sales data deleted successfully!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("success.jsp");
            dispatcher.forward(request, response);
        } else {
            // If the delete fails, you might want to redirect or show an error message
            response.sendRedirect("sales-delete.jsp");
        }
    }
}
