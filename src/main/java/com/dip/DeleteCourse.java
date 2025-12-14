package com.dip;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/DeleteCourse")
public class DeleteCourse extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/Course_Management_System";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "dip";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String courseCode = request.getParameter("id");

        if (courseCode == null || courseCode.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid CourseCode");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {

                 try (PreparedStatement psRel = conn.prepareStatement(
                        "DELETE FROM StudentCourses WHERE CourseCode = ?")) {
                    psRel.setString(1, courseCode);
                    psRel.executeUpdate();
                }

                 
                try (PreparedStatement ps = conn.prepareStatement(
                        "DELETE FROM Courses WHERE CourseCode = ?")) {
                    ps.setString(1, courseCode);
                    int rowsAffected = ps.executeUpdate();

                    if (rowsAffected > 0) {
                        response.sendRedirect("AdminDashboard.jsp");
                    } else {
                        response.sendError(HttpServletResponse.SC_NOT_FOUND, "Course not found");
                    }
                }
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "JDBC Driver not found");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Use POST to delete courses");
    }
}
