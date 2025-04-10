package com.example.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.dao.LoginDAO;
import com.example.model.LoginUser;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LoginDAO loginDAO;

    public void init() {
        loginDAO = new LoginDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("Username");
        String password = request.getParameter("Password");

        LoginUser loginUser = new LoginUser();
        loginUser.setUsername(username);
        loginUser.setPassword(password);

        boolean isValid = loginDAO.validate(loginUser);

        RequestDispatcher dispatcher;
        if (isValid) {
        	 
            request.setAttribute("successMessage", "Item added successfully!");
             dispatcher = request.getRequestDispatcher("success-login.jsp");
             
            dispatcher.forward(request, response);
            
        } else {
            dispatcher = request.getRequestDispatcher("login.jsp");
            request.setAttribute("errorMessage", "Invalid Username or Password");
        }
        dispatcher.forward(request, response);
    }
}
