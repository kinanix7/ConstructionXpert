<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConstructionXpert</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600&display=swap");

        :root {
            --yellow: #f5bf23;
            --black: #111;
            --white: #fff;
            --light-color: #666;
            --light-bg: #eee;
            --box-shadow: 0 .5rem 1rem rgba(0,0,0,.1);
            --border: .1rem solid rgba(0,0,0,.3);
        }

        * {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            outline: none;
            border: none;
            text-decoration: none;
        }

        body {
            background-color: #f8f9fa;
        }

        .header {
            position: sticky;
            top: 0;
            left: 0;
            right: 0;
            box-shadow: var(--box-shadow);
            padding: 1rem 5%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            z-index: 1000;
            background: var(--white);
        }

        .logo-container {
            display: flex;
            align-items: center;
        }

        .logo {
            font-size: 2.2rem;
            font-weight: bold;
            color: var(--black);
            text-decoration: none !important; /* Forcefully remove underline */
            margin-right: 1.5rem; /* Add margin to the right of the logo */
        }

        .logo span {
            color: var(--yellow);
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 1.5rem;
        }

        .nav-link {
            font-size: 1.6rem;
            color: var(--black);
            text-decoration: none;
            padding: 0.5rem 1rem;
            transition: color 0.3s ease;
        }

        .nav-link:hover {
            color: var(--yellow);
        }


        .logout-btn {
                background-color: #4a5457;
                color: white;
                padding: 0.8rem 1.5rem;
                border-radius: 0.3rem;
                font-size: 1.4rem;
                transition: background-color 0.3s ease;
                text-decoration: none !important; /* Forcefully remove underline */
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;

        }

        .logout-btn:hover {
            color: var(--yellow);
        }


        .menu-btn {
            display: none;
            font-size: 2.5rem;
            cursor: pointer;
        }

        @media (max-width: 991px) {
            .nav-links {
                position: absolute;
                top: 100%;
                right: 0;
                background: var(--white);
                width: 100%;
                flex-direction: column;
                align-items: flex-start;
                padding: 1rem;
                box-shadow: var(--box-shadow);
                display: none;
            }

            .nav-links.active {
                display: flex;
            }

            .header {
                padding: 1rem 3%;
            }

            .menu-btn {
                display: block;
            }
        }
    </style>
</head>
<body>
<header class="header">
    <a href="${pageContext.request.contextPath}/" class="logo">Construction<span>Xpert</span></a>
    <i class="fas fa-bars menu-btn" id="menu-btn"></i>

    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/projets" class="nav-link">
            Projets
        </a>
        <a href="${pageContext.request.contextPath}/taches" class="nav-link">
            Tâches
        </a>
        <a href="${pageContext.request.contextPath}/fournisseurs" class="nav-link">
            Fournisseurs
        </a>
        <a href="${pageContext.request.contextPath}/ressources" class="nav-link">
            Ressources
        </a>
        <a href="${pageContext.request.contextPath}/logout" class="logout-btn">
            <i class="fas fa-sign-out-alt"></i> Déconnexion
        </a>
    </div>


</header>


<script>
    let menu = document.querySelector('#menu-btn');
    let navbar = document.querySelector('.nav-links');

    menu.onclick = () => {
        navbar.classList.toggle('active');
    }

    window.onscroll = () => {
        navbar.classList.remove('active');
    }
</script>
</body>
</html>
