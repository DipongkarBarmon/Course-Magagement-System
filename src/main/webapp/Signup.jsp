<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Signup - Course Management System</title>
  
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
 <style>
    body {
        background: linear-gradient(135deg, #2193b0, #6dd5ed);
        min-height: 100vh;  
        font-family: 'Segoe UI', sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
    }
   .signup-card {
    background: #fff;
    border-radius: 12px;
    padding: 20px;
    max-width: 400px; /* narrower card */
    width: 100%;
    color: #333;
    box-shadow: 0 4px 15px rgba(0,0,0,0.15);
}

.signup-card h2 {
    text-align: center;
    margin-bottom: 18px;
    font-size: 1.3rem;
    font-weight: bold;
    color: #2193b0;
}

.form-control,
.form-select {
    border-radius: 5px;
    font-size: 0.85rem;
    padding: 6px 8px;
    height: 32px; /* force smaller height */
}

.form-control:focus,
.form-select:focus {
    border-color: #2193b0;
    box-shadow: 0 0 3px rgba(33, 147, 176, 0.4);
}

.btn-signup {
    background: #2193b0;
    color: #fff;
    font-weight: 500;
    border-radius: 30px;
    width: 100%;
    padding: 8px;
    font-size: 0.9rem;
    transition: 0.3s;
    border: none;
}

.btn-signup:hover {
    background: #176f82;
    transform: translateY(-1px);
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
}

label {
    font-weight: 400;
    font-size: 0.8rem;
}

</style>

</head>
<body>

    <div class="signup-card">
        <h2>Create Your Account</h2>
        <form action="SignupServlet" method="post">
       
            <div class="mb-3">
                <label for="name" class="form-label">Full Name</label>
                <input type="text" id="name" name="name" class="form-control" required>
            </div>

        
            <div class="mb-3">
                <label for="email" class="form-label">Email Address</label>
                <input type="email" id="email" name="email" class="form-control" required>
            </div>

     
            <div class="mb-3">
                <label for="phone" class="form-label">Phone Number</label>
                <input type="tel" id="phone" name="phone" class="form-control" required>
            </div>

        
            <div class="mb-3">
                <label for="id" class="form-label">ID Number</label>
                <input type="text" id="id" name="id" class="form-control" required>
            </div>

           
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>

           
            <div class="mb-3">
                <label for="confirmPassword" class="form-label">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required>
            </div>

      
            <div class="mb-3">
                <label class="form-label d-block">Gender</label>
                <div class="form-check form-check-inline">
                    <input type="radio" id="male" name="gender" value="Male" class="form-check-input" required>
                    <label for="male" class="form-check-label">Male</label>
                </div>
                <div class="form-check form-check-inline">
                    <input type="radio" id="female" name="gender" value="Female" class="form-check-input">
                    <label for="female" class="form-check-label">Female</label>
                </div>
                <div class="form-check form-check-inline">
                    <input type="radio" id="other" name="gende	r" value="Other" class="form-check-input">
                    <label for="other" class="form-check-label">Other</label>
                </div>
            </div>
 
            <div class="mb-3">
                <label for="userType" class="form-label">Register As</label>
                <select id="userType" name="userType" class="form-select" required>
                    <option value="">-- Select --</option>
                    <option value="Student">Student</option>
                    <option value="Teacher">Teacher</option>
                    <option value="Admin">Admin</option>
                </select>
            </div>

           
            <button type="submit" class="btn btn-signup">Sign Up</button>
        </form>
    </div>

 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
