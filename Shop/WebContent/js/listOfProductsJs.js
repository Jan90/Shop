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