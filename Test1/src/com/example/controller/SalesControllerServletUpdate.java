package com.example.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.example.dao.SalesDAOupdate;
import com.example.model.Sales;

public class SalesControllerServletUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieving form data
        int salesID = Integer.parseInt(request.getParameter("SalesID"));
        String salespersonName = request.getParameter("SalespersonName");
        int target = Integer.parseInt(request.getParameter("Target"));
        int numberOfUnits = Integer.parseInt(request.getParameter("NumberOfUnits"));
        int numberOfUnitsSold = Integer.parseInt(request.getParameter("NumberOfUnitsSold"));
        String completionStatus = request.getParameter("CompletionStatus");

        // Creating Sales object
        Sales sales = new Sales();
        sales.setSalesID(salesID);
        sales.setSalespersonName(salespersonName);
        sales.setTarget(target);
        sales.setNumberOfUnits(numberOfUnits);
        sales.setNumberOfUnitsSold(numberOfUnitsSold);
        sales.setCompletionStatus(completionStatus);

        // Update sales data in the database
        SalesDAOupdate salesDAO = new SalesDAOupdate();
        boolean isSuccess = salesDAO.updateSales(sales);

        if (isSuccess) {
            // If the update is successful, dispatch to success.jsp
            request.setAttribute("successMessage", "Sales data updated successfully!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("success.jsp");
            dispatcher.forward(request, response);
        } else {
            // If the update fails, you might want to redirect or show an error message
            response.sendRedirect("sales-update.jsp");
        }
    }
}
