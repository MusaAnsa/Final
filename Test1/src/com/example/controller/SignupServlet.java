package com.example.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.dao.InventoryDAO;
import com.example.dao.UserDAO;
import com.example.model.User;

public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            User user = new User();
            user.setUserID(Integer.parseInt(request.getParameter("UserID")));
            user.setUsername(request.getParameter("Username"));
            user.setPassword(request.getParameter("Password"));
            user.setRole(request.getParameter("Role"));

            
            boolean isSuccess = userDAO.insertUser(user);

            // Forwarding to success.jsp or home.jsp based on insertion result
            if (isSuccess) {
                request.setAttribute("successMessage", "Item added successfully!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("success-signup.jsp");
                dispatcher.forward(request, response);
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher(""
                		+ ".jsp");
                dispatcher.forward(request, response);
            }
        }
         catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }
}
