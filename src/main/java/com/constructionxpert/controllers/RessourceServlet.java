package com.constructionxpert.controllers;

import com.constructionxpert.dao.FournisseurDao;
import com.constructionxpert.dao.RessourceDao;
import com.constructionxpert.models.Fournisseur;
import com.constructionxpert.models.Ressource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = {"/ressources", "/ressources/add", "/ressources/edit", "/ressources/delete"})
public class RessourceServlet extends HttpServlet {

    private RessourceDao ressourceDao;
    private FournisseurDao fournisseurDao;

    @Override
    public void init() throws ServletException {
        ressourceDao = new RessourceDao();
        fournisseurDao = new FournisseurDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();

        try {
            switch (path) {
                case "/ressources":
                    listRessources(request, response);
                    break;
                case "/ressources/add":
                    showAddForm(request, response);
                    break;
                case "/ressources/edit":
                    showEditForm(request, response);
                    break;
                case "/ressources/delete":
                    deleteRessource(request, response);
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
                case "/ressources/add":
                    addRessource(request, response);
                    break;
                case "/ressources/edit":
                    updateRessource(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }

    private void listRessources(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Ressource> ressources = ressourceDao.getAllRessources();
        request.setAttribute("ressources", ressources);
        request.getRequestDispatcher("/views/ressource/listRessources.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Fournisseur> fournisseurs = fournisseurDao.getAllFournisseurs();
        request.setAttribute("fournisseurs", fournisseurs);
        request.getRequestDispatcher("/views/ressource/addRessource.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        Ressource ressource = ressourceDao.getRessourceById(id);
        if (ressource == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Ressource not found");
            return;
        }

        List<Fournisseur> fournisseurs = fournisseurDao.getAllFournisseurs();
        request.setAttribute("fournisseurs", fournisseurs);
        request.setAttribute("ressource", ressource);
        request.getRequestDispatcher("/views/ressource/updateRessource.jsp").forward(request, response);
    }

    private void addRessource(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        Ressource ressource = extractRessourceFromRequest(request);
        if (ressource == null) {
            showAddForm(request, response);
            return;
        }

        ressourceDao.addRessource(ressource);
        response.sendRedirect(request.getContextPath() + "/ressources");
    }

    private void updateRessource(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        Ressource ressource = extractRessourceFromRequest(request);
        if (ressource == null) {
            request.setAttribute("ressource", ressourceDao.getRessourceById(id));
            showEditForm(request, response);
            return;
        }

        ressource.setId(id);
        ressourceDao.updateRessource(ressource);
        response.sendRedirect(request.getContextPath() + "/ressources");
    }

    private Ressource extractRessourceFromRequest(HttpServletRequest request) throws ServletException {
        String nom = request.getParameter("nom");
        String type = request.getParameter("type");
        String quantiteStr = request.getParameter("quantite");
        String unite = request.getParameter("unite");
        String description = request.getParameter("description");
        String fournisseurIdStr = request.getParameter("fournisseurId");

        if (nom == null || nom.trim().isEmpty() ||
                type == null || type.trim().isEmpty() ||
                quantiteStr == null || quantiteStr.trim().isEmpty() ||
                unite == null || unite.trim().isEmpty()) {

            request.setAttribute("error", "Nom, Type, Quantite, and Unite are required.");
            return null;
        }

        int quantite;
        try {
            quantite = Integer.parseInt(quantiteStr);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid quantity format.");
            return null;
        }

        Integer fournisseurId = null;
        if (fournisseurIdStr != null && !fournisseurIdStr.trim().isEmpty()) {
            try {
                fournisseurId = Integer.parseInt(fournisseurIdStr);
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid Fournisseur ID format.");
                return null;
            }
        }

        Ressource ressource = new Ressource();
        ressource.setNom(nom);
        ressource.setType(type);
        ressource.setQuantite(quantite);
        ressource.setUnite(unite);
        ressource.setDescription(description);
        ressource.setFournisseurId(fournisseurId);

        return ressource;
    }

    private void deleteRessource(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        ressourceDao.deleteRessource(id);
        response.sendRedirect(request.getContextPath() + "/ressources");
    }
}
