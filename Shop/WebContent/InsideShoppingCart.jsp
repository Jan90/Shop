<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" import="com.dao.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Корзина</title>
<link rel="stylesheet" type="text/css" href="css/style.css" media="screen" />
</head>
<body>
<%
    ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
    if (cart == null)
    {
        cart = new ShoppingCart();
        session.setAttribute("ShoppingCart", cart);
    }
    Vector <CD>items =cart.getItems();
%>
<center><h1>Корзина</h1>
 <table><thread><tr>
            <th>Тип</th>
            <th>Жанр</th>
            <th>Название</th>
          </tr></thread>
<%
        int numItems = items.size();
        for (int i=0; i < numItems; i++)
        {
            CD item = (CD) items.elementAt(i);
%>
       <tr>
          <td><%= item.getType() %></td>
          <td><%= item.getGenre() %></td>
          <td style="width:60%"><%= item.getName() %></td>
        </tr> 
<%
        }
%>
</table>
</center>
</body>
</html>

