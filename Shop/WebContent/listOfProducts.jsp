
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
<script type="text/javascript">
function getXMLHttpRequest() {
	xmlHttpRequest=null;
	var xmlHttpReq = null;
	// to create XMLHttpRequest object in non-Microsoft browsers
	if (window.XMLHttpRequest) {
		xmlHttpReq = new XMLHttpRequest();
	} else {
		try {
			// to create XMLHttpRequest object in later versions
			// of Internet Explorer
			xmlHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (wrong_brouser_ver) {
			try {
				// to create XMLHttpRequest object in older versions
				// of Internet Explorer
				xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (wrong_response) {
				xmlHttpReq = false;
			}
		}
	}
	return xmlHttpReq;
}
function showProductList(){
	var type;
	var genre;
	var xmlhttp;
	type = document.getElementById("type");
	type = type.options[type.selectedIndex].value;
	genre = document.getElementById("genre");
	genre = genre.options[genre.selectedIndex].text;
	xmlhttp=getXMLHttpRequest();
if (xmlhttp==null)
{alert ("Brouser don`t support http");return;} 
	xmlhttp.onreadystatechange=function() {
	if (xmlhttp.readyState==4){
    document.getElementById("content").innerHTML= xmlhttp.responseText;
    }
 } 
xmlhttp.open("GET","http://localhost:8181/CDShop/getData.do?type="+type+"&genre="+genre,true);
xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
xmlhttp.send(null);
}
function showProductListByName(name){
	var xmlhttp;    
	xmlhttp=getXMLHttpRequest();
	if (xmlhttp==null)
	{alert ("Brouser don`t support http");return;} 
	xmlhttp.onreadystatechange=function() {
	if (xmlhttp.readyState==4){
    document.getElementById("content").innerHTML= xmlhttp.responseText;
    }
}
xmlhttp.open("GET","http://localhost:8181/CDShop/getData.do?name="+name,true);
xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
xmlhttp.send(null);
}
function showPaginProductList(page){	
	var xmlhttp;    
	xmlhttp=getXMLHttpRequest();
	if (xmlhttp==null)
	{alert ("Brouser don`t support http");return;} 
	xmlhttp.onreadystatechange=function() {	
	if (xmlhttp.readyState==4){
    document.getElementById("content").innerHTML= xmlhttp.responseText;
    }
}  
xmlhttp.open("GET","http://localhost:8181/CDShop/getData.do?page="+page,true);
xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
xmlhttp.send(null);
}
function addToShoppingCart(){
	var genre;
	var type;
	var name;
	var xmlhttp;
	var itemsArray = [];
	for(var i = 0;; i++){
		if(document.productList.Type[i]==null){break;}
		if(document.productList.Type[i].checked==true){
	document.productList.Type[i].checked=false;
	genre = document.productList.Genre[i].value;
	type = document.productList.Type[i].value;
	name = document.productList.Name[i].value;
	itemsArray.push(genre,type,name);
	}
}   
	xmlhttp=getXMLHttpRequest();
	if (xmlhttp==null)
	{alert ("Brouser don`t support http");return;}
xmlhttp.open("GET","http://localhost:8181/CDShop/AddToShoppingCart.do?itemsArray="+itemsArray,true);
xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
xmlhttp.send(null);
alert("Данная позиция была успешно добавлена в Вашу корзину");
	}
function getGenres(value) {
	var xmlhttp;
	var xmlDoc;
	var genre;
	var url;
	xmlhttp = getXMLHttpRequest();
	if (xmlhttp==null){alert ("Brouser don`t support http");return;} 
	url="http://localhost:8181/CDShop/fillDropDown.do";
	url=url+"?type="+value;
 	url=url+"&sid="+Math.random();
 	xmlhttp.open("GET", url, true);
 	xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
 	xmlhttp.send(null);
 	xmlhttp.onreadystatechange = function() {
	removeall();
	 if (xmlhttp.readyState==4){
		xmlDoc= xmlhttp.responseXML.documentElement;
		 var i=0;
			 while(xmlDoc!=null){
				 genre =xmlDoc.getElementsByTagName("genre")[i].childNodes[0].nodeValue;
				 addOptions(genre);
				 i++;
	                    }
			 }
		 
	 }

}
function addOptions(genre)
{
	 var gen = document.getElementById("genre");
	 var opt = document.createElement("option");
	 opt.innerHTML = genre;
	 gen.appendChild(opt);
}
function removeall()
{
    var genres=document.dropDown.genre.length;
    for(var i=genres; i>=0; i--)    {    
        document.dropDown.genre.options[i]=null;
         }
}
</script>
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
