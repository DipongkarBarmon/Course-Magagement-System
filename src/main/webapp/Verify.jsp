<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Verify OTP - Course Management</title>
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
    
    .otp-card {
      background: rgba(255, 255, 255, 0.95);
      backdrop-filter: blur(10px);
      border-radius: 20px;
      box-shadow: 0 10px 40px rgba(0,0,0,0.15);
      padding: 2.5rem;
      text-align: center;
      width: 100%;
      max-width: 480px;
    }
    
    .verify-icon {
      width: 80px;
      height: 80px;
      margin: 0 auto 1.5rem;
      border-radius: 50%;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      display: flex;
      align-items: center;
      justify-content: center;
      color: white;
      font-size: 2.5rem;
      box-shadow: 0 8px 20px rgba(102, 126, 234, 0.4);
      animation: pulse 2s infinite;
    }
    
    @keyframes pulse {
      0%, 100% {
        box-shadow: 0 8px 20px rgba(102, 126, 234, 0.4);
      }
      50% {
        box-shadow: 0 8px 30px rgba(102, 126, 234, 0.6);
      }
    }
    
    .otp-card h4 {
      font-weight: 700;
      margin-bottom: 1rem;
      color: #333;
      font-size: 1.8rem;
    }
    
    .email-display {
      margin: 1.5rem 0;
      padding: 1rem;
      background: linear-gradient(135deg, rgba(102, 126, 234, 0.1) 0%, rgba(118, 75, 162, 0.1) 100%);
      border-radius: 12px;
      border: 2px solid rgba(102, 126, 234, 0.2);
    }
    
    .email-display p {
      margin: 0 0 0.5rem 0;
      color: #666;
      font-size: 0.95rem;
    }
    
    .email-text {
      color: #667eea;
      font-weight: 700;
      font-size: 1.1rem;
      word-break: break-all;
    }
    
    .email-icon {
      font-size: 1.5rem;
      color: #667eea;
      margin-bottom: 0.5rem;
    }
    
    .otp-input-wrapper {
      margin: 2rem 0;
    }
    
    .otp-input {
      width: 100%;
      padding: 1.2rem;
      font-size: 1.5rem;
      text-align: center;
      border: 2px solid #e0e0e0;
      border-radius: 12px;
      transition: all 0.3s ease;
      letter-spacing: 0.5rem;
      font-weight: 600;
      color: #333;
    }
    
    .otp-input:focus {
      border-color: #667eea;
      box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.15);
      outline: none;
    }
    
    .otp-input::placeholder {
      letter-spacing: normal;
      font-size: 1rem;
      color: #999;
    }
    
    .btn-verify {
      width: 100%;
      padding: 1rem;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      border: none;
      border-radius: 12px;
      font-weight: 600;
      font-size: 1.1rem;
      cursor: pointer;
      transition: all 0.3s ease;
      box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 0.5rem;
    }
    
    .btn-verify:hover {
      transform: translateY(-2px);
      box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
    }
    
    .resend-section {
      margin-top: 1.5rem;
      padding-top: 1.5rem;
      border-top: 1px solid #e0e0e0;
    }
    
    .resend-text {
      color: #666;
      font-size: 0.9rem;
      margin-bottom: 0.5rem;
    }
    
    .resend-link {
      color: #667eea;
      text-decoration: none;
      font-weight: 600;
      display: inline-flex;
      align-items: center;
      gap: 0.3rem;
      transition: all 0.3s ease;
    }
    
    .resend-link:hover {
      color: #764ba2;
      gap: 0.5rem;
    }
    
    .security-note {
      margin-top: 1.5rem;
      padding: 1rem;
      background: #fff3cd;
      border-left: 4px solid #ffc107;
      border-radius: 8px;
      text-align: left;
    }
    
    .security-note i {
      color: #ffc107;
      margin-right: 0.5rem;
    }
    
    .security-note p {
      margin: 0;
      font-size: 0.85rem;
      color: #856404;
    }
    
    @media (max-width: 576px) {
      .otp-card {
        padding: 1.5rem;
      }
      
      .otp-card h4 {
        font-size: 1.5rem;
      }
      
      .verify-icon {
        width: 70px;
        height: 70px;
        font-size: 2rem;
      }
    }
  </style>
</head>
<body>

<div class="otp-card">
  <div class="verify-icon">
    <i class="fas fa-shield-alt"></i>
  </div>
  
  <h4>Verify Your Account</h4>
  
  <div class="email-display">
    <i class="fas fa-envelope email-icon"></i>
    <p>We've sent a verification code to:</p>
    <div class="email-text">
      <%= session.getAttribute("UserEmail") != null ? session.getAttribute("UserEmail") : "your email" %>
    </div>
  </div>

  <form action="Verify" method="post">
    <div class="otp-input-wrapper">
      <input type="text" 
             maxlength="6" 
             class="otp-input" 
             name="otp" 
             placeholder="Enter 6-digit code" 
             pattern="[0-9]{6}"
             required 
             autocomplete="off" />
    </div>
    
    <button type="submit" class="btn-verify">
      <i class="fas fa-check-circle"></i>
      Verify Code
    </button>
  </form>
  
  <div class="resend-section">
    <p class="resend-text">Didn't receive the code?</p>
    <a href="#" class="resend-link">
      <i class="fas fa-redo"></i>
      Resend Code
    </a>
  </div>
  
  <div class="security-note">
    <i class="fas fa-info-circle"></i>
    <p><strong>Security Tip:</strong> Never share your verification code with anyone. Our team will never ask for this code.</p>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
