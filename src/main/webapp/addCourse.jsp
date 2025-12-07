<%@ page import="java.sql.*" %>
<%
    String url = "jdbc:mysql://localhost:3306/Course_Management_System";
    String user = "root";
    String pass = "dip";

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(url, user, pass);
    Statement st = conn.createStatement();

    // ✅ Get only teachers
    ResultSet teachers = st.executeQuery("SELECT IdNumber, Fullname FROM SignupDetails WHERE RegisterAs='teacher'");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Course</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2>Add New Course</h2>
    <form action="AddCourse" method="post">
        <div class="mb-3">
            <label class="form-label">Course Name</label>
            <input type="text" name="course_name" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Course Code</label>
            <input type="text" name="course_code" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Assign Teacher</label>
            <select name="teacher_id" class="form-control">
                <option value="">-- Select Teacher --</option>
                <% while(teachers.next()) { %>
                    <option value="<%= teachers.getInt("IdNumber") %>">
                        <%= teachers.getString("Fullname") %>
                    </option>
                <% } %>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Add Course</button>
    </form>
</div>
</body>
</html>
<%
    teachers.close();
    st.close();
    conn.close();
%>
