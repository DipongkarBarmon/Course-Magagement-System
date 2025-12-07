<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .login-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-box {
            background: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0px 8px 20px rgba(0,0,0,0.1);
            width: 400px;
            text-align: center;
        }
        .login-box h2 {
            font-weight: bold;
            margin-bottom: 10px;
            color: #333;
        }
        .login-box p {
            color: #6c757d;
            margin-bottom: 20px;
        }
        .form-control, .form-select {
            border-radius: 8px;
        }
        .btn-login {
            background-color: #6a1b9a;
            color: #fff;
            font-weight: bold;
            border-radius: 8px;
            padding: 10px;
        }
        .btn-login:hover {
            background-color: #4a148c;
            color: #fff;
        }
        .forgot {
            font-size: 14px;
            color: #6a1b9a;
            text-decoration: none;
        }
        .forgot:hover {
            text-decoration: underline;
        }
        .signup {
            margin-top: 20px;
            font-size: 14px;
        }
        .signup a {
            color: #6a1b9a;
            font-weight: 500;
            text-decoration: none;
        }
        .signup a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="login-container">
    <div class="login-box">
        <h2>Login to your Account</h2>
        <form action="Login" method="post">
            <!-- Email -->
            <div class="mb-3 text-start">
                <label class="form-label">Email</label>
                <input type="email" class="form-control" name="email" placeholder="mail@abc.com" required>
            </div>

            <!-- Password -->
            <div class="mb-3 text-start">
                <label class="form-label">Password</label>
                <input type="password" class="form-control" name="password" placeholder="********" required>
            </div>

            <!-- User Type -->
            <div class="mb-3 text-start">
                <label class="form-label">Login As</label>
                <select class="form-select" name="userType" required>
                    <option value="">-- Select --</option>
                    <option value="Student">Student</option>
                    <option value="Teacher">Teacher</option>
                    <option value="Admin">Admin</option>
                </select>
            </div>

            <div class="d-flex justify-content-between mb-3">
                <a href="#" class="forgot">Forgot Password?</a>
            </div>

            <button type="submit" class="btn btn-login w-100">Login</button>

            <div class="signup text-center">
                Don't have an account? <a href="Signup.jsp">Sign Up</a>
            </div>
        </form>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
