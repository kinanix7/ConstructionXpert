<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un Projet</title>
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

        /* Form card styling */
        .form-card {
            background-color: #F8FBFE;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-bottom: 30px;
            border: none;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            padding: 1.5rem;
        }

        .tools {
            display: flex;
            align-items: center;
            padding: 9px 12px;
            background-color: #f1f3f5;
            border-bottom: 1px solid #e9ecef;
            margin: -1.5rem -1.5rem 1.5rem -1.5rem;
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

        .page-header {
            color: var(--black);
            border-bottom: 3px solid var(--yellow);
            padding-bottom: 10px;
            margin-bottom: 30px;
            font-weight: 600;
        }

        .form-group label {
            font-weight: 600;
            color: #444;
            margin-bottom: 0.5rem;
            font-size: 0.9rem;
        }

        .form-control {
            border-radius: 6px;
            border: 1px solid #ddd;
            padding: 10px 12px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }

        .btn-primary {
            background-color: #007aff;
            border: none;
            font-weight: 500;
            padding: 10px 20px;
            border-radius: 6px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 122, 255, 0.2);
        }

        .btn-primary:hover {
            background-color: #0062cc;
            transform: translateY(-2px);
            box-shadow: 0 6px 8px rgba(0, 122, 255, 0.3);
        }

        .btn-secondary {
            background-color: #6c757d;
            border: none;
            font-weight: 500;
            padding: 10px 20px;
            border-radius: 6px;
            transition: all 0.3s ease;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
            transform: translateY(-2px);
        }

        .action-buttons {
            margin-top: 1.5rem;
        }

        .alert {
            border-radius: 6px;
            font-weight: 500;
        }
    </style>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<div class="container">
    <h2 class="page-header">Ajouter un Projet</h2>

    <div class="form-card">
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

        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger" role="alert">
            <%= request.getAttribute("error") %>
        </div>
        <% } %>

        <form action="<%=request.getContextPath()%>/projets/add" method="post">
            <div class="form-group">
                <label for="nom"><i class="fas fa-project-diagram"></i> Nom:</label>
                <input type="text" class="form-control" id="nom" name="nom" required>
            </div>
            <div class="form-group">
                <label for="description"><i class="fas fa-info-circle"></i> Description:</label>
                <textarea class="form-control" id="description" name="description" rows="4"></textarea>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="dateDebut"><i class="far fa-calendar-alt"></i> Date Début:</label>
                        <input type="date" class="form-control" id="dateDebut" name="dateDebut" required>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="dateFin"><i class="far fa-calendar-check"></i> Date Fin:</label>
                        <input type="date" class="form-control" id="dateFin" name="dateFin" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="budget"><i class="fas fa-money-bill-wave"></i> Budget (€):</label>
                        <input type="number" step="0.01" class="form-control" id="budget" name="budget" required>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="statut"><i class="fas fa-tasks"></i> Statut:</label>
                        <select class="form-control" id="statut" name="statut" required>
                            <option value="En attente">En attente</option>
                            <option value="En cours">En cours</option>
                            <option value="Terminé">Terminé</option>
                            <option value="Annulé">Annulé</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="action-buttons">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-plus-circle"></i> Ajouter le Projet
                </button>
                <a href="<%= request.getContextPath() %>/projets" class="btn btn-secondary">
                    <i class="fas fa-times-circle"></i> Annuler
                </a>
            </div>
        </form>
    </div>
</div>
<%@ include file="../includes/footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>