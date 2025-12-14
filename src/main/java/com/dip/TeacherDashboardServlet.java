package com.dip;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/teacherDashboard")
public class TeacherDashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }
        int teacherId = (Integer) session.getAttribute("userId");
        System.out.println("Teacher ID from session: " + teacherId);
   
        List<Course> courseList = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Course_Management_System", "root", "dip"
            );

            PreparedStatement ps = conn.prepareStatement(
                "SELECT CourseName,CourseCode FROM Courses WHERE TeacherId = ?"
            );
            ps.setInt(1, teacherId);
            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
            	System.out.println(rs.getString("CourseName") + " - " + rs.getString("CourseCode"));
                Course c = new Course();
                
                c.setCourseName(rs.getString("CourseName"));
                c.setCourseCode(rs.getString("CourseCode"));
                courseList.add(c);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch(Exception e) {
            e.printStackTrace();
        }

       
        request.setAttribute("courses", courseList);

        RequestDispatcher rd = request.getRequestDispatcher("teacherDashboard.jsp");
        rd.forward(request, response);
    }
}
