package com.example.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.example.dao.ProductDAOUpdate;
import com.example.model.Product;

public class ProductControllerServletUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve data from the request parameters
        int productID = Integer.parseInt(request.getParameter("ProductID"));
        String productName = request.getParameter("ProductName");
        String description = request.getParameter("Description");
        String category = request.getParameter("Category");
        double price = Double.parseDouble(request.getParameter("Price"));
        int stockLevel = Integer.parseInt(request.getParameter("StockLevel"));

        // Create a Product object with the retrieved data
        Product product = new Product();
        product.setProductID(productID);
        product.setProductName(productName);
        product.setDescription(description);
        product.setCategory(category);
        product.setPrice(price);
        product.setStockLevel(stockLevel);

        // Update the product in the database using ProductDAOUpdate
        ProductDAOUpdate productDAO = new ProductDAOUpdate();
        boolean isSuccess = productDAO.updateProduct(product);

        if (isSuccess) {
            // If the update is successful, dispatch to success.jsp
            request.getRequestDispatcher("success.jsp").forward(request, response);
        } else {
            // If the update fails, dispatch to error.jsp or handle accordingly
            response.sendRedirect("product-update.jsp");
        }
    }
}
