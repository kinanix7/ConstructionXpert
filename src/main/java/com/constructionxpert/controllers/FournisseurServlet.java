package com.constructionxpert.controllers;

import com.constructionxpert.dao.FournisseurDao;
import com.constructionxpert.models.Fournisseur;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = {"/fournisseurs", "/fournisseurs/add", "/fournisseurs/edit", "/fournisseurs/delete"})
public class FournisseurServlet extends HttpServlet {

    private FournisseurDao fournisseurDao;

    @Override
    public void init() throws ServletException {
        fournisseurDao = new FournisseurDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();

        try {
            switch (path) {
                case "/fournisseurs":
                    listFournisseurs(request, response);
                    break;
                case "/fournisseurs/add":
                    showAddForm(request, response);
                    break;
                case "/fournisseurs/edit":
                    showEditForm(request, response);
                    break;
                case "/fournisseurs/delete":
                    deleteFournisseur(request, response);
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
                case "/fournisseurs/add":
                    addFournisseur(request, response);
                    break;
                case "/fournisseurs/edit":
                    updateFournisseur(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }

    private void listFournisseurs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Fournisseur> fournisseurs = fournisseurDao.getAllFournisseurs();
        request.setAttribute("fournisseurs", fournisseurs);
        request.getRequestDispatcher("/views/fournisseur/listFournisseurs.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/fournisseur/addFournisseur.jsp").forward(request, response);
    }
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        Fournisseur fournisseur = fournisseurDao.getFournisseurById(id);

        if (fournisseur == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Fournisseur not found");
            return;
        }

        request.setAttribute("fournisseur", fournisseur);
        request.getRequestDispatcher("/views/fournisseur/updateFournisseur.jsp").forward(request, response);
    }

    private void addFournisseur(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String nom = request.getParameter("nom");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
        String telephone = request.getParameter("telephone");
        String adresse = request.getParameter("adresse");

        Fournisseur fournisseur = new Fournisseur();
        fournisseur.setNom(nom);
        fournisseur.setContact(contact);
        fournisseur.setEmail(email);
        fournisseur.setTelephone(telephone);
        fournisseur.setAdresse(adresse);

        fournisseurDao.addFournisseur(fournisseur);
        response.sendRedirect(request.getContextPath() + "/fournisseurs");
    }

    private void updateFournisseur(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nom = request.getParameter("nom");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
        String telephone = request.getParameter("telephone");
        String adresse = request.getParameter("adresse");


        Fournisseur fournisseur = fournisseurDao.getFournisseurById(id);
        if(fournisseur == null){
            //Handle not found scenario
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Fournisseur with given ID not found");
            return;
        }

        fournisseur.setNom(nom);
        fournisseur.setContact(contact);
        fournisseur.setEmail(email);
        fournisseur.setTelephone(telephone);
        fournisseur.setAdresse(adresse);

        fournisseurDao.updateFournisseur(fournisseur);
        response.sendRedirect(request.getContextPath() + "/fournisseurs");
    }
    private void deleteFournisseur(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        fournisseurDao.deleteFournisseur(id);
        response.sendRedirect(request.getContextPath() + "/fournisseurs");
    }
}