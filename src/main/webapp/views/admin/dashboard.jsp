<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.constructionxpert.models.Administrateur" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
</head>
<style>
    :root {
        --primary-color: #f7ca18;
        --secondary-color: #333;
        --light-gray: #f5f5f5;
    }

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .hero-section {
        background-image: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('${pageContext.request.contextPath}/assets/images/construction-bg.jpg');
        background-size: cover;
        background-position: center;
        color: white;
        padding: 100px 0;
    }

    .hero-content {
        max-width: 600px;
        margin: 0 auto;
        text-align: center;
    }

    .btn-primary {
        background-color: var(--primary-color);
        border-color: var(--primary-color);
        color: var(--secondary-color);
        font-weight: bold;
    }

    .section-title {
        text-align: center;
        margin-bottom: 50px;
        position: relative;
    }

    .section-title:after {
        content: "";
        position: absolute;
        bottom: -10px;
        left: 50%;
        transform: translateX(-50%);
        width: 80px;
        height: 3px;
        background-color: var(--primary-color);
    }

    .service-card {
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        padding: 25px;
        margin-bottom: 30px;
        text-align: center;
        transition: transform 0.3s ease;
    }

    .service-card:hover {
        transform: translateY(-10px);
    }

    .service-icon {
        font-size: 2.5rem;
        color: var(--primary-color);
        margin-bottom: 20px;
    }

    .about-section {
        background-color: var(--light-gray);
        padding: 80px 0;
    }

    .about-img {
        border-radius: 10px;
        overflow: hidden;
    }

    .project-gallery {
        padding: 80px 0;
    }

    .project-card {
        position: relative;
        margin-bottom: 30px;
        border-radius: 10px;
        overflow: hidden;
    }

    .project-overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.7);
        display: flex;
        align-items: center;
        justify-content: center;
        opacity: 0;
        transition: opacity 0.3s ease;
    }

    .project-card:hover .project-overlay {
        opacity: 1;
    }

    footer {
        background-color: var(--secondary-color);
        color: white;
        padding: 60px 0 30px;
    }

    .footer-heading {
        color: var(--primary-color);
        margin-bottom: 20px;
    }

    .footer-link {
        color: white;
        text-decoration: none;
        transition: color 0.3s ease;
    }

    .footer-link:hover {
        color: var(--primary-color);
    }

    .social-icons a {
        display: inline-block;
        width: 36px;
        height: 36px;
        background-color: rgba(255, 255, 255, 0.1);
        color: white;
        border-radius: 50%;
        text-align: center;
        line-height: 36px;
        margin-right: 10px;
        transition: background-color 0.3s ease;
    }

    .social-icons a:hover {
        background-color: var(--primary-color);
        color: var(--secondary-color);
    }

    .quick-stats {
        background-color: var(--primary-color);
        padding: 40px 0;
        color: var(--secondary-color);
    }

    .stat-item {
        text-align: center;
    }

    .stat-number {
        font-size: 2.5rem;
        font-weight: bold;
        margin-bottom: 5px;
    }
</style>
<body>
<%@ include file="../includes/header.jsp" %>
<!-- Hero Section -->
<section class="hero-section">
    <div class="container">
        <div class="hero-content">
            <h1 class="display-4 fw-bold mb-4">Un Expert en Construction à Votre Service</h1>
            <p class="lead mb-4">Une équipe professionnelle et qualifiée assurant l'excellence dans tous les projets</p>
            <a href="${pageContext.request.contextPath}assets/images/page-title-bg.jpg" class="btn btn-primary btn-lg">Nouveau Projet</a>
        </div>
    </div>
</section>

<!-- Quick Stats -->
<section class="quick-stats">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6">
                <div class="stat-item">
                    <div class="stat-number">${statsService.getProjetCount()}</div>
                    <div class="stat-label">Projets en Cours</div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="stat-item">
                    <div class="stat-number">${statsService.getClientCount()}</div>
                    <div class="stat-label">Clients Satisfaits</div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="stat-item">
                    <div class="stat-number">${statsService.getEmployeCount()}</div>
                    <div class="stat-label">Employés</div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="stat-item">
                    <div class="stat-number">${statsService.getCompletedProjectCount()}</div>
                    <div class="stat-label">Projets Terminés</div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- About Section -->
<section class="about-section">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6">
                <img src="${pageContext.request.contextPath}/assets/images/about.jpg" alt="Travailleurs de Construction" class="img-fluid about-img">
            </div>
            <div class="col-lg-6">
                <h2 class="mb-4">Expert en Construction Depuis 1995</h2>
                <p class="lead mb-4">Nous transformons vos idées en projets concrets avec une expertise inégalée.</p>
                <p class="mb-4">Avec plus de 25 ans d'expérience, notre équipe de professionnels qualifiés s'engage à offrir les meilleures solutions de construction pour tous types de projets. Notre succès repose sur notre engagement envers l'excellence, la sécurité et la satisfaction client.</p>
                <p class="mb-4">De la conception initiale à la livraison finale, nous supervisons chaque étape pour garantir des résultats qui dépassent vos attentes.</p>
                <a href="${pageContext.request.contextPath}/a-propos.jsp" class="btn btn-primary">En Savoir Plus</a>
            </div>
        </div>
    </div>
</section>

<!-- Services Section -->
<section class="services-section py-5">
    <div class="container">
        <h2 class="section-title">Nos Services de Construction</h2>
        <div class="row mt-5">
            <div class="col-lg-4 col-md-6">
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-building"></i>
                    </div>
                    <h4>Construction Commerciale</h4>
                    <p>Solutions complètes pour bureaux, magasins et installations commerciales avec des designs modernes et fonctionnels.</p>
                    <a href="${pageContext.request.contextPath}/services/commercial.jsp" class="btn btn-sm btn-outline-primary mt-3">Détails</a>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-home"></i>
                    </div>
                    <h4>Construction Résidentielle</h4>
                    <p>Conception et construction de maisons individuelles, appartements et complexes résidentiels respectant vos besoins.</p>
                    <a href="${pageContext.request.contextPath}/services/residential.jsp" class="btn btn-sm btn-outline-primary mt-3">Détails</a>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-industry"></i>
                    </div>
                    <h4>Construction Industrielle</h4>
                    <p>Construction d'usines, entrepôts et installations industrielles répondant aux normes de sécurité et d'efficacité.</p>
                    <a href="${pageContext.request.contextPath}/services/industrial.jsp" class="btn btn-sm btn-outline-primary mt-3">Détails</a>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-hard-hat"></i>
                    </div>
                    <h4>Génie Civil</h4>
                    <p>Services spécialisés incluant la construction de routes, ponts, barrages et autres infrastructures publiques.</p>
                    <a href="${pageContext.request.contextPath}/services/civil.jsp" class="btn btn-sm btn-outline-primary mt-3">Détails</a>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-drafting-compass"></i>
                    </div>
                    <h4>Conception et Ingénierie</h4>
                    <p>Services de conception architecturale et d'ingénierie garantissant des structures sûres et esthétiques.</p>
                    <a href="${pageContext.request.contextPath}/services/design.jsp" class="btn btn-sm btn-outline-primary mt-3">Détails</a>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-tools"></i>
                    </div>
                    <h4>Rénovation et Réhabilitation</h4>
                    <p>Transformation et modernisation de bâtiments existants tout en préservant leur caractère.</p>
                    <a href="${pageContext.request.contextPath}/services/renovation.jsp" class="btn btn-sm btn-outline-primary mt-3">Détails</a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Projects Section -->
<section class="project-gallery">
    <div class="container">
        <h2 class="section-title">Projets Récemment Complétés</h2>
        <div class="row mt-5">
            <c:forEach items="${projetService.getCompletedProjects(6)}" var="projet">
                <div class="col-lg-4 col-md-6">
                    <div class="project-card">
                        <img src="${pageContext.request.contextPath}/assets/images/projects/${projet.image}" alt="${projet.nom}" class="img-fluid">
                        <div class="project-overlay">
                            <div class="text-center text-white">
                                <h5>${projet.nom}</h5>
                                <p>${projet.categorie}</p>
                                <a href="${pageContext.request.contextPath}/projets/details.jsp?id=${projet.id}" class="btn btn-primary btn-sm">Voir Détails</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="text-center mt-4">
            <a href="${pageContext.request.contextPath}/projets.jsp" class="btn btn-outline-primary">Voir Tous les Projets</a>
        </div>
    </div>
</section>

<!-- Footer -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 mb-4 mb-lg-0">
                <h5 class="footer-heading">Pro<span style="color: white">Construction</span></h5>
                <p>Votre partenaire fiable pour tous vos projets de construction depuis plus de 25 ans.</p>
                <div class="social-icons mt-4">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-4 mb-lg-0">
                <h5 class="footer-heading">Liens Rapides</h5>
                <ul class="list-unstyled">
                    <li><a href="${pageContext.request.contextPath}/dashboard.jsp" class="footer-link">Dashboard</a></li>
                    <li><a href="${pageContext.request.contextPath}/projets.jsp" class="footer-link">Projets</a></li>
                    <li><a href="${pageContext.request.contextPath}/services.jsp" class="footer-link">Services</a></li>
                    <li><a href="${pageContext.request.contextPath}/clients.jsp" class="footer-link">Clients</a></li>
                    <li><a href="${pageContext.request.contextPath}/équipe.jsp" class="footer-link">Équipe</a></li>
                </ul>
            </div>
            <div class="col-lg-3 col-md-6 mb-4 mb-lg-0">
                <h5 class="footer-heading">Services</h5>
                <ul class="list-unstyled">
                    <li><a href="${pageContext.request.contextPath}/services/commercial.jsp" class="footer-link">Construction Commerciale</a></li>
                    <li><a href="${pageContext.request.contextPath}/services/residential.jsp" class="footer-link">Construction Résidentielle</a></li>
                    <li><a href="${pageContext.request.contextPath}/services/industrial.jsp" class="footer-link">Construction Industrielle</a></li>
                    <li><a href="${pageContext.request.contextPath}/services/renovation.jsp" class="footer-link">Rénovation</a></li>
                </ul>
            </div>
            <div class="col-lg-3 col-md-6">
                <h5 class="footer-heading">Contact</h5>
                <ul class="list-unstyled">
                    <li class="mb-2"><i class="fas fa-map-marker-alt me-2"></i> 123 Rue de la Construction, 75001 Paris</li>
                    <li class="mb-2"><i class="fas fa-phone me-2"></i> +33 1 23 45 67 89</li>
                    <li class="mb-2"><i class="fas fa-envelope me-2"></i> info@proconstruction.fr</li>
                </ul>
            </div>
        </div>
        <div class="border-top pt-4 mt-4">
            <div class="row">
                <div class="col-md-6 text-center text-md-start">
                    <p class="small text-muted mb-0">&copy; 2025 ProConstruction. Tous droits réservés.</p>
                </div>
                <div class="col-md-6 text-center text-md-end">
                    <a href="${pageContext.request.contextPath}/privacy.jsp" class="small text-muted me-3">Politique de Confidentialité</a>
                    <a href="${pageContext.request.contextPath}/terms.jsp" class="small text-muted">Conditions d'Utilisation</a>
                </div>
            </div>
        </div>
    </div>
</footer>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script>
    // Pour animer les compteurs de statistiques
    document.addEventListener('DOMContentLoaded', function() {
        const statElements = document.querySelectorAll('.stat-number');

        statElements.forEach(element => {
            const target = parseInt(element.textContent);
            let count = 0;
            const duration = 2000; // 2 secondes
            const interval = 50; // 50ms entre chaque incrémentation
            const steps = duration / interval;
            const increment = target / steps;

            const counter = setInterval(() => {
                count += increment;
                if (count >= target) {
                    element.textContent = target;
                    clearInterval(counter);
                } else {
                    element.textContent = Math.floor(count);
                }
            }, interval);
        });
    });
</script>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>