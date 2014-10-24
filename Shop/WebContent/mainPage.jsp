<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.*" import="com.dao.*,java.net.*,java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css" media="screen" />
<title>Главная</title>
</head>
<body><% 
List <CD> newItems=(ArrayList<CD>)request.getAttribute("newItems");
Iterator <CD> newItemsIterator = newItems.iterator();%>
<div class="content">
<div class="inf"> В нашем мире сложно представить человека, который бы не слушал музыку. У каждого из нас есть свои любимые исполнители и музыкальные направления. Многие фанаты мечтают попасть на концерты некоторых групп и певцов. И, главное, каждый из нас хочет иметь новые альбомы любимых исполнителей. Сегодня не обязательно купить музыку на CD, чтобы прослушать композиции.  всю музыку можно скачать в интернете. Но каково качество такой музыки? Звукозапись - сложный процесс. Полноту звука можно услышать только на оригинальных носителях. Это знает любой меломан. А, во-вторых, многие дисковые издания включают буклеты. В них содержатся фотографии, тексты песен и другая информация. Вы тоже обожаете хорошую музыку? Тогда наш интернет магазин музыки на CD дисках будет вам полезен.
На сайте нашего магазина вы всегда найдете музыкальные новинки со всего мира. Мы предлагаем вам широчайший выбор музыкальных дисков во всей Украине. В нашем магазине осуществляется продажа только лицензионной музыки.
В нашем музыкальном разделе вы увидите всех интересующих вас исполнителей. Мы стараемся сделать ее доступной нашим покупателям.</div>
<div class="newItems">
<center>
<h1>Новинки</h1>
 <table>
<thread><tr>
<th>Тип</th>
<th>Жанр</th>
<th>Название</th>
</tr></thread>
 <%      
       while (newItemsIterator.hasNext())
        {         
          CD newItem = (CD)newItemsIterator.next();         
%>
<tr>
  
<input type="hidden"  name= "Type" value='<%= newItem.getType() %>'><td><%= newItem.getType() %></td>
<input type="hidden" name= "Genre" value='<%= newItem.getGenre() %>'><td><%=newItem.getGenre() %></td>
<input type="hidden"  name= "Name" value='<%= newItem.getName() %>'><td style="width:60%;"><%= newItem.getName() %></td> 
</tr>
<%
        } 
%>
</table>
</center></div>
</div>
</body>
</html>