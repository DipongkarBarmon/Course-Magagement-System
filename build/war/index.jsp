<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Course Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
    
        body {
            background: linear-gradient(135deg, #8e44ad, #e84393);
            color: #fff;
            height: 100vh;
            font-family: 'Segoe UI', sans-serif;
        }
        .hero {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100%;
            text-align: center;
        }
        .hero h1 {
            font-size: 3rem;
            font-weight: bold;
            margin-bottom: 15px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }
        .hero p {
            font-size: 1.2rem;
            margin-bottom: 40px;
        }
        .user-buttons .btn {
            width: 200px;
            margin: 15px;
            font-size: 1.1rem;
            border-radius: 50px;
            transition: box-shadow 0.15s;
        }
        .user-buttons .btn:hover {
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);
        }
        .btn-login {
            background: #4ECDC4;
            color: #000;
        }
        .btn-signup {
            background: #FFD93D;
            color: #000;
        }
    </style>
</head>
<body>
    <div class="hero container">
        <h1>Welcome to Our Course Management System</h1>
        <p>Please choose an option to continue</p>
        <div class="user-buttons d-flex justify-content-center flex-wrap">
            <a href="Login.jsp" class="btn btn-login">Login</a>
            <a href="Signup.jsp" class="btn btn-signup">Sign up</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
