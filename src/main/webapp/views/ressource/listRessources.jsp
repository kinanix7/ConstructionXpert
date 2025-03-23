<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.constructionxpert.models.Ressource" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>List Ressources</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
    <style>
        :root {
            --yellow: #f5bf23;
            --black: #111;
            --white: #fff;
            --light-color: #666;
            --light-bg: #eee;
            --box-shadow: 0 .5rem 1rem rgba(0,0,0,.1);
            --border: .1rem solid rgba(0,0,0,.3);
            --primary-color: #007bff;
            --modifier-color: #f0ad4e;
            --supprimer-color: #d9534f;
            --tasks-color: #0275d8;
        }

        body {
            background-color: #f5f5f7;
            color: var(--black);
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
        }

        .container {
            padding-top: 2rem;
            padding-bottom: 2rem;
        }

        .page-header {
            color: var(--black);
            border-bottom: 3px solid var(--yellow);
            padding-bottom: 10px;
            margin-bottom: 30px;
            font-weight: 600;
        }

        .add-button {
            display: inline-flex;
            align-items: center;
            background-color: #007aff;
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 122, 255, 0.2);
        }

        .add-button:hover {
            background-color: #0062cc;
            transform: translateY(-2px);
            box-shadow: 0 6px 8px rgba(0, 122, 255, 0.3);
            text-decoration: none;
            color: white;
        }

        .add-button i {
            margin-right: 8px;
        }

        .card {
            background-color: #F8FBFE;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-bottom: 30px;
            border: none;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }

        .tools {
            display: flex;
            align-items: center;
            padding: 9px 12px;
            background-color: #f1f3f5;
            border-bottom: 1px solid #e9ecef;
        }

        .circle {
            padding: 0 4px;
        }

        .box {
            display: inline-block;
            width: 12px;
            height: 12px;
            padding: 1px;
            border-radius: 50%;
        }

        .red {
            background-color: #ff605c;
        }

        .yellow {
            background-color: #ffbd44;
        }

        .green {
            background-color: #00ca4e;
        }

        .card-content {
            padding: 1.5rem;
        }

        .ressource-title {
            font-weight: 600;
            margin-bottom: 1rem;
            color: #333;
            font-size: 1.2rem;
        }

        .ressource-description {
            min-height: 60px;
            color: var(--light-color);
            margin-bottom: 1.5rem;
        }

        .info-section {
            margin-bottom: 1.5rem;
        }

        .info-label {
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: #444;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
        }

        .info-label i {
            margin-right: 8px;
            color: #666;
        }

        .info-value {
            margin-bottom: 0;
            color: #333;
        }

        .card-footer {
            background-color: #f8f9fa;
            border-top: 1px solid #e9ecef;
            padding: 1rem;
        }

        .action-buttons {
            display: flex;
            justify-content: flex-start;
            align-items: center;
        }

        .btn-modifier {
            background-color: var(--modifier-color);
            color: white;
            font-weight: 500;
            border: none;
            border-radius: 4px;
            padding: 8px 12px;
            margin-right: 5px;
            display: inline-flex;
            align-items: center;
            transition: all 0.2s ease;
            font-size: 14px;
        }

        .btn-modifier:hover {
            background-color: #ec971f;
            color: white;
            text-decoration: none;
        }

        .btn-supprimer {
            background-color: var(--supprimer-color);
            color: white;
            font-weight: 500;
            border: none;
            border-radius: 4px;
            padding: 8px 12px;
            margin-right: 5px;
            display: inline-flex;
            align-items: center;
            transition: all 0.2s ease;
            font-size: 14px;
        }

        .btn-supprimer:hover {
            background-color: #c9302c;
            color: white;
            text-decoration: none;
        }

        .btn i {
            margin-right: 5px;
        }
    </style>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<div class="container">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="page-header">List Ressources</h2>
        <a href="<%=request.getContextPath()%>/ressources/add" class="add-button">
            <i class="fas fa-plus-circle"></i> Add New Ressource
        </a>
    </div>

    <div class="row">
        <% List<Ressource> ressources = (List<Ressource>) request.getAttribute("ressources");
            if (ressources != null && !ressources.isEmpty()) {
                for (Ressource ressource : ressources) { %>
        <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-80">
                <div class="tools">
                    <div class="circle">
                        <span class="red box"></span>
                    </div>
                    <div class="circle">
                        <span class="yellow box"></span>
                    </div>
                    <div class="circle">
                        <span class="green box"></span>
                    </div>
                </div>
                <div class="card-content">
                    <h4 class="ressource-title"><%= ressource.getNom() %></h4>

                    <div class="info-section">
                        <div class="info-label"><i class="fas fa-cube"></i> Type:</div>
                        <p class="info-value"><%= ressource.getType() %></p>
                    </div>

                    <div class="info-section">
                        <div class="info-label"><i class="fas fa-balance-scale"></i> Quantite:</div>
                        <p class="info-value"><%= ressource.getQuantite() %> <%= ressource.getUnite() %></p>
                    </div>

                    <div class="ressource-description">
                        <div class="info-label"><i class="fas fa-info-circle"></i> Description:</div>
                        <p><%= ressource.getDescription() != null ? ressource.getDescription() : "No description available" %></p>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="action-buttons">
                        <a href="<%=request.getContextPath()%>/ressources/edit?id=<%= ressource.getId() %>" class="btn-modifier">
                            Edit
                        </a>
                        <a href="<%=request.getContextPath()%>/ressources/delete?id=<%= ressource.getId() %>" class="btn-supprimer" onclick="return confirm('Are you sure?')">
                            Delete
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <% }
        } else { %>
        <div class="col-12">
            <div class="alert alert-info">No resources found.</div>
        </div>
        <% } %>
    </div>
</div>
<%@ include file="../includes/footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
