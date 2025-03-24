<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.constructionxpert.models.Ressource" %>
<%@ page import="com.constructionxpert.models.RessourceTache" %>
<%@ page import="com.constructionxpert.models.Tache" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Assigned Resources</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
    <style>
        .btn-danger {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }

        .btn-danger:hover {
            background-color: #c82333;
            color: white;
        }
    </style>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<div class="container">
    <%
        Tache tache = (Tache) session.getAttribute("tache");
        List<Ressource> assignedResources = (List<Ressource>) session.getAttribute("assignedResources");
        List<RessourceTache> ressourceTaches = (List<RessourceTache>) session.getAttribute("ressourceTaches");
    %>

    <% if (tache != null) { %>
    <h1>Assigned Resources for Task: <%= tache.getDescription() %></h1>
    <% } else { %>
    <h1>Assigned Resources</h1>
    <% } %>
    <!-- Display Assigned Resources -->
    <h3>Assigned Resources</h3>
    <%
        if (assignedResources != null && !assignedResources.isEmpty() && ressourceTaches != null && !ressourceTaches.isEmpty()) { %>

    <table class="table">
        <thead>
        <tr>
            <th>Resource Name</th>
            <th>Quantity Used</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            // Ensure both lists have the same size to avoid errors
            int minSize = Math.min(assignedResources.size(), ressourceTaches.size());

            for (int i = 0; i < minSize; i++) {
                Ressource ressource = assignedResources.get(i);
                RessourceTache ressourceTache = ressourceTaches.get(i);
        %>
        <tr>
            <td><%= ressource.getNom() %></td>
            <td><%= ressourceTache.getQuantiteUtilisee() %></td>
            <td>
                <a href="<%=request.getContextPath()%>/taches/supprimerRessource?tacheId=<%= tache.getId() %>&ressourceId=<%= ressource.getId() %>"
                   class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to remove this resource?')">Remove</a>
            </td>
        </tr>

        <% } %>
        </tbody>
    </table>
    <% } else { %>
    <p>No resources assigned to this task.</p>
    <% } %>

    <a href="${pageContext.request.contextPath}/taches" class="btn btn-secondary">Back to Tasks</a>
</div>
<%@ include file="../includes/footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>