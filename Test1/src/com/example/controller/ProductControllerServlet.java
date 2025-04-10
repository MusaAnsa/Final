package com.example.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.example.dao.ProductDAO;
import com.example.model.Product;

public class ProductControllerServlet extends HttpServlet {
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

        // Insert the product into the database using ProductDAO
        ProductDAO productDAO = new ProductDAO();
        boolean isSuccess = productDAO.insertProduct(product);

        if (isSuccess) {
            // If the insertion is successful, dispatch to home.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("success.jsp");
            dispatcher.forward(request, response);
        } else {
            // If the insertion fails, you might want to redirect or show an error message
            response.sendRedirect("product-insert.jsp");
        }
    }
}
