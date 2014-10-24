package com.servlet;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.GetData;


public class PopulateDropDownList extends HttpServlet {
	
	 private static final long serialVersionUID = 1L;
	
	@Override
	//@WebServlet("/PopulateDropDown")
	public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws java.io.IOException, ServletException {
		
       doPost(request, response);
		
    }
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws java.io.IOException,ServletException {
		String type=request.getParameter("type");
		ArrayList<String>genres=new ArrayList<String>();
		try {
			genres=GetData.getForDropDown(type);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		  
		
		response.setContentType("text/xml");
        response.addHeader("Access-Control-Allow-Origin","*");
          PrintWriter out = response.getWriter();
         out.println("<option>");
          
			for(String genre:genres)
			  {          
			      out.println("<genre>"+genre+"</genre>");
			  }
          out.println("</option>");
            
 
	}
         
             
       
 	

	
	}

