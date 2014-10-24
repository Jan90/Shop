
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import = "java.util.*" import="com.dao.*,java.net.*,java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Список позиций</title>
<link rel="stylesheet" type="text/css" href="css/style.css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/listOfProductsStyle.css" media="screen" />
<script  src="js/listOfProductsJS.js" charset="UTF-8"></script>
</head>
<body>
<div class="container" id="container" >
<div class="searchBy">
<div class="dropDown">
<form name="dropDown">
Тип: <select id ="type" name="prodType" onchange="getGenres(this.value)">
            <option>select</option>
            <option value="video">video</option> 
            <option value="audio">audio</option>      
    </select>
Жанр: <select id="genre" onchange="showProductList()">
            <option>------------choose------------</option>
    </select>
 </form>
</div>
<div class="search">
<form  action="SearchItemsByName">
<input class="text" type="text" size="20" onchange="showProductListByName(this.value)"/>
<input  class="text" type="submit" value="Поиск" />
</form>
</div> 
</div>
<div class="content" id="content">
<% 
int currentPage=(Integer)request.getAttribute("currentPage");
int noOfPages=(Integer)request.getAttribute("noOfPages");
List <CD> paginProdList=(ArrayList<CD>)request.getAttribute("paginProdList");
Iterator <CD> paginProdListIterator = paginProdList.iterator();
  %>
 <form name="productList" action="" onsubmit="addToShoppingCart();return false;">
 <div class="productList">
<p>
<center>
<h1>CD Каталог</h1>
 <table>
<thread><tr>
<th></th>
<th>Тип</th>
<th>Жанр</th>
<th>Название</th>
</tr></thread>
 <%      
       while (paginProdListIterator.hasNext())
        {         
          CD item = (CD)paginProdListIterator.next();         
%>
<tr>
<td>  
<input type="checkbox"  name= "Type" value='<%= item.getType() %>'><td><%= item.getType() %></td>
<input type="hidden" name= "Genre" value='<%= item.getGenre() %>'><td><%= item.getGenre() %></td>
<input type="hidden"  name= "Name" value='<%= item.getName() %>'><td style="width:60%;"><%= item.getName() %></td> 
</tr>
<%
        } 
%>
</table>
</center>
</div>
<div>
<input class="button" type="submit" value="В корзину" >
</div>
</form>
<div class="pagination">
<a href="#"onclick="showPaginProductList(1)"> << </a>
	<% if (currentPage==1) {%>
	<a href="#"onclick="showPaginProductList(<%= page %>)"> <  </a>  
	<% } else  if(currentPage!=1) {%>
	<a href="#"onclick="showPaginProductList(<%= page %>)">  <   </a>    <%}%>  
	<% for(int i=currentPage;i<=noOfPages;i++){%>
	<a href="#"onclick="showPaginProductList(<%=i%>)"><%=i%></a> <% }%>
	<% if (currentPage!=noOfPages){%> 
	<a href="#"onclick="showPaginProductList(<%=currentPage+ 1%>)">    >    </a><%}%>
	<a href="#"onclick="showPaginProductList(<%=noOfPages%>)">    >>    </a>
</div >
</div>
</div>
</body>
</html>
