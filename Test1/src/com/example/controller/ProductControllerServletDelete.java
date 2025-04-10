package com.example.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.example.dao.ProductDAODelete;

public class ProductControllerServletDelete extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve ProductID parameter from request
        int productID = Integer.parseInt(request.getParameter("ProductID"));

        // Delete product using ProductDAODelete
        ProductDAODelete productDAO = new ProductDAODelete();
        boolean isSuccess = productDAO.deleteProduct(productID);

        if (isSuccess) {
            // If deletion is successful, dispatch to success.jsp
            request.getRequestDispatcher("success.jsp").forward(request, response);
        } else {
            // If deletion fails, dispatch to error.jsp or handle accordingly
            response.sendRedirect("product-delete.jsp");
        }
    }
}
