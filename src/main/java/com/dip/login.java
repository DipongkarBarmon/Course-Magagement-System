package com.dip;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.dip.dao.Logindao;

@WebServlet("/Login")
public class login extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email").trim();
        String pass = request.getParameter("password").trim();
        String user = request.getParameter("userType").trim();
       
        Logindao dao = new Logindao();
        int userId=dao.getUserId(email, pass, user);
        System.out.println(userId);

        if (userId > 0) {
        	String fullName =dao.getName(userId);
            HttpSession session = request.getSession();
            session.setAttribute("userId", userId);
            session.setAttribute("userRole", user);
            session.setAttribute("userName", fullName);

            switch (user) {
                case "Student":
                    response.sendRedirect("StudentDashboard.jsp");
                    break;
                case "Teacher":
                    response.sendRedirect("teacherDashboard");
                    break;
                case "Admin":
                    response.sendRedirect("adminServlet");
                    break;
                default:
                    response.getWriter().println("Invalid user type!");
                    break;
            }
        } else {
            response.getWriter().println("Invalid email or password!");
        }
    }
}
