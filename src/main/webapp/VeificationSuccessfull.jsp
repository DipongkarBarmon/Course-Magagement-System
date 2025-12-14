<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Verification Successful - Course Management</title>
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
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      padding: 1rem;
    }
    
    .confirmation-card {
      background: rgba(255, 255, 255, 0.95);
      backdrop-filter: blur(10px);
      border-radius: 20px;
      box-shadow: 0 10px 40px rgba(0,0,0,0.15);
      padding: 3rem 2.5rem;
      text-align: center;
      width: 100%;
      max-width: 500px;
    }
    
    .success-animation {
      position: relative;
      margin: 0 auto 2rem;
      width: 120px;
      height: 120px;
    }
    
    .success-circle {
      width: 120px;
      height: 120px;
      border-radius: 50%;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      display: flex;
      align-items: center;
      justify-content: center;
      box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
      animation: scaleIn 0.5s ease-out;
    }
    
    .success-icon {
      font-size: 4rem;
      color: white;
      animation: checkmark 0.8s ease-in-out 0.3s both;
    }
    
    @keyframes scaleIn {
      0% {
        transform: scale(0);
        opacity: 0;
      }
      50% {
        transform: scale(1.1);
      }
      100% {
        transform: scale(1);
        opacity: 1;
      }
    }
    
    @keyframes checkmark {
      0% {
        transform: scale(0) rotate(0deg);
        opacity: 0;
      }
      50% {
        transform: scale(1.2) rotate(180deg);
      }
      100% {
        transform: scale(1) rotate(360deg);
        opacity: 1;
      }
    }
    
    .success-ripple {
      position: absolute;
      top: 0;
      left: 0;
      width: 120px;
      height: 120px;
      border-radius: 50%;
      border: 3px solid #667eea;
      opacity: 0;
      animation: ripple 1.5s ease-out infinite;
    }
    
    .success-ripple:nth-child(2) {
      animation-delay: 0.5s;
    }
    
    @keyframes ripple {
      0% {
        transform: scale(1);
        opacity: 0.6;
      }
      100% {
        transform: scale(1.8);
        opacity: 0;
      }
    }
    
    .confirmation-card h1 {
      font-weight: 700;
      margin-bottom: 1rem;
      color: #333;
      font-size: 2.2rem;
      animation: fadeInUp 0.6s ease-out 0.4s both;
    }
    
    .confirmation-card p {
      font-size: 1.1rem;
      margin-bottom: 2.5rem;
      color: #666;
      line-height: 1.6;
      animation: fadeInUp 0.6s ease-out 0.6s both;
    }
    
    @keyframes fadeInUp {
      from {
        opacity: 0;
        transform: translateY(20px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
    
    .btn-home {
      padding: 1rem 2.5rem;
      font-weight: 600;
      border-radius: 12px;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      text-decoration: none;
      display: inline-flex;
      align-items: center;
      gap: 0.7rem;
      font-size: 1.1rem;
      transition: all 0.3s ease;
      box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
      border: none;
      animation: fadeInUp 0.6s ease-out 0.8s both;
    }
    
    .btn-home:hover {
      transform: translateY(-2px);
      box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
      color: white;
    }
    
    .info-box {
      margin-top: 2rem;
      padding: 1.2rem;
      background: linear-gradient(135deg, rgba(102, 126, 234, 0.1) 0%, rgba(118, 75, 162, 0.1) 100%);
      border-radius: 12px;
      border: 2px solid rgba(102, 126, 234, 0.2);
      animation: fadeInUp 0.6s ease-out 1s both;
    }
    
    .info-box p {
      margin: 0;
      font-size: 0.95rem;
      color: #555;
    }
    
    .info-box i {
      color: #667eea;
      margin-right: 0.5rem;
    }
    
    @media (max-width: 576px) {
      .confirmation-card {
        padding: 2rem 1.5rem;
      }
      
      .confirmation-card h1 {
        font-size: 1.8rem;
      }
      
      .success-animation, .success-circle {
        width: 100px;
        height: 100px;
      }
      
      .success-icon {
        font-size: 3rem;
      }
    }
  </style>
</head>
<body>

<div class="confirmation-card">
  <div class="success-animation">
    <div class="success-ripple"></div>
    <div class="success-ripple"></div>
    <div class="success-circle">
      <i class="fas fa-check success-icon"></i>
    </div>
  </div>
  
  <h1>Success!</h1>
  <p>Your account has been successfully verified.<br>You can now log in and access all features.</p>
  
  <a href="Login.jsp" class="btn-home">
    <i class="fas fa-sign-in-alt"></i>
    Go to Login
  </a>
  
  <div class="info-box">
    <i class="fas fa-info-circle"></i>
    <p>Welcome to Course Management System! Start exploring courses and enhance your learning journey.</p>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
