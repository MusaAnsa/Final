package com.example.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.dao.InventoryShowDAO;

public class InventoryShowServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        InventoryShowDAO inventoryShowDAO = new InventoryShowDAO();
        List<InventoryShowDAO> items = inventoryShowDAO.selectAllItems();
        
        request.setAttribute("items", items);

        RequestDispatcher dispatcher = request.getRequestDispatcher("Inventory-insert.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
