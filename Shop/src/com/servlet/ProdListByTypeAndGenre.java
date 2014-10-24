package com.servlet;

	import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;






import com.dao.CD;
import com.dao.GetData;


	public class ProdListByTypeAndGenre extends HttpServlet {
		 private static final long serialVersionUID = 1L;
		 private ArrayList<CD> productList;
		@Override
		public void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws java.io.IOException, ServletException {
	       doPost(request, response);
	    }
		@Override
		public void doPost(HttpServletRequest request, HttpServletResponse response)
				throws java.io.IOException,ServletException {
			int page = 1;
			int recordsPerPage = 5;
				if(request.getParameter("type")!= null & request.getParameter("genre") != null){
						String type=request.getParameter("type");
						String genre=request.getParameter("genre");
				try {
					productList=GetData.getProdListByTypeAndGenre(type,genre);
					
				} catch (Exception e) {
					
					e.printStackTrace();
				}
				}else if(request.getParameter("name") != null){
						String name=request.getParameter("name");
	        	try {
	        		productList=GetData.getProdListByName(name);
				} catch (Exception e) {
					
					e.printStackTrace();
				}
				}else if(request.getParameter("type")== null & request.getParameter("genre") == null&request.getParameter("name") == null&request.getParameter("page") == null){
	        	try {
					productList=GetData.getProdList();
	        		} catch (Exception e) {
	        			
					e.printStackTrace();
				}
	        	ArrayList<CD> list = GetData.getPaginProdList((page-1)*recordsPerPage,
	                                     recordsPerPage,productList);
	        	int noOfRecords =productList.size();
	        	int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
	        	request.setAttribute("paginProdList", list);
	        	request.setAttribute("noOfPages", noOfPages);
	        	request.setAttribute("currentPage", page);
	        	RequestDispatcher view = request.getRequestDispatcher("listOfProducts.jsp");
	        	view.forward(request, response);
	        	return;} else{   }
				if(request.getParameter("page") != null){
					page = Integer.parseInt(request.getParameter("page"));}
	        			if(productList.size()< 5){recordsPerPage=productList.size();}
	        				ArrayList<CD> paginProdList = GetData.getPaginProdList((page-1)*recordsPerPage,
	                                 recordsPerPage,productList);
	        				int noOfRecords =productList.size(); 
	        				int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
	        				Iterator <CD> paginProdListIterator = paginProdList.iterator();
	        				response.setContentType("text/html");
	        				response.setCharacterEncoding("UTF-8");
	        				response.addHeader("Access-Control-Allow-Origin","*");
	        				PrintWriter out = response.getWriter();
	        				out.println("<form name='productList'  action='' onsubmit='addToShoppingCart();return false;'>");
	        				out.println("<div  class = 'productList'><p><center><h1>CD Каталог</h1><table><thread><tr><th></th><th>Тип</th><th>Жанр</th><th>Название</th></tr></thread>");
	        				while (paginProdListIterator.hasNext())
	        				{         
	        					CD item = (CD)paginProdListIterator.next();
	        					out.println("<td>");
	        					out.println("<input type='checkbox' name= 'Type' value='"+item.getType()+"'</td><td>"+item.getType()+"</td>");
	        					out.println("<td>");
	        					out.println("<input type='hidden' name= 'Genre' value='"+ item.getGenre()+"'<td>"+item.getGenre()+"</td>");
	        					out.println("<td>");
	        					out.println("<input type='hidden' name= 'Name' value='"+ item.getName() +"'<td style='width:60%'>"+item.getName()+"</td>");
	        					out.println("</tr>"); 			 
	        				}
	        				out.println("</table>");
	        				out.println("<div>");
	        				out.println("<input class='button' type='submit'  value='В корзину' > </div>");
	        				out.println("</form>"); 
	        				out.println("<div class='pagination'>");
	        				out.println("<a href='#'onclick='showPaginProductList(1)'> << </a>"); 
	        				if (page==1){
	        					out.println("<a href='#'onclick='showPaginProductList("+ page +")'> <  </a>");    
	        				} else  if(page!=1) {
	        					out.println("<a href='#'onclick='showPaginProductList("+ page +")'>       <   </a>"); } 
	        				for(int i=page;i<=noOfPages;i++){
	        					out.println("<a href='#'onclick='showPaginProductList("+i+")'>"+i+"</a>  ");}
	        				if (page!=noOfPages){ 
	        					out.println("<a href='#'onclick='showPaginProductList("+(page+ 1)+")'>    >    </a>");   }
	        					out.println("<a href='#'onclick='showPaginProductList("+noOfPages+")'>      >> </a>     ");
	        					out.println("</div >");
		}

            }