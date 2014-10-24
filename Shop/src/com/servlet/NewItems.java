package com.servlet;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.CD;
import com.dao.GetData;

public class NewItems extends HttpServlet {
	 private static final long serialVersionUID = 1L;
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
           throws java.io.IOException, ServletException {
      doPost(request, response);
   }
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws java.io.IOException,ServletException {
		ArrayList<CD> newItems = GetData.getNewItems();
		request.setAttribute("newItems", newItems);
		RequestDispatcher view = request.getRequestDispatcher("mainPage.jsp");
    	view.forward(request, response);
    	return;
		}
	}