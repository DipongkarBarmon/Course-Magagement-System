<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, com.dip.Student" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enrolled Students - Course Management</title>
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
            padding: 2rem 0;
        }
        
        .main-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 1rem;
        }
        
        .page-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.1);
            padding: 2.5rem;
        }
        
        .page-header {
            text-align: center;
            margin-bottom: 2.5rem;
        }
        
        .header-icon {
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
        }
        
        .page-header h3 {
            color: #333;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }
        
        .page-header .subtitle {
            color: #666;
        }
        
        /* Student Cards Grid */
        .students-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }
        
        .student-card {
            background: white;
            border-radius: 15px;
            padding: 1.5rem;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
            border: 2px solid transparent;
            position: relative;
            overflow: hidden;
        }
        
        .student-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        
        .student-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.12);
            border-color: #667eea;
        }
        
        .student-avatar {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 700;
            font-size: 1.8rem;
            margin: 0 auto 1rem;
            box-shadow: 0 4px 12px rgba(240, 147, 251, 0.3);
        }
        
        .student-name {
            font-size: 1.1rem;
            font-weight: 700;
            color: #333;
            margin-bottom: 0.5rem;
            text-align: center;
        }
        
        .student-info {
            display: flex;
            flex-direction: column;
            gap: 0.8rem;
            margin-top: 1rem;
        }
        
        .info-item {
            display: flex;
            align-items: center;
            gap: 0.7rem;
            padding: 0.6rem;
            background: #f8f9fa;
            border-radius: 8px;
        }
        
        .info-icon {
            width: 35px;
            height: 35px;
            border-radius: 8px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 0.9rem;
        }
        
        .info-text {
            flex: 1;
            font-size: 0.9rem;
            color: #555;
            word-break: break-all;
        }
        
        .info-label {
            font-weight: 600;
            color: #333;
            font-size: 0.85rem;
            display: block;
            margin-bottom: 0.2rem;
        }
        
        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
            color: #999;
        }
        
        .empty-state i {
            font-size: 5rem;
            margin-bottom: 1.5rem;
            opacity: 0.3;
        }
        
        .empty-state h4 {
            color: #666;
            margin-bottom: 0.5rem;
        }
        
        /* Back Button */
        .btn-back {
            width: 100%;
            padding: 1rem;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 12px;
            font-weight: 600;
            font-size: 1.1rem;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
        }
        
        .btn-back:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
            color: white;
        }
        
        @media (max-width: 768px) {
            .students-grid {
                grid-template-columns: 1fr;
            }
            
            .page-card {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="main-container">
        <div class="page-card">
            <div class="page-header">
                <div class="header-icon">
                    <i class="fas fa-user-graduate"></i>
                </div>
                <h3>Enrolled Students</h3>
                <p class="subtitle">Students registered for this course</p>
            </div>
            
            <%
                List<Student> students = (List<Student>) request.getAttribute("students");
                if (students != null && !students.isEmpty()) {
            %>
            <div class="students-grid">
                <%
                    for (Student st : students) {
                        String initials = st.getFullName().substring(0, Math.min(2, st.getFullName().length())).toUpperCase();
                %>
                <div class="student-card">
                    <div class="student-avatar"><%= initials %></div>
                    <h5 class="student-name"><%= st.getFullName() %></h5>
                    <div class="student-info">
                        <div class="info-item">
                            <div class="info-icon">
                                <i class="fas fa-id-card"></i>
                            </div>
                            <div>
                                <span class="info-label">Student ID</span>
                                <div class="info-text"><%= st.getId() %></div>
                            </div>
                        </div>
                        <div class="info-item">
                            <div class="info-icon">
                                <i class="fas fa-envelope"></i>
                            </div>
                            <div>
                                <span class="info-label">Email</span>
                                <div class="info-text"><%= st.getEmail() %></div>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
            <%
                } else {
            %>
            <div class="empty-state">
                <i class="fas fa-users-slash"></i>
                <h4>No Students Enrolled</h4>
                <p>There are currently no students registered for this course.</p>
            </div>
            <%
                }
            %>
            
            <a href="teacherDashboard" class="btn-back">
                <i class="fas fa-arrow-left"></i>
                Back to Dashboard
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
