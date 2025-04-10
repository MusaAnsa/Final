package com.example.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.example.dao.InventoryDAO;
import com.example.dao.InventoryDAOUpdate;
import com.example.model.InventoryItem;

public class InventoryControllerServlet extends HttpServlet {
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

        // Inserting item into database
        InventoryDAO inventoryDAO = new InventoryDAO();
       // InventoryDAOUpdate update = new InventoryDAOUpdate();
        
        
        boolean isSuccess = inventoryDAO.insertItem(item);
        if (isSuccess) {
            request.setAttribute("successMessage", "Item added successfully!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("success.jsp");
            dispatcher.forward(request, response);
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("inventory-insert.jsp");
            dispatcher.forward(request, response);
        }
        
    //    boolean isUpdate = update.updateItem(itemID, itemName, quantity, availableQuantity, daysOfSupply, recentSalesTrend, minimumStockLevel);
        		
        
        // Forwarding to success.jsp or home.jsp based on insertion result
       
    
    
    
}
}
