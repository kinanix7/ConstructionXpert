<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<!-- Add these styles to your CSS file -->
<style>
    /* Color Variables */
    :root {
        --primary: #2c3e50;
        --secondary: #3498db;
        --accent: #e74c3c;
        --light: #ecf0f1;
        --dark: #2c3e50;
        --success: #2ecc71;
        --warning: #f39c12;
        --info: #3498db;
        --danger: #e74c3c;
    }

    /* Navbar Base Styling */
    .navbar {
        background: linear-gradient(135deg, var(--primary), #1a2530);
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        padding: 12px 20px;
        transition: all 0.4s ease;
    }

    .navbar-brand {
        color: white !important;
        font-weight: 700;
        font-size: 1.4rem;
        letter-spacing: 0.5px;
        transition: all 0.3s ease;
    }

    .navbar-brand i {
        color: var(--secondary);
        margin-right: 8px;
        transition: transform 0.4s ease;
    }

    .navbar-brand:hover {
        transform: translateY(-2px);
    }

    .navbar-brand:hover i {
        transform: rotate(15deg);
        color: var(--accent);
    }

    /* Nav Links Styling */
    .navbar .nav-link {
        color: rgba(255, 255, 255, 0.85) !important;
        font-weight: 500;
        margin: 0 5px;
        padding: 10px 15px !important;
        border-radius: 4px;
        position: relative;
        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    }

    .navbar .nav-link i {
        margin-right: 8px;
        transition: all 0.4s ease;
        opacity: 0.8;
    }

    .navbar .nav-link:hover {
        color: white !important;
        background-color: rgba(255, 255, 255, 0.1);
        transform: translateY(-3px);
    }

    .navbar .nav-link:hover i {
        transform: scale(1.2);
        opacity: 1;
        color: var(--secondary);
    }

    /* Animated Underline Effect */
    .navbar-nav .nav-link::after {
        content: '';
        position: absolute;
        width: 0;
        height: 2px;
        bottom: 5px;
        left: 15px;
        background-color: var(--secondary);
        transition: width 0.3s ease-in-out;
    }

    .navbar-nav .nav-link:hover::after {
        width: calc(100% - 30px);
    }

    /* Active State Styling */
    .navbar-nav .nav-item.active .nav-link {
        color: white !important;
        background-color: rgba(52, 152, 219, 0.2);
    }

    .navbar-nav .nav-item.active .nav-link::after {
        width: calc(100% - 30px);
        background-color: var(--accent);
    }

    .navbar-nav .nav-item.active .nav-link i {
        color: var(--accent);
        opacity: 1;
    }

    /* Dropdown Styling */
    .dropdown-menu {
        border: none;
        border-radius: 8px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.15);
        animation: dropdownFade 0.3s ease;
        background: #fff;
        margin-top: 10px;
    }

    .dropdown-item {
        padding: 10px 20px;
        transition: all 0.2s ease;
    }

    .dropdown-item i {
        margin-right: 10px;
        width: 20px;
        text-align: center;
    }

    .dropdown-item:hover {
        background-color: #f8f9fa;
        transform: translateX(5px);
    }

    .dropdown-divider {
        margin: 0.5rem 0;
    }

    .dropdown-header {
        font-weight: 600;
        color: var(--primary);
    }

    /* Notification Badge */
    .notification-icon {
        position: relative;
    }

    .notification-badge {
        position: absolute;
        top: 0;
        right: 5px;
        background-color: var(--accent);
        color: white;
        font-size: 0.6rem;
        padding: 0.2rem 0.4rem;
        border-radius: 50%;
        animation: pulse 2s infinite;
    }

    .notification-dropdown {
        min-width: 300px;
    }

    /* Hamburger Menu */
    .navbar-toggler {
        border: none;
        background-color: rgba(255, 255, 255, 0.1);
        padding: 8px;
        border-radius: 4px;
        transition: all 0.3s ease;
    }

    .navbar-toggler:focus {
        outline: none;
        box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.5);
    }

    .navbar-toggler-icon {
        background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='30' height='30' viewBox='0 0 30 30'%3E%3Cpath stroke='rgba(255, 255, 255, 0.85)' stroke-linecap='round' stroke-miterlimit='10' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E");
    }

    /* Animations */
    @keyframes dropdownFade {
        from { opacity: 0; transform: translateY(-10px); }
        to { opacity: 1; transform: translateY(0); }
    }

    @keyframes pulse {
        0% { transform: scale(1); }
        50% { transform: scale(1.2); }
        100% { transform: scale(1); }
    }

    /* Scroll Effect */
    .navbar.scrolled {
        padding: 8px 20px;
        background: rgba(44, 62, 80, 0.98);
    }

    /* Color Theme Switcher */
    .theme-switch {
        display: flex;
        align-items: center;
        margin-left: 15px;
    }

    .theme-switch-wrapper {
        display: flex;
        align-items: center;
    }

    .theme-switch-btn {
        background: none;
        border: none;
        color: rgba(255, 255, 255, 0.85);
        font-size: 1.2rem;
        cursor: pointer;
        padding: 5px;
        transition: all 0.3s ease;
    }

    .theme-switch-btn:hover {
        color: var(--secondary);
        transform: rotate(30deg);
    }

    /* Responsive Styles */
    @media (max-width: 991.98px) {
        .navbar-collapse {
            background-color: var(--primary);
            border-radius: 8px;
            padding: 15px;
            margin-top: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .navbar-nav .nav-link {
            padding: 12px 15px !important;
            margin: 3px 0;
        }

        .navbar-nav .nav-link::after {
            bottom: 8px;
        }

        .ml-auto {
            margin-left: 0 !important;
            margin-top: 10px;
        }

        .navbar-brand {
            margin-right: auto;
        }
    }

    /* Dark Mode Styles - Apply with JS */
    body.dark-mode .navbar {
        background: linear-gradient(135deg, #121212, #1e1e1e);
    }

    body.dark-mode .dropdown-menu {
        background-color: #2d2d2d;
        color: #fff;
    }

    body.dark-mode .dropdown-item {
        color: #ddd;
    }

    body.dark-mode .dropdown-item:hover {
        background-color: #3d3d3d;
    }
</style>

<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <a class="navbar-brand" href="<%=request.getContextPath()%>/admin/dashboard">
            <i class="fas fa-building"></i> ConstructionXpert
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/projets">
                        <i class="fas fa-project-diagram"></i> Projets
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/taches">
                        <i class="fas fa-tasks"></i> Taches
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/ressources">
                        <i class="fas fa-tools"></i> Ressources
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/fournisseurs">
                        <i class="fas fa-truck"></i> Fournisseurs
                    </a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-user-circle"></i> Profile
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="<%=request.getContextPath()%>/profile"><i class="fas fa-id-card"></i> My Profile</a>
                        <a class="dropdown-item" href="<%=request.getContextPath()%>/settings"><i class="fas fa-cog"></i> Settings</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="<%=request.getContextPath()%>/logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link notification-icon" href="#" id="notificationDropdown" role="button" data-toggle="dropdown">
                        <i class="fas fa-bell"></i>
                        <span class="badge notification-badge">3</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right notification-dropdown" aria-labelledby="notificationDropdown">
                        <h6 class="dropdown-header">Notifications</h6>
                        <a class="dropdown-item" href="#"><i class="fas fa-exclamation-circle text-warning"></i> Project deadline approaching</a>
                        <a class="dropdown-item" href="#"><i class="fas fa-check-circle text-success"></i> Task completed</a>
                        <a class="dropdown-item" href="#"><i class="fas fa-info-circle text-info"></i> New resource added</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item text-center" href="#">View all</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Add this before closing body tag -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Get current URL path
        const path = window.location.pathname;

        // Find nav links and set active class
        document.querySelectorAll('.navbar-nav .nav-link').forEach(link => {
            if (link.getAttribute('href') &&
                path.includes(link.getAttribute('href').split('<%=request.getContextPath()%>')[1])) {
                link.parentElement.classList.add('active');
            }
        });

        // Add scroll effect to navbar
        window.addEventListener('scroll', function() {
            const navbar = document.querySelector('.navbar');
            if (window.scrollY > 50) {
                navbar.classList.add('scrolled');
            } else {
                navbar.classList.remove('scrolled');
            }
        });

        // Add ripple effect to buttons
        const buttons = document.querySelectorAll('.nav-link');
        buttons.forEach(button => {
            button.addEventListener('click', function(e) {
                let x = e.clientX - e.target.getBoundingClientRect().left;
                let y = e.clientY - e.target.getBoundingClientRect().top;

                let ripple = document.createElement('span');
                ripple.classList.add('ripple');
                ripple.style.left = `${x}px`;
                ripple.style.top = `${y}px`;

                this.appendChild(ripple);

                setTimeout(function() {
                    ripple.remove();
                }, 600);
            });
        });

        // Toggle theme functionality
        const themeToggle = document.createElement('div');
        themeToggle.className = 'theme-switch';
        themeToggle.innerHTML = `
        <div class="theme-switch-wrapper">
            <button class="theme-switch-btn" id="themeToggle">
                <i class="fas fa-moon"></i>
            </button>
        </div>
    `;

        document.querySelector('.navbar-nav.ml-auto').appendChild(themeToggle);

        document.getElementById('themeToggle').addEventListener('click', function() {
            document.body.classList.toggle('dark-mode');
            const icon = this.querySelector('i');
            if (document.body.classList.contains('dark-mode')) {
                icon.classList.remove('fa-moon');
                icon.classList.add('fa-sun');
                localStorage.setItem('theme', 'dark');
            } else {icon.classList.remove('fa-sun');
                icon.classList.add('fa-moon');
                localStorage.setItem('theme', 'light');
            }
        });

        // Check for saved theme
        const savedTheme = localStorage.getItem('theme');
        if (savedTheme === 'dark') {
            document.body.classList.add('dark-mode');
            document.querySelector('#themeToggle i').classList.remove('fa-moon');
            document.querySelector('#themeToggle i').classList.add('fa-sun');
        }

        // Add hover effect to dropdown menus
        const dropdowns = document.querySelectorAll('.dropdown');
        dropdowns.forEach(dropdown => {
            dropdown.addEventListener('mouseenter', function() {
                if (window.innerWidth > 992) {
                    this.querySelector('.dropdown-toggle').click();
                }
            });

            dropdown.addEventListener('mouseleave', function() {
                if (window.innerWidth > 992) {
                    this.querySelector('.dropdown-toggle').click();
                }
            });
        });
    });

    // Add this for the ripple effect
    document.addEventListener('DOMContentLoaded', function() {
        const style = document.createElement('style');
        style.textContent = `
        .ripple {
            position: absolute;
            background: rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            transform: scale(0);
            animation: ripple 0.6s linear;
            pointer-events: none;
        }

        @keyframes ripple {
            to {
                transform: scale(4);
                opacity: 0;
            }
        }
    `;
        document.head.appendChild(style);
    });

    // Add searchbar functionality
    document.addEventListener('DOMContentLoaded', function() {
        // Create search bar
        const searchContainer = document.createElement('div');
        searchContainer.className = 'search-container ml-auto mr-3';
        searchContainer.innerHTML = `
        <div class="search-wrapper">
            <input type="text" class="search-input" placeholder="Search...">
            <button class="search-button">
                <i class="fas fa-search"></i>
            </button>
        </div>
    `;

        // Insert before the profile dropdown
        const navbarNav = document.querySelector('.navbar-nav.ml-auto');
        navbarNav.insertBefore(searchContainer, navbarNav.firstChild);

        // Add search functionality styles
        const searchStyle = document.createElement('style');
        searchStyle.textContent = `
        .search-container {
            position: relative;
            display: flex;
            align-items: center;
        }

        .search-wrapper {
            position: relative;
            display: flex;
            align-items: center;
        }

        .search-input {
            background-color: rgba(255, 255, 255, 0.1);
            border: none;
            border-radius: 20px;
            padding: 8px 15px;
            padding-right: 40px;
            color: white;
            width: 200px;
            transition: all 0.3s ease;
        }

        .search-input::placeholder {
            color: rgba(255, 255, 255, 0.6);
        }

        .search-input:focus {
            outline: none;
            background-color: rgba(255, 255, 255, 0.2);
            width: 250px;
            box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.3);
        }

        .search-button {
            position: absolute;
            right: 10px;
            background: none;
            border: none;
            color: rgba(255, 255, 255, 0.7);
            cursor: pointer;
        }

        .search-button:hover {
            color: white;
        }

        .search-button:focus {
            outline: none;
        }

        @media (max-width: 991.98px) {
            .search-container {
                width: 100%;
                margin: 10px 0;
            }

            .search-wrapper {
                width: 100%;
            }

            .search-input {
                width: 100%;
            }

            .search-input:focus {
                width: 100%;
            }
        }
    `;
        document.head.appendChild(searchStyle);

        // Add breadcrumb functionality
        const mainContent = document.querySelector('main') || document.body;
        const breadcrumb = document.createElement('nav');
        breadcrumb.setAttribute('aria-label', 'breadcrumb');
        breadcrumb.className = 'breadcrumb-container';
        breadcrumb.innerHTML = `
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/admin/dashboard"><i class="fas fa-home"></i> Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">Current Page</li>
        </ol>
    `;

        mainContent.insertBefore(breadcrumb, mainContent.firstChild);

        // Update breadcrumb based on current page
        const currentPath = window.location.pathname;
        const pathParts = currentPath.split('/').filter(Boolean);
        const breadcrumbItems = document.querySelector('.breadcrumb');

        // Clear existing breadcrumb items except home
        while (breadcrumbItems.children.length > 1) {
            breadcrumbItems.removeChild(breadcrumbItems.lastChild);
        }

        // Add breadcrumb items based on path
        let currentPathBuild = '';
        pathParts.forEach((part, index) => {
            if (part !== 'admin' && part !== 'dashboard') {
                currentPathBuild += '/' + part;
                const item = document.createElement('li');
                item.className = 'breadcrumb-item';

                if (index === pathParts.length - 1) {
                    item.classList.add('active');
                    item.setAttribute('aria-current', 'page');
                    item.textContent = part.charAt(0).toUpperCase() + part.slice(1);
                } else {
                    const link = document.createElement('a');
                    link.href = '<%=request.getContextPath()%>' + currentPathBuild;
                    link.textContent = part.charAt(0).toUpperCase() + part.slice(1);
                    item.appendChild(link);
                }

                breadcrumbItems.appendChild(item);
            }
        });

        // Add breadcrumb styles
        const breadcrumbStyle = document.createElement('style');
        breadcrumbStyle.textContent = `
        .breadcrumb-container {
            background-color: #f8f9fa;
            border-radius: 4px;
            padding: 10px 15px;
            margin-bottom: 20px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
        }

        .breadcrumb {
            display: flex;
            flex-wrap: wrap;
            padding: 0;
            margin: 0;
            list-style: none;
            background-color: transparent;
        }

        .breadcrumb-item + .breadcrumb-item::before {
            display: inline-block;
            padding-right: 0.5rem;
            padding-left: 0.5rem;
            color: #6c757d;
            content: "/";
        }

        .breadcrumb-item a {
            color: var(--secondary);
            text-decoration: none;
            transition: all 0.2s ease;
        }

        .breadcrumb-item a:hover {
            color: var(--primary);
            text-decoration: underline;
        }

        .breadcrumb-item.active {
            color: var(--primary);
            font-weight: 500;
        }

        body.dark-mode .breadcrumb-container {
            background-color: #2d2d2d;
        }

        body.dark-mode .breadcrumb-item a {
            color: var(--info);
        }

        body.dark-mode .breadcrumb-item.active {
            color: #ddd;
        }
    `;
        document.head.appendChild(breadcrumbStyle);
    });
</script>
</body>
</html>