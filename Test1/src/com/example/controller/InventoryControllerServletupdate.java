package com.example.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.example.dao.InventoryDAOUpdate;
import com.example.model.InventoryItem;

public class InventoryControllerServletupdate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieving form data
        String itemID = request.getParameter("ItemID");
        String itemName = request.getParameter("ItemName");
        int quantity = Integer.parseInt(request.getParameter("Quantity"));
        int availableQuantity = Integer.parseInt(request.getParameter("AvailableQuantity"));
        int daysOfSupply = Integer.parseInt(request.getParameter("DaysOfSupply"));
        String recentSalesTrend = request.getParameter("RecentSalesTrend");
        int minimumStockLevel = Integer.parseInt(request.getParameter("MinimumStockLevel"));

        // Creating InventoryItem object
        InventoryItem item = new InventoryItem();
        item.setItemID(itemID);
        item.setItemName(itemName);
        item.setQuantity(quantity);
        item.setAvailableQuantity(availableQuantity);
        item.setDaysOfSupply(daysOfSupply);
        item.setRecentSalesTrend(recentSalesTrend);
        item.setMinimumStockLevel(minimumStockLevel);

        // Update item in the database
        InventoryDAOUpdate inventoryDAO = new InventoryDAOUpdate();
        boolean isSuccess = inventoryDAO.updateItem(itemID, itemName, quantity, availableQuantity, daysOfSupply, recentSalesTrend, minimumStockLevel);

        if (isSuccess) {
            // If the update is successful, dispatch to success.jsp
            request.setAttribute("successMessage", "Item updated successfully!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("success.jsp");
            dispatcher.forward(request, response);
        } else {
            // If the update fails, you might want to redirect or show an error message
            response.sendRedirect("inventory-update.jsp");
        }
    }
}
