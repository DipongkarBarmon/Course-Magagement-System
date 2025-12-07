package com.dip;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Varify
 */
@WebServlet("/Verify")
public class Verify extends HttpServlet {
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String otp = request.getParameter("otp1")
	            + request.getParameter("otp2")
	            + request.getParameter("otp3")
	            + request.getParameter("otp4")
	            + request.getParameter("otp5")
	            + request.getParameter("otp6");
		HttpSession session =request.getSession();
		String sessionOtp=(String)session.getAttribute("Code");
		
		if (sessionOtp != null && sessionOtp.equals(otp)) {
              response.sendRedirect("VeificationSuccessfull.jsp");
        } else {
            response.getWriter().println("<h2>❌ Invalid OTP. Please try again.</h2>");
           
        }
	} 

}
