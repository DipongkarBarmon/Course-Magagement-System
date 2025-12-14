<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Management System - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            overflow-x: hidden;
        }
        
        /* Animated background particles */
        .particles {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: 0;
        }
        
        .particle {
            position: absolute;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            animation: float 15s infinite ease-in-out;
        }
        
        @keyframes float {
            0%, 100% { transform: translateY(0) rotate(0deg); opacity: 0; }
            10% { opacity: 1; }
            90% { opacity: 1; }
            100% { transform: translateY(-100vh) rotate(360deg); opacity: 0; }
        }
        
        .hero {
            position: relative;
            z-index: 1;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 20px;
        }
        
        .logo-container {
            margin-bottom: 2rem;
            animation: fadeInDown 1s ease-out;
        }
        
        .logo-icon {
            font-size: 5rem;
            color: #fff;
            text-shadow: 0 4px 20px rgba(0,0,0,0.3);
            animation: pulse 2s infinite;
        }
        
        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }
        
        .hero-content {
            max-width: 800px;
            animation: fadeInUp 1s ease-out 0.3s both;
        }
        
        .hero h1 {
            font-size: 3.5rem;
            font-weight: 700;
            color: #fff;
            margin-bottom: 1.5rem;
            text-shadow: 2px 4px 8px rgba(0,0,0,0.3);
            line-height: 1.2;
        }
        
        .hero p {
            font-size: 1.3rem;
            color: rgba(255,255,255,0.95);
            margin-bottom: 3rem;
            text-shadow: 1px 2px 4px rgba(0,0,0,0.2);
        }
        
        .features {
            display: flex;
            justify-content: center;
            gap: 2rem;
            margin-bottom: 3rem;
            flex-wrap: wrap;
            animation: fadeInUp 1s ease-out 0.6s both;
        }
        
        .feature-item {
            background: rgba(255,255,255,0.1);
            backdrop-filter: blur(10px);
            padding: 1.5rem;
            border-radius: 15px;
            color: #fff;
            min-width: 200px;
            transition: transform 0.3s ease, background 0.3s ease;
        }
        
        .feature-item:hover {
            transform: translateY(-5px);
            background: rgba(255,255,255,0.15);
        }
        
        .feature-item i {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            display: block;
        }
        
        .user-buttons {
            display: flex;
            gap: 2rem;
            justify-content: center;
            flex-wrap: wrap;
            animation: fadeInUp 1s ease-out 0.9s both;
        }
        
        .user-buttons .btn {
            min-width: 220px;
            padding: 1rem 2.5rem;
            font-size: 1.2rem;
            font-weight: 600;
            border-radius: 50px;
            border: none;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }
        
        .user-buttons .btn::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            border-radius: 50%;
            background: rgba(255,255,255,0.3);
            transform: translate(-50%, -50%);
            transition: width 0.6s, height 0.6s;
        }
        
        .user-buttons .btn:hover::before {
            width: 300px;
            height: 300px;
        }
        
        .user-buttons .btn span {
            position: relative;
            z-index: 1;
        }
        
        .user-buttons .btn i {
            margin-right: 0.5rem;
        }
        
        .user-buttons .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.3);
        }
        
        .btn-login {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: #fff;
        }
        
        .btn-signup {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: #fff;
        }
        
        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        @media (max-width: 768px) {
            .hero h1 {
                font-size: 2.5rem;
            }
            .hero p {
                font-size: 1.1rem;
            }
            .features {
                gap: 1rem;
            }
            .feature-item {
                min-width: 150px;
                padding: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="particles" id="particles"></div>
    
    <div class="hero container">
        <div class="logo-container">
            <i class="fas fa-graduation-cap logo-icon"></i>
        </div>
        
        <div class="hero-content">
            <h1>Welcome to Course Management System</h1>
            <p>Empowering education through seamless course administration and learning</p>
            
            <div class="features">
                <div class="feature-item">
                    <i class="fas fa-chalkboard-teacher"></i>
                    <div>Expert Teachers</div>
                </div>
                <div class="feature-item">
                    <i class="fas fa-book-reader"></i>
                    <div>Quality Courses</div>
                </div>
                <div class="feature-item">
                    <i class="fas fa-users"></i>
                    <div>Active Community</div>
                </div>
            </div>
            
            <div class="user-buttons">
                <a href="Login.jsp" class="btn btn-login">
                    <span><i class="fas fa-sign-in-alt"></i>Login</span>
                </a>
                <a href="Signup.jsp" class="btn btn-signup">
                    <span><i class="fas fa-user-plus"></i>Sign Up</span>
                </a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Create floating particles
        const particlesContainer = document.getElementById('particles');
        const particleCount = 50;
        
        for (let i = 0; i < particleCount; i++) {
            const particle = document.createElement('div');
            particle.className = 'particle';
            
            const size = Math.random() * 60 + 20;
            particle.style.width = size + 'px';
            particle.style.height = size + 'px';
            particle.style.left = Math.random() * 100 + '%';
            particle.style.animationDelay = Math.random() * 15 + 's';
            particle.style.animationDuration = (Math.random() * 10 + 10) + 's';
            
            particlesContainer.appendChild(particle);
        }
    </script>
</body>
</html>
