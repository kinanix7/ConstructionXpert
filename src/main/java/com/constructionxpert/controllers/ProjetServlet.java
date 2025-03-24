
package com.constructionxpert.controllers;

import com.constructionxpert.dao.ProjetDao;
import com.constructionxpert.models.Administrateur;
import com.constructionxpert.models.Projet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = {"/projets", "/projets/add", "/projets/edit", "/projets/delete"})
public class ProjetServlet extends HttpServlet {

    private ProjetDao projetDao;

    @Override
    public void init() throws ServletException {
        projetDao = new ProjetDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();

        try {
            switch (path) {
                case "/projets":
                    listProjets(request, response);
                    break;
                case "/projets/add":
                    showAddForm(request, response);
                    break;
                case "/projets/edit":
                    showEditForm(request, response);
                    break;
                case "/projets/delete":
                    deleteProjet(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();

        try {
            switch (path) {
                case "/projets/add":
                    addProjet(request, response);
                    break;
                case "/projets/edit":
                    updateProjet(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }
    private void listProjets(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Projet> projets = projetDao.getAllProjets();
        request.setAttribute("projets", projets);
        request.getRequestDispatcher("/views/projet/listProjets.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/projet/addProjet.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        Projet projet = projetDao.getProjetById(id);

        if (projet == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Projet not found");
            return;
        }
        request.setAttribute("projet", projet);
        request.getRequestDispatcher("/views/projet/updateProjet.jsp").forward(request, response);
    }
    private void addProjet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String nom = request.getParameter("nom");
        String description = request.getParameter("description");
        String dateDebutStr = request.getParameter("dateDebut");
        String dateFinStr = request.getParameter("dateFin");
        String budgetStr = request.getParameter("budget");
        String statut = request.getParameter("statut");


        Date dateDebut = null;
        Date dateFin = null;
        double budget = 0.0;

        try {
            dateDebut = Date.valueOf(dateDebutStr);
            dateFin = Date.valueOf(dateFinStr);
            budget = Double.parseDouble(budgetStr);
        } catch (IllegalArgumentException e) {
            request.setAttribute("error", "Invalid date or budget format.");
            showAddForm(request, response);
            return;
        }

        // Get the logged-in administrator's ID from the session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        Administrateur admin = (Administrateur) session.getAttribute("admin");
        int adminId = admin.getId();

        Projet projet = new Projet();
        projet.setNom(nom);
        projet.setDescription(description);
        projet.setDateDebut(dateDebut);
        projet.setDateFin(dateFin);
        projet.setBudget(budget);
        projet.setStatut(statut);
        projet.setAdministrateurId(adminId);  // Use the logged-in admin's ID
        projetDao.addProjet(projet);
        response.sendRedirect(request.getContextPath() + "/projets");
    }

    private void updateProjet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nom = request.getParameter("nom");
        String description = request.getParameter("description");
        String dateDebutStr = request.getParameter("dateDebut");
        String dateFinStr = request.getParameter("dateFin");
        String budgetStr = request.getParameter("budget");
        String statut = request.getParameter("statut");



        Date dateDebut = null;
        Date dateFin = null;
        double budget = 0.0;
        try {
            dateDebut = Date.valueOf(dateDebutStr);
            dateFin = Date.valueOf(dateFinStr);
            budget = Double.parseDouble(budgetStr);
        } catch (IllegalArgumentException e) {
            request.setAttribute("error", "Invalid date or budget format.");
            request.setAttribute("projet", projetDao.getProjetById(id));
            showEditForm(request, response);
            return;
        }


        // Retrieve the existing project.
        Projet projet = projetDao.getProjetById(id);
        if (projet == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Projet with given ID not found");
            return;
        }

        projet.setNom(nom);
        projet.setDescription(description);
        projet.setDateDebut(dateDebut);
        projet.setDateFin(dateFin);
        projet.setBudget(budget);
        projet.setStatut(statut);

        projetDao.updateProjet(projet);
        response.sendRedirect(request.getContextPath() + "/projets");
    }

    private void deleteProjet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        projetDao.deleteProjet(id);
        response.sendRedirect(request.getContextPath() + "/projets");
    }
}