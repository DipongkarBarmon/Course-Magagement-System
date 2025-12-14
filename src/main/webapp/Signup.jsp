<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Course Management System</title>
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
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 20px;
        }
        
        .signup-container {
            width: 100%;
            max-width: 550px;
            animation: fadeInUp 0.6s ease-out;
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
        
        .signup-box {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            padding: 2.5rem;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
        }
        
        .signup-header {
            text-align: center;
            margin-bottom: 2rem;
        }
        
        .signup-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.4);
        }
        
        .signup-icon i {
            font-size: 2.5rem;
            color: white;
        }
        
        .signup-header h2 {
            font-weight: 700;
            color: #333;
            margin-bottom: 0.5rem;
        }
        
        .signup-header p {
            color: #666;
            font-size: 0.95rem;
        }
        
        .form-section {
            margin-bottom: 1.2rem;
        }
        
        .form-label {
            font-weight: 600;
            color: #333;
            margin-bottom: 0.5rem;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .form-label i {
            color: #667eea;
            width: 18px;
        }
        
        .input-group-custom {
            position: relative;
        }
        
        .input-group-custom > i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #667eea;
            font-size: 1rem;
            z-index: 10;
        }
        
        .form-control {
            padding: 0.75rem 1rem 0.75rem 2.8rem;
            border: 2px solid #e0e0e0;
            border-radius: 12px;
            font-size: 0.95rem;
            transition: all 0.3s ease;
            background: white;
        }
        
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.15);
            outline: none;
        }
        
        .password-toggle {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #999;
            z-index: 10;
            font-size: 1rem;
        }
        
        .password-toggle:hover {
            color: #667eea;
        }
        
        .radio-group, .checkbox-group {
            display: flex;
            gap: 1.5rem;
            margin-top: 0.5rem;
            flex-wrap: wrap;
        }
        
        .form-check {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .form-check-input {
            width: 20px;
            height: 20px;
            border: 2px solid #667eea;
            cursor: pointer;
        }
        
        .form-check-input:checked {
            background-color: #667eea;
            border-color: #667eea;
        }
        
        .form-check-label {
            cursor: pointer;
            color: #333;
            font-size: 0.9rem;
            margin: 0;
        }
        
        .btn-signup {
            width: 100%;
            padding: 0.9rem;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 12px;
            font-weight: 600;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.3);
            margin-top: 1rem;
        }
        
        .btn-signup:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 25px rgba(102, 126, 234, 0.4);
        }
        
        .btn-signup:active {
            transform: translateY(0);
        }
        
        .btn-signup i {
            margin-right: 0.5rem;
        }
        
        .divider {
            text-align: center;
            margin: 1.5rem 0;
            position: relative;
        }
        
        .divider::before {
            content: '';
            position: absolute;
            left: 0;
            top: 50%;
            width: 100%;
            height: 1px;
            background: #e0e0e0;
        }
        
        .divider span {
            background: rgba(255, 255, 255, 0.95);
            padding: 0 1rem;
            position: relative;
            color: #999;
            font-size: 0.85rem;
        }
        
        .login-link {
            text-align: center;
            margin-top: 1.5rem;
            color: #666;
            font-size: 0.95rem;
        }
        
        .login-link a {
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }
        
        .login-link a:hover {
            color: #764ba2;
            text-decoration: underline;
        }
        
        .back-home {
            text-align: center;
            margin-top: 1.5rem;
        }
        
        .back-home a {
            color: white;
            text-decoration: none;
            font-size: 0.9rem;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.5rem 1rem;
            background: rgba(255,255,255,0.2);
            border-radius: 20px;
            transition: all 0.3s ease;
        }
        
        .back-home a:hover {
            background: rgba(255,255,255,0.3);
        }
        
        @media (max-width: 576px) {
            .signup-box {
                padding: 2rem 1.5rem;
            }
            
            .signup-header h2 {
                font-size: 1.5rem;
            }
            
            .radio-group {
                gap: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="signup-container">
        <div class="signup-box">
            <div class="signup-header">
                <div class="signup-icon">
                    <i class="fas fa-user-plus"></i>
                </div>
                <h2>Create Account</h2>
                <p>Join our learning community today</p>
            </div>
            
            <form action="SignupServlet" method="post" id="signupForm">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-section">
                            <label class="form-label">
                                <i class="fas fa-user"></i> Full Name
                            </label>
                            <div class="input-group-custom">
                                <i class="fas fa-user"></i>
                                <input type="text" class="form-control" name="name" 
                                       placeholder="Dipongkar Barmon" required>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <div class="form-section">
                            <label class="form-label">
                                <i class="fas fa-id-card"></i> ID Number
                            </label>
                            <div class="input-group-custom">
                                <i class="fas fa-id-card"></i>
                                <input type="text" class="form-control" name="id" 
                                       placeholder="ID-2022331084" required>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-section">
                            <label class="form-label">
                                <i class="fas fa-envelope"></i> Email Address
                            </label>
                            <div class="input-group-custom">
                                <i class="fas fa-envelope"></i>
                                <input type="email" class="form-control" name="email" 
                                       placeholder="your email@gmail.com" required>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <div class="form-section">
                            <label class="form-label">
                                <i class="fas fa-phone"></i> Phone Number
                            </label>
                            <div class="input-group-custom">
                                <i class="fas fa-phone"></i>
                                <input type="tel" class="form-control" name="phone" 
                                       placeholder="01712345689" required>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-section">
                            <label class="form-label">
                                <i class="fas fa-lock"></i> Password
                            </label>
                            <div class="input-group-custom">
                                <i class="fas fa-lock"></i>
                                <input type="password" class="form-control" id="password" 
                                       name="password" placeholder="Create password" required>
                                <i class="fas fa-eye password-toggle" id="togglePassword"></i>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <div class="form-section">
                            <label class="form-label">
                                <i class="fas fa-lock"></i> Confirm Password
                            </label>
                            <div class="input-group-custom">
                                <i class="fas fa-lock"></i>
                                <input type="password" class="form-control" id="confirmPassword" 
                                       name="confirmPassword" placeholder="Confirm password" required>
                                <i class="fas fa-eye password-toggle" id="toggleConfirmPassword"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <label class="form-label">
                        <i class="fas fa-venus-mars"></i> Gender
                    </label>
                    <div class="radio-group">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="gender" 
                                   id="male" value="Male" required>
                            <label class="form-check-label" for="male">Male</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="gender" 
                                   id="female" value="Female">
                            <label class="form-check-label" for="female">Female</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="gender" 
                                   id="other" value="Other">
                            <label class="form-check-label" for="other">Other</label>
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <label class="form-label">
                        <i class="fas fa-user-tag"></i> Register As
                    </label>
                    <div class="radio-group">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="userType" 
                                   id="studentOption" value="Student" required>
                            <label class="form-check-label" for="studentOption">
                                <i class="fas fa-user-graduate"></i> Student
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="userType" 
                                   id="teacherOption" value="Teacher">
                            <label class="form-check-label" for="teacherOption">
                                <i class="fas fa-chalkboard-teacher"></i> Teacher
                            </label>
                        </div>
                    </div>
                </div>

                <button type="submit" class="btn btn-signup">
                    <i class="fas fa-user-plus"></i>Create Account
                </button>

                <div class="divider">
                    <span>OR</span>
                </div>

                <div class="login-link">
                    Already have an account? <a href="Login.jsp">Login Here</a>
                </div>
            </form>
        </div>
        
        <div class="back-home">
            <a href="index.jsp">
                <i class="fas fa-home"></i>
                Back to Home
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
