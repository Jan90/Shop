package com.servlet;

import javax.servlet.*;
import javax.servlet.http.*;

import java.util.*;
import java.io.*;

import com.dao.*;
public class AddToShoppingCart extends HttpServlet
 {
	private static final long serialVersionUID = 1L;
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws java.io.IOException, ServletException {
		
       doPost(request, response);
    }
	@Override
	public void doPost(HttpServletRequest request,
        HttpServletResponse response)
        throws IOException, ServletException
    {
		int i;
		int j;
		int k;
		String[] splitItem=null;
		String itemsArray[]  =request.getParameterValues("itemsArray");
		for(String item:itemsArray){
		splitItem =  item.split(",");
		for( i=0, j=1,k=2; k<splitItem.length;i+=3,j+=3,k+=3){
		String genre = splitItem[i];
		String type= splitItem[j];
        String name = splitItem[k];
        CD CDItem = new CD(name, type, genre);
        HttpSession session = request.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
        if (cart == null)
        {
            cart = new ShoppingCart();
            session.setAttribute("ShoppingCart", cart);
        }
        cart.addItem(CDItem);
			}
		}
    } 
}
