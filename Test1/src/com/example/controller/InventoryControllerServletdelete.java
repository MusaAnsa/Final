package com.example.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.example.dao.InventoryDAODelete;
import com.example.model.InventoryItem;

public class InventoryControllerServletdelete extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieving form data
        String itemID = request.getParameter("ItemID");

        // Creating InventoryItem object
        InventoryItem item = new InventoryItem();
        item.setItemID(itemID);

        // Delete item from the database
        InventoryDAODelete inventoryDAO = new InventoryDAODelete();
        boolean isSuccess = inventoryDAO.deleteItem(itemID);

        if (isSuccess) {
            // If the deletion is successful, dispatch to success.jsp
            request.setAttribute("successMessage", "Item deleted successfully!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("success.jsp");
            dispatcher.forward(request, response);
        } else {
            // If the deletion fails, you might want to redirect or show an error message
            response.sendRedirect("inventory-delete.jsp");
        }
    }
}
