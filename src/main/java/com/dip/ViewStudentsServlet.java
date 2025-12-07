	package com.dip;
	
	import java.io.IOException;
	import java.sql.*;
	import java.util.ArrayList;
	import java.util.List;
	import javax.servlet.*;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.*;
	
	@WebServlet("/ViewStudents")
	public class ViewStudentsServlet extends HttpServlet {
	    private static final long serialVersionUID = 1L;
	
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	
	        //int courseId = Integer.parseInt(request.getParameter("C"));
	    	String courseCode=request.getParameter("courseId");
	    			
	    			
	    	
	
	        List<Student> students = new ArrayList<>();
	
	        try (Connection con = DriverManager.getConnection(
	                "jdbc:mysql://localhost:3306/Course_Management_System", "root", "dip");
	             PreparedStatement ps = con.prepareStatement(
	                     "SELECT s.IdNumber, s.Fullname, s.Mail " +
	                     "FROM StudentCourses sc " +
	                     "JOIN SignupDetails s ON sc.StudentId = s.IdNumber " +
	                     "WHERE sc.CourseCode = ?")) {
	
	            ps.setString(1, courseCode);
	            ResultSet rs = ps.executeQuery();
	
	            while (rs.next()) {
	            	Student st = new Student();
	            	rs.getInt("IdNumber");
                    rs.getString("Fullname");
                    rs.getString("Mail");
	                students.add(st);
	            }
	
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	
	        request.setAttribute("students", students);
	        RequestDispatcher rd = request.getRequestDispatcher("viewStudents.jsp");
	        rd.forward(request, response);
	    }
	}
