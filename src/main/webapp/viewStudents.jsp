<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, com.dip.Student" %>
<!DOCTYPE html>
<html>
<head>
    <title>Enrolled Students</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background: linear-gradient(to right, #a18cd1, #fbc2eb);">
<div class="container mt-5">
    <div class="card shadow-lg p-4 rounded-4">
        <h3 class="text-center text-success">Enrolled Students</h3>
        <table class="table table-striped table-hover mt-4">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>Email</th>
                </tr>		
            </thead>
            <tbody>
            <%
                List<Student> students = (List<Student>) request.getAttribute("students");
                if (students != null && !students.isEmpty()) {
                    for (Student st : students) {
            %>
                <tr>
                    <td><%= st.getId() %></td>
                    <td><%= st.getFullName()%></td>
                    <td><%= st.getEmail() %></td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr><td colspan="3" class="text-center">No students registered</td></tr>
            <%
                }
            %>
            </tbody>
        </table>
        <a href="TeacherDashboard" class="btn btn-primary">Back</a>
    </div>
</div>
</body>
</html>
