package com.constructionxpert.controllers;

import com.constructionxpert.dao.AdminDao;
import com.constructionxpert.models.Administrateur;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(urlPatterns = {"/login", "/logout", "/admin/dashboard"})
public class AdminServlet extends HttpServlet {

    private AdminDao adminDao;

    @Override
    public void init() throws ServletException {
        adminDao = new AdminDao();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();

        switch (path) {
            case "/login":
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
                break;
            case "/logout":
                doLogout(request, response);
                break;
            case "/admin/dashboard":
                HttpSession session = request.getSession(false);
                if (session != null && session.getAttribute("admin") != null) {
                    request.getRequestDispatcher("/views/admin/dashboard.jsp").forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/login");
                }
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();

        switch (path) {
            case "/login":
                doLogin(request, response);
                break;

            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
    private void doLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        //  input validation
        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Username and password are required.");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            return;
        }

        Administrateur admin = adminDao.getAdminByUsername(username);

        if (admin != null && password.equals(admin.getMotDePasse())) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            response.sendRedirect(request.getContextPath() + "/admin/dashboard");


        } else {
            request.setAttribute("error", "Invalid username or password.");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        }
    }

    private void doLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect(request.getContextPath() + "/login");
    }
}