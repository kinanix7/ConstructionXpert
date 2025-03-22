<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConstructionXpert</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" type="image/x-icon">

    <style>
        :root {
            --sidebar-bg: #F4F4F4;
            --sidebar-hover: #DFDFDF;
            --sidebar-text: #000000;
            --sidebar-active: #bfbbbb;
            --sidebar-width: 250px;
        }

        body {
            display: flex;
            min-height: 100vh;
            margin: 0;
            padding: 0;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
        }

        .sidebar {
            width: var(--sidebar-width);
            background-color: var(--sidebar-bg);
            position: fixed;
            height: 100vh;
            overflow-y: auto;
            z-index: 1000;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
            display: flex;
            flex-direction: column;
        }

        .sidebar-header {
            padding: 20px 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid rgba(0,0,0,0.05);
        }

        .sidebar-brand {
            font-weight: 600;
            font-size: 1.25rem;
            color: var(--sidebar-text);
            text-decoration: none;
        }

        .sidebar-brand:hover {
            color: var(--sidebar-text);
        }

        .sidebar-toggle {
            display: none;
            background: none;
            border: none;
            font-size: 1.25rem;
            color: var(--sidebar-text);
            cursor: pointer;
        }

        .nav-menu {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .nav-item {
            margin: 4px 0;
        }

        .nav-link {
            display: flex;
            align-items: center;
            padding: 12px 15px;
            color: var(--sidebar-text);
            text-decoration: none;
            border-radius: 4px;
            margin: 0 8px;
            transition: background-color 0.2s;
        }

        .nav-link:hover {
            background-color: var(--sidebar-hover);
            color: var(--sidebar-text);
        }

        .nav-link.active {
            background-color: var(--sidebar-active);
            font-weight: 500;
        }

        .nav-link i {
            margin-right: 10px;
            font-size: 1.1rem;
            width: 24px;
            text-align: center;
        }

        .nav-text {
            font-size: 0.9rem;
        }

        .sidebar-footer {
            margin-top: auto;
            padding: 15px;
            border-top: 1px solid rgba(0,0,0,0.05);
        }

        .user-info {
            display: flex;
            align-items: center;
            padding: 10px;
        }

        .user-avatar {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background-color: #ccc;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 10px;
        }

        .user-avatar i {
            color: #fff;
            font-size: 0.8rem;
        }

        .user-details {
            display: flex;
            flex-direction: column;
        }

        .user-name {
            font-weight: 500;
            font-size: 0.85rem;
        }

        .user-email {
            font-size: 0.75rem;
            color: #666;
        }

        .content-wrapper {
            flex: 1;
            margin-left: var(--sidebar-width);
            width: calc(100% - var(--sidebar-width));
            transition: margin-left 0.3s;
            padding: 20px;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-100%);
                transition: transform 0.3s;
                width: 85%;
                max-width: var(--sidebar-width);
                position: fixed;
                z-index: 1001;
            }

            .sidebar.active {
                transform: translateX(0);
                box-shadow: 4px 0 10px rgba(0,0,0,0.1);
            }

            .content-wrapper {
                margin-left: 0;
                width: 100%;
                padding: 15px;
            }

            .sidebar-toggle {
                display: block;
            }

            .mobile-header {
                display: flex;
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                height: 60px;
                background-color: var(--sidebar-bg);
                z-index: 1000;
                padding: 0 15px;
                align-items: center;
                box-shadow: 0 2px 5px rgba(0,0,0,0.05);
            }

            .content-wrapper {
                margin-top: 70px;
            }

            .content-overlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: rgba(0,0,0,0.4);
                z-index: 999;
            }

            .content-overlay.active {
                display: block;
            }

            .nav-link {
                padding: 15px;
                margin: 2px 8px;
            }

            .nav-text {
                font-size: 1rem;
            }

            .sidebar-toggle, .nav-link, .btn {
                min-height: 44px;
                display: flex;
                align-items: center;
            }
        }
    </style>
</head>
<body>
<div class="mobile-header d-md-none">
    <button class="sidebar-toggle">
        <i class="fas fa-bars"></i>
    </button>
    <a href="${pageContext.request.contextPath}/" class="sidebar-brand mx-auto">ConstructionXpert</a>
</div>

<div class="sidebar">
    <div class="sidebar-header">
        <a href="${pageContext.request.contextPath}/" class="sidebar-brand">ConstructionXpert</a>
        <button class="sidebar-toggle d-none d-md-block">
            <i class="fas fa-bars"></i>
        </button>
    </div>
    <ul class="nav-menu">
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/projets">
                <i class="fas fa-project-diagram"></i>
                <span class="nav-text">Projets</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/taches">
                <i class="fas fa-tasks"></i>
                <span class="nav-text">Tâches</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/ressources">
                <i class="fas fa-tools"></i>
                <span class="nav-text">Ressources</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/fournisseurs">
                <i class="fas fa-truck"></i>
                <span class="nav-text">Fournisseurs</span>
            </a>
        </li>
    </ul>
    <div class="sidebar-footer">
        <div class="user-info">
            <div class="user-avatar">
                <i class="fas fa-user"></i>
            </div>
            <div class="user-details">
                <span class="user-name">Admin</span>
                <span class="user-email">admin@construction.com</span>
            </div>
        </div>
        <a href="${pageContext.request.contextPath}/logout" class="btn btn-sm btn-outline-secondary w-100 mt-2">
            <i class="fas fa-sign-out-alt"></i> Déconnexion
        </a>
    </div>
</div>

<div class="content-overlay"></div>
<div class="content-wrapper">
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const sidebarToggles = document.querySelectorAll('.sidebar-toggle');
        const sidebar = document.querySelector('.sidebar');
        const contentOverlay = document.querySelector('.content-overlay');
        const navLinks = document.querySelectorAll('.nav-link');
        const currentLocation = window.location.pathname;
        const contextPath = '${pageContext.request.contextPath}'; // Store context path in a variable

        function toggleSidebar() {
            sidebar.classList.toggle('active');
            contentOverlay.classList.toggle('active');
            document.body.style.overflow = sidebar.classList.contains('active') ? 'hidden' : '';
        }

        sidebarToggles.forEach(toggle => {
            toggle.addEventListener('click', toggleSidebar);
        });

        contentOverlay.addEventListener('click', toggleSidebar);

        // Mark active link
        navLinks.forEach(link => {
            link.classList.remove('active');
            let href = link.getAttribute('href');

            if (currentLocation.startsWith(href) && href !== contextPath + '/') {
                link.classList.add('active');
            } else if (currentLocation === contextPath + '/') {
                // Handle root path
                document.querySelector('.nav-link[href="' + contextPath + '/projets"]').classList.add('active');  // Default to projets
            }
        });


    });
</script>
</body>
</html>