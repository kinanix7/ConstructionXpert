package com.constructionxpert.controllers;

import com.constructionxpert.dao.ProjetDao;
import com.constructionxpert.dao.RessourceDao;
import com.constructionxpert.dao.RessourceTacheDao;
import com.constructionxpert.dao.TacheDao;
import com.constructionxpert.models.Projet;
import com.constructionxpert.models.Ressource;
import com.constructionxpert.models.RessourceTache;
import com.constructionxpert.models.Tache;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(urlPatterns = {"/taches", "/taches/add", "/taches/edit", "/taches/delete","/taches/assignerRessource", "/taches/supprimerRessource", "/taches/viewAssignedResources"}) // Added new URL pattern
public class TacheServlet extends HttpServlet {

    private TacheDao tacheDao;
    private ProjetDao projetDao;
    private RessourceDao ressourceDao;
    private RessourceTacheDao ressourceTacheDao;

    @Override
    public void init() throws ServletException {
        tacheDao = new TacheDao();
        projetDao = new ProjetDao();
        ressourceDao = new RessourceDao();
        ressourceTacheDao = new RessourceTacheDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();

        try {
            switch (path) {
                case "/taches":
                    listTaches(request,response);
                    break;
                case "/taches/add":
                    showAddForm(request, response);
                    break;
                case "/taches/edit":
                    showEditForm(request, response);
                    break;
                case "/taches/delete":
                    deleteTache(request, response);
                    break;
                case "/taches/assignerRessource":
                    showAssignerRessourceForm(request, response);
                    break;
                case "/taches/supprimerRessource":
                    supprimerRessource(request,response);
                    break;
                case "/taches/viewAssignedResources":
                    viewAssignedResources(request, response);
                    break;

                default:
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();

        try {
            switch (path) {
                case "/taches/add":
                    addTache(request, response);
                    break;
                case "/taches/edit":
                    updateTache(request, response);
                    break;
                case "/taches/assignerRessource":
                    assignerRessource(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        }catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }

    private void listTaches(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {

        String projetIdStr = request.getParameter("projetId");

        List<Tache> taches;
        if(projetIdStr != null && !projetIdStr.trim().isEmpty()){
            int projetId = Integer.parseInt(projetIdStr);
            taches = tacheDao.getAllTachesByProjectId(projetId);
            request.setAttribute("projetId", projetId);

        } else {
            taches = tacheDao.getAllTaches();
        }

        request.setAttribute("taches", taches);
        request.getRequestDispatcher("/views/tache/listTaches.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Projet> projets = projetDao.getAllProjets();
        request.setAttribute("projets", projets);
        request.getRequestDispatcher("/views/tache/addTache.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        Tache tache = tacheDao.getTacheById(id);

        List<Projet> projets = projetDao.getAllProjets();
        request.setAttribute("projets", projets);
        request.setAttribute("tache", tache);

        List<RessourceTache> ressourceTaches = ressourceTacheDao.getAllRessourceTachesByTacheId(id);
        request.setAttribute("ressourceTaches", ressourceTaches);

        request.getRequestDispatcher("/views/tache/updateTache.jsp").forward(request, response);
    }

    private void addTache(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String description = request.getParameter("description");
        String dateDebutStr = request.getParameter("dateDebut");
        String dateFinStr = request.getParameter("dateFin");
        String statut = request.getParameter("statut");
        String projetIdStr = request.getParameter("projetId");



        Date dateDebut = null;
        Date dateFin = null;
        int projetId = 0;

        try {
            dateDebut = Date.valueOf(dateDebutStr);
            dateFin = Date.valueOf(dateFinStr);
            projetId = Integer.parseInt(projetIdStr);
        } catch (IllegalArgumentException e) {
            request.setAttribute("error", "Invalid date or project ID format.");
            showAddForm(request, response);
            return;
        }
        Tache tache = new Tache();
        tache.setDescription(description);
        tache.setDateDebut(dateDebut);
        tache.setDateFin(dateFin);
        tache.setStatut(statut);
        tache.setProjetId(projetId);

        tacheDao.addTache(tache);
        // response.sendRedirect(request.getContextPath() + "/taches?projetId=" + projetId);
        response.sendRedirect(request.getContextPath() + "/taches");
    }
    private void updateTache(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String description = request.getParameter("description");
        String dateDebutStr = request.getParameter("dateDebut");
        String dateFinStr = request.getParameter("dateFin");
        String statut = request.getParameter("statut");
        String projetIdStr = request.getParameter("projetId");


        Date dateDebut = null;
        Date dateFin = null;
        int projetId = 0;

        try {
            dateDebut = Date.valueOf(dateDebutStr);
            dateFin = Date.valueOf(dateFinStr);
            projetId = Integer.parseInt(projetIdStr);
        } catch (IllegalArgumentException e) {
            request.setAttribute("error", "Invalid date or project ID format.");
            request.setAttribute("tache", tacheDao.getTacheById(id));
            showEditForm(request,response);
            return;
        }

        Tache tache = tacheDao.getTacheById(id);
        if (tache == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Tache with given ID not found");
            return;
        }
        tache.setDescription(description);
        tache.setDateDebut(dateDebut);
        tache.setDateFin(dateFin);
        tache.setStatut(statut);
        tache.setProjetId(projetId);

        tacheDao.updateTache(tache);
        //response.sendRedirect(request.getContextPath() + "/taches?projetId=" + projetId);
        response.sendRedirect(request.getContextPath() + "/taches");
    }

    private void deleteTache(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        Tache tache = tacheDao.getTacheById(id);
        int projetId = tache.getProjetId();
        tacheDao.deleteTache(id);
        response.sendRedirect(request.getContextPath() + "/taches?projetId=" + projetId);
    }

    private void showAssignerRessourceForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int tacheId = Integer.parseInt(request.getParameter("tacheId"));
        Tache tache = tacheDao.getTacheById(tacheId);

        List<Ressource> ressources = ressourceDao.getAllRessources();
        List<RessourceTache> ressourceTaches = ressourceTacheDao.getAllRessourceTachesByTacheId(tacheId);

        List<Integer> assignedResourceIds = new ArrayList<>();
        for (RessourceTache rt : ressourceTaches) {
            assignedResourceIds.add(rt.getRessourceId());
        }

        List<Ressource> availableResources = new ArrayList<>();
        for (Ressource ressource : ressources) {
            if (!assignedResourceIds.contains(ressource.getId())) {
                availableResources.add(ressource);
            }
        }

        request.setAttribute("tache", tache);
        request.setAttribute("ressources", availableResources);
        request.getRequestDispatcher("/views/tache/assignerRessource.jsp").forward(request, response);
    }

    private void assignerRessource(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int tacheId = Integer.parseInt(request.getParameter("tacheId"));
        int ressourceId = Integer.parseInt(request.getParameter("ressourceId"));
        String quantiteUtiliseeStr = request.getParameter("quantiteUtilisee");

        if (quantiteUtiliseeStr == null || quantiteUtiliseeStr.trim().isEmpty()) {
            request.setAttribute("error", "Quantity is required.");
            showAssignerRessourceForm(request, response);
            return;
        }

        int quantiteUtilisee;
        try {
            quantiteUtilisee = Integer.parseInt(quantiteUtiliseeStr);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid quantity format.");
            showAssignerRessourceForm(request, response);
            return;
        }

        Ressource ressource = ressourceDao.getRessourceById(ressourceId);


        if (ressource.getQuantite() < quantiteUtilisee) {
            request.setAttribute("error", "Not enough resources available.");
            showAssignerRessourceForm(request, response);
            return;
        }


        RessourceTache ressourceTache = new RessourceTache();
        ressourceTache.setTacheId(tacheId);
        ressourceTache.setRessourceId(ressourceId);
        ressourceTache.setQuantiteUtilisee(quantiteUtilisee);

        ressourceTacheDao.addRessourceTache(ressourceTache);

        int newQuantity = ressource.getQuantite() - quantiteUtilisee;
        ressourceDao.updateRessourceQuantity(ressourceId, newQuantity);

        response.sendRedirect(request.getContextPath() + "/taches/edit?id=" + tacheId);
    }
    private void supprimerRessource(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int tacheId = Integer.parseInt(request.getParameter("tacheId"));
        int ressourceId = Integer.parseInt(request.getParameter("ressourceId"));

        List<RessourceTache> ressourceTaches = ressourceTacheDao.getAllRessourceTachesByTacheId(tacheId);
        RessourceTache ressourceTacheToDelete = null;
        for (RessourceTache rt : ressourceTaches) {
            if (rt.getRessourceId() == ressourceId) {
                ressourceTacheToDelete = rt;
                break;
            }
        }

        if (ressourceTacheToDelete == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Resource assignment not found.");
            return;
        }

        ressourceTacheDao.deleteRessourceTache(tacheId, ressourceId);

        // Add the used quantity back to the resource quantity in the database
        Ressource ressource = ressourceDao.getRessourceById(ressourceId);
        if (ressource != null) {
            int updatedQuantity = ressource.getQuantite() + ressourceTacheToDelete.getQuantiteUtilisee();
            ressourceDao.updateRessourceQuantity(ressourceId, updatedQuantity);
        }

        response.sendRedirect(request.getContextPath() + "/taches/edit?id=" + tacheId);
    }

    private void viewAssignedResources(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int tacheId = Integer.parseInt(request.getParameter("id"));
        Tache tache = tacheDao.getTacheById(tacheId);

        if (tache == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Tache not found");
            return;
        }

        List<RessourceTache> ressourceTaches = ressourceTacheDao.getAllRessourceTachesByTacheId(tacheId);
        List<Ressource> assignedResources = new ArrayList<>();

        for (RessourceTache ressourceTache : ressourceTaches) {
            try {
                Ressource ressource = ressourceDao.getRessourceById(ressourceTache.getRessourceId());
                assignedResources.add(ressource);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        request.getSession().setAttribute("tache", tache);
        request.getSession().setAttribute("assignedResources", assignedResources);
        request.getSession().setAttribute("ressourceTaches", ressourceTaches);

        response.sendRedirect(request.getContextPath() + "/views/tache/viewAssignedResources.jsp");
    }


}