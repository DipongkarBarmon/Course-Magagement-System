package com.dip;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserVarify
 */
@WebServlet("/UserVarify")
public class UserVarify extends HttpServlet {
 
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String name = request.getParameter("name");
	      String email = request.getParameter("email");
	      SendEmail sm=new SendEmail();
	      String code=sm.getRandom();
	      String messageText =
	    		    "<!DOCTYPE html>" +
	    		    "<html>" +
	    		    "<head>" +
	    		    "  <meta charset='UTF-8'>" +
	    		    "  <style>" +
	    		    "    body { font-family: Arial, sans-serif; color: #1c1e21; }" +
	    		    "    .container { max-width: 600px; margin: auto; padding: 20px; }" +
	    		    "    .code-box { background: #f0f4ff; border: 1px solid #d0d7de; " +
	    		    "                font-size: 22px; font-weight: bold; text-align: center; " +
	    		    "                padding: 15px; margin: 20px 0; border-radius: 6px; letter-spacing: 3px; }" +
	    		    "    .footer { color: #6c757d; font-size: 12px; margin-top: 20px; }" +
	    		    "    .link { color: #1877f2; text-decoration: none; }" +
	    		    "  </style>" +
	    		    "</head>" +
	    		    "<body>" +
	    		    "  <div class='container'>" +
	    		    "    <h2>Confirm that it's you</h2>" +
	    		    "    <p>Hi " + name + ",</p>" +
	    		    "    <p>We’re sending a security code to confirm it’s really you. " +
	    		    "       Here's the code to enter in Course Management System:</p>" +
	    		    "    <div class='code-box'>" + code + "</div>" +
	    		    "    <p style='font-size:13px; color:#606770;'>Don't share this code with anyone.</p>" +
	    		    "    <h4>If someone asks for this code</h4>" +
	    		    "    <p style='font-size:14px;'>Don't share this code with anyone, especially if they claim they work for our team. They may be trying to hack your account.</p>" +
	    		    "    <h4>Didn't request this?</h4>" +
	    		    "    <p style='font-size:14px;'>If you got this email but aren’t trying to confirm your account, someone else may be trying to access it. " +
	    		    "    You can ignore this email, and your account will remain safe.</p>" +
	    		    "    <p class='footer'>Thanks,<br>Course Management System Security</p>" +
	    		    "  </div>" +
	    		    "</body>" +
	    		    "</html>";	
	      boolean test=sm.sendVerificationEmail(email, messageText);
	      if(test) {
	    	  HttpSession session=request.getSession();
	    	  session.setAttribute("Code",code);
	    	  request.setAttribute("UserEmail", email);
	    	  response.sendRedirect("Varify.jsp");
	      }
	      
	}

}
