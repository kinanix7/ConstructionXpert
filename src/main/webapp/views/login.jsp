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
        :root {
            --primary: #FF6B00;
            --primary-dark: #E55400;
            --secondary: #2A2D34;
            --accent: #FFD100;
            --light: #F5F5F5;
            --medium: #DDDDDD;
            --dark: #212529;
            --success: #28a745;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            height: 100vh;
            overflow: hidden;
            background-color: var(--secondary);
            background-image:
                    linear-gradient(30deg, var(--secondary) 12%, transparent 12.5%, transparent 87%, var(--secondary) 87.5%, var(--secondary)),
                    linear-gradient(150deg, var(--secondary) 12%, transparent 12.5%, transparent 87%, var(--secondary) 87.5%, var(--secondary)),
                    linear-gradient(30deg, var(--secondary) 12%, transparent 12.5%, transparent 87%, var(--secondary) 87.5%, var(--secondary)),
                    linear-gradient(150deg, var(--secondary) 12%, transparent 12.5%, transparent 87%, var(--secondary) 87.5%, var(--secondary)),
                    linear-gradient(60deg, rgba(42, 45, 52, 0.2) 25%, transparent 25.5%, transparent 75%, rgba(42, 45, 52, 0.2) 75%, rgba(42, 45, 52, 0.2)),
                    linear-gradient(60deg, rgba(42, 45, 52, 0.2) 25%, transparent 25.5%, transparent 75%, rgba(42, 45, 52, 0.2) 75%, rgba(42, 45, 52, 0.2));
            background-position: 0 0, 0 0, 10px 18px, 10px 18px, 0 0, 10px 18px;
            background-size: 20px 36px;
        }

        @keyframes gradientBG {
            0% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
            100% {
                background-position: 0% 50%;
            }
        }

        .page-wrapper {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            position: relative;
            z-index: 1;
        }

        .page-wrapper::before {
            content: '';
            position: absolute;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle at center, rgba(255, 107, 0, 0.15) 0%, rgba(42, 45, 52, 0.9) 70%);
            z-index: -1;
        }

        .login-container {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
            padding: 40px;
            max-width: 450px;
            width: 100%;
            position: relative;
            overflow: hidden;
            animation: fadeIn 1s ease-out forwards;
            border-top: 6px solid var(--primary);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .login-header {
            text-align: center;
            margin-bottom: 30px;
            position: relative;
        }

        .login-header h2 {
            color: var(--secondary);
            font-weight: 700;
            margin-top: 15px;
            position: relative;
            display: inline-block;
        }

        .login-header h2::after {
            content: '';
            position: absolute;
            width: 0;
            height: 3px;
            bottom: -8px;
            left: 50%;
            background-color: var(--primary);
            transform: translateX(-50%);
            animation: underline 1.5s ease-in-out forwards;
            animation-delay: 0.5s;
        }

        @keyframes underline {
            from { width: 0; }
            to { width: 100%; }
        }

        .login-logo {
            background: linear-gradient(145deg, var(--primary), var(--primary-dark));
            width: 90px;
            height: 90px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            font-size: 2.8rem;
            color: white;
            box-shadow: 0 5px 15px rgba(255, 107, 0, 0.4);
            position: relative;
            z-index: 1;
            animation: pulse 2s infinite;
        }

        .login-logo::before {
            content: '';
            position: absolute;
            width: 100%;
            height: 100%;
            border-radius: 50%;
            background: linear-gradient(145deg, var(--primary), var(--primary-dark));
            z-index: -1;
            filter: blur(8px);
            opacity: 0.7;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.05);
            }
            100% {
                transform: scale(1);
            }
        }

        .form-group {
            margin-bottom: 25px;
            position: relative;
            opacity: 0;
            transform: translateX(-10px);
        }

        .form-group:nth-child(1) {
            animation: slideIn 0.5s ease-out forwards;
            animation-delay: 0.6s;
        }

        .form-group:nth-child(2) {
            animation: slideIn 0.5s ease-out forwards;
            animation-delay: 0.8s;
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateX(-10px); }
            to { opacity: 1; transform: translateX(0); }
        }

        .form-group label {
            font-weight: 500;
            color: var(--secondary);
            margin-bottom: 10px;
            display: block;
            transition: all 0.3s;
        }

        .form-control {
            height: 55px;
            padding-left: 50px;
            border: 2px solid var(--medium);
            border-radius: 8px;
            transition: all 0.3s;
            font-size: 1rem;
            background-color: var(--light);
            color: var(--dark);
        }

        .form-control:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 0.2rem rgba(255, 107, 0, 0.25);
            background-color: white;
        }

        .form-control:focus + .icon-container {
            color: var(--primary);
        }

        .icon-container {
            position: absolute;
            left: 18px;
            top: 45px;
            color: var(--secondary);
            transition: all 0.3s;
            font-size: 1.1rem;
        }

        .btn-login {
            background: linear-gradient(145deg, var(--primary), var(--primary-dark));
            border: none;
            height: 55px;
            font-weight: 600;
            font-size: 1.1rem;
            color: white;
            border-radius: 8px;
            width: 100%;
            transition: all 0.3s;
            opacity: 0;
            transform: translateY(10px);
            animation: fadeUp 0.5s ease-out forwards;
            animation-delay: 1s;
            position: relative;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(255, 107, 0, 0.3);
        }

        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .btn-login:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(255, 107, 0, 0.4);
        }

        .btn-login:active {
            transform: translateY(-1px);
            box-shadow: 0 3px 10px rgba(255, 107, 0, 0.3);
        }

        .btn-login::after {
            content: "";
            display: block;
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            pointer-events: none;
            background-image: radial-gradient(circle, #fff 10%, transparent 10.01%);
            background-repeat: no-repeat;
            background-position: 50%;
            transform: scale(10, 10);
            opacity: 0;
            transition: transform 0.5s, opacity 1s;
        }

        .btn-login:active::after {
            transform: scale(0, 0);
            opacity: 0.3;
            transition: 0s;
        }

        .footer-text {
            text-align: center;
            margin-top: 30px;
            color: var(--secondary);
            font-size: 0.9rem;
            opacity: 0;
            animation: fadeIn 0.5s ease-out forwards;
            animation-delay: 1.2s;
        }

        .alert-danger {
            border-left: 4px solid #dc3545;
            background-color: rgba(220, 53, 69, 0.1);
            padding: 15px;
            animation: shake 0.5s cubic-bezier(.36,.07,.19,.97) both;
        }

        @keyframes shake {
            10%, 90% { transform: translate3d(-1px, 0, 0); }
            20%, 80% { transform: translate3d(2px, 0, 0); }
            30%, 50%, 70% { transform: translate3d(-4px, 0, 0); }
            40%, 60% { transform: translate3d(4px, 0, 0); }
        }

        /* Construction elements */
        .crane {
            position: absolute;
            bottom: -5px;
            right: -120px;
            width: 180px;
            height: 320px;
            opacity: 0.1;
            transform-origin: bottom center;
            animation: sway 8s ease-in-out infinite;
        }

        @keyframes sway {
            0%, 100% { transform: rotate(-1deg); }
            50% { transform: rotate(1deg); }
        }

        .crane-arm {
            position: absolute;
            bottom: 150px;
            left: 20px;
            width: 160px;
            height: 8px;
            background-color: var(--accent);
            transform-origin: left center;
            transform: rotate(-45deg);
        }

        .crane-tower {
            position: absolute;
            bottom: 0;
            left: 60px;
            width: 20px;
            height: 250px;
            background-color: var(--accent);
        }

        .crane-weight {
            position: absolute;
            width: 20px;
            height: 20px;
            background-color: var(--secondary);
            border-radius: 50%;
            top: -5px;
            right: 10px;
        }

        .crane-cable {
            position: absolute;
            top: 0;
            right: 50px;
            width: 2px;
            height: 60px;
            background-color: var(--secondary);
        }

        .crane-hook {
            position: absolute;
            top: 60px;
            right: 46px;
            width: 10px;
            height: 10px;
            border: 2px solid var(--secondary);
            border-top: none;
            border-radius: 0 0 5px 5px;
        }

        /* Dust particles */
        .dust {
            position: absolute;
            width: 100%;
            height: 100%;
            pointer-events: none;
        }

        .particle {
            position: absolute;
            background-color: var(--primary);
            border-radius: 50%;
            opacity: 0;
            animation: float 12s linear infinite;
        }

        @keyframes float {
            0% { opacity: 0; transform: translateY(0) scale(1); }
            10% { opacity: 0.8; }
            90% { opacity: 0.4; }
            100% { opacity: 0; transform: translateY(-800px) scale(0); }
        }

        /* Generate particles programmatically in JavaScript */

        /* Responsive adjustments */
        @media (max-width: 576px) {
            .login-container {
                padding: 25px;
            }

            .login-logo {
                width: 70px;
                height: 70px;
                font-size: 2.2rem;
            }

            .form-control {
                height: 50px;
            }

            .btn-login {
                height: 50px;
            }

            .crane {
                display: none;
            }
        }
    </style>
</head>
<body>
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

        <!-- Construction crane decoration -->
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