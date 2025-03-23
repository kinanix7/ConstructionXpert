<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Construction Project Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
    /* Main Variables */
    :root {
        --primary-color: #f89c1c;     /* Construction orange */
        --secondary-color: #2c3e50;   /* Dark blue-gray */
        --accent-color: #e74c3c;      /* Accent red */
        --background-color: #f4f4f4;  /* Light gray background */
        --text-color: #333;
        --border-radius: 6px;
        --box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }

    /* General Styles */
    body {
        background-color: var(--background-color);
        font-family: 'Roboto', sans-serif;
        color: var(--text-color);
        margin: 0;
        padding: 0;
        height: 100vh;
        position: relative;
        overflow: hidden;
    }

    .page-wrapper {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        position: relative;
        z-index: 1;
    }

    /* Login Container */
    .login-container {
        background-color: white;
        border-radius: var(--border-radius);
        box-shadow: var(--box-shadow);
        padding: 30px;
        width: 400px;
        max-width: 90%;
        position: relative;
        overflow: hidden;
        border-top: 4px solid var(--primary-color);
    }

    /* Header Styles */
    .login-header {
        text-align: center;
        margin-bottom: 30px;
    }

    .login-logo {
        background-color: var(--primary-color);
        color: white;
        width: 70px;
        height: 70px;
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 0 auto 20px;
        font-size: 30px;
    }

    .login-container h2 {
        color: var(--secondary-color);
        margin: 0;
        font-weight: 600;
    }

    /* Form Elements */
    .form-group {
        margin-bottom: 20px;
        position: relative;
    }

    .form-group label {
        display: block;
        margin-bottom: 8px;
        font-weight: 500;
        color: var(--secondary-color);
    }

    .icon-container {
        position: absolute;
        left: 15px;
        top: 38px;
        color: var(--secondary-color);
    }

    .form-control {
        width: 100%;
        padding: 12px 15px 12px 40px;
        border: 1px solid #ddd;
        border-radius: var(--border-radius);
        font-size: 16px;
        transition: all 0.3s ease;
        box-sizing: border-box;
    }

    .form-control:focus {
        border-color: var(--primary-color);
        outline: none;
        box-shadow: 0 0 0 3px rgba(248, 156, 28, 0.2);
    }

    /* Button Styles */
    .btn-login {
        background-color: var(--primary-color);
        color: white;
        width: 100%;
        padding: 12px;
        border: none;
        border-radius: var(--border-radius);
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: background-color 0.3s ease;
        margin-top: 10px;
    }

    .btn-login:hover {
        background-color: #e08700;
    }

    /* Footer */
    .footer-text {
        text-align: center;
        margin-top: 20px;
        font-size: 14px;
        color: #777;
    }

    /* Alert Styles */
    .alert {
        padding: 12px 15px;
        margin-bottom: 20px;
        border-radius: var(--border-radius);
        display: flex;
        align-items: center;
    }

    .alert-danger {
        background-color: #fdecea;
        color: var(--accent-color);
        border-left: 4px solid var(--accent-color);
    }

    /* Construction Crane Animation */
    .crane {
        position: absolute;
        bottom: -10px;
        right: -80px;
        z-index: -1;
        opacity: 0.6;
        transform: scale(0.4);
    }

    .crane-tower {
        width: 20px;
        height: 200px;
        background-color: var(--secondary-color);
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
    }

    .crane-arm {
        width: 200px;
        height: 15px;
        background-color: var(--secondary-color);
        position: absolute;
        top: 20px;
        left: 50%;
        transform-origin: 10px center;
        animation: craneMovement 10s infinite alternate;
    }

    .crane-weight {
        width: 30px;
        height: 30px;
        background-color: var(--primary-color);
        position: absolute;
        top: -15px;
        left: 15px;
    }

    .crane-cable {
        width: 2px;
        height: 70px;
        background-color: #999;
        position: absolute;
        top: 15px;
        right: 30px;
        animation: cableMovement 8s infinite alternate;
    }

    .crane-hook {
        width: 15px;
        height: 15px;
        border: 2px solid #999;
        border-top: none;
        border-radius: 0 0 50% 50%;
        position: absolute;
        top: 85px;
        right: 23px;
        animation: hookMovement 8s infinite alternate;
    }

    /* Dust Animation */
    .dust {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        pointer-events: none;
        z-index: 0;
    }

    .dust-particle {
        position: absolute;
        background-color: rgba(248, 156, 28, 0.1);
        border-radius: 50%;
        animation: dustFloat 20s infinite linear;
    }

    /* Animations */
    @keyframes craneMovement {
        0% { transform: rotate(-5deg); }
        100% { transform: rotate(5deg); }
    }

    @keyframes cableMovement {
        0% { height: 60px; }
        100% { height: 100px; }
    }

    @keyframes hookMovement {
        0% { top: 75px; }
        100% { top: 115px; }
    }

    @keyframes dustFloat {
        0% {
            transform: translateY(0) rotate(0deg);
            opacity: 0;
        }
        10% {
            opacity: 0.6;
        }
        90% {
            opacity: 0.2;
        }
        100% {
            transform: translateY(-1000px) rotate(720deg);
            opacity: 0;
        }
    }

    /* Responsive Adjustments */
    @media (max-width: 480px) {
        .login-container {
            padding: 20px;
        }

        .login-logo {
            width: 60px;
            height: 60px;
            font-size: 24px;
        }

        .form-control {
            padding: 10px 15px 10px 40px;
        }

        .crane {
            display: none;
        }
    }
</style>
</head>
<body>
<%@ include file="./includes/header.jsp" %>

<div class="dust" id="dustContainer"></div>

<div class="page-wrapper">
    <div class="login-container">
        <div class="login-header">
            <div class="login-logo">
                <i class="fas fa-hard-hat"></i>
            </div>
            <h2>Project Access</h2>
        </div>
        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger" role="alert">
            <i class="fas fa-exclamation-circle mr-2"></i>
            <%= request.getAttribute("error") %>
        </div>
        <% } %>
        <form action="<%=request.getContextPath()%>/login" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <div class="icon-container">
                    <i class="fas fa-user"></i>
                </div>
                <input type="text" class="form-control" id="username" name="username" required placeholder="Enter your username">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <div class="icon-container">
                    <i class="fas fa-lock"></i>
                </div>
                <input type="password" class="form-control" id="password" name="password" required placeholder="Enter your password">
            </div>
            <button type="submit" class="btn btn-login">
                <i class="fas fa-sign-in-alt mr-2"></i>Secure Login
            </button>
        </form>
        <div class="footer-text">
            <p>Construction Project Management System</p>
        </div>

        <div class="crane">
            <div class="crane-tower"></div>
            <div class="crane-arm">
                <div class="crane-weight"></div>
                <div class="crane-cable"></div>
                <div class="crane-hook"></div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>