package com.constructionxpert.dao;

import com.constructionxpert.models.Administrateur;
import com.constructionxpert.utils.DBConnection;
import java.sql.*;

public class AdminDao {

    public Administrateur getAdminByUsername(String username) {
        String sql = "SELECT * FROM administrateur WHERE nom_utilisateur = ?";
        Administrateur admin = null;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, username);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    admin = new Administrateur(
                            rs.getInt("id"),
                            rs.getString("nom_utilisateur"),
                            rs.getString("mot_de_passe"),
                            rs.getString("email"),
                            rs.getTimestamp("date_creation")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }
    public Administrateur getAdminById(int id) {
        String sql = "SELECT * FROM administrateur WHERE id = ?";
        Administrateur admin = null;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    admin = new Administrateur();
                    admin.setId(rs.getInt("id"));
                    admin.setNomUtilisateur(rs.getString("nom_utilisateur"));
                    admin.setMotDePasse(rs.getString("mot_de_passe"));
                    admin.setEmail(rs.getString("email"));
                    admin.setDateCreation(rs.getTimestamp("date_creation"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }
}