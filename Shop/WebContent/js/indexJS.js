function changeColButAndCon(buttonId)
{
    changeButtonColor(buttonId);
	nextPage(buttonId);	
}
function changeButtonColor(buttonId){
resetButton();
document.getElementById(buttonId).style.backgroundColor="#1e8449";
}
function nextPage(buttonId){
var buttonValue = document.getElementById(buttonId).value;
switch (buttonValue) {
case '�������':
	document.getElementById("content").innerHTML = "<iframe width='100%' height='465' src='NewItems.do' frameborder='0'></iframe>";;
	break;
case '�������':
	document.getElementById("content").innerHTML = "<iframe width='100%' height='465' src='getData.do' frameborder='0'></iframe>";
	break;
case "�������":
	document.getElementById("content").innerHTML = "<iframe width='100%' height='465' src='InsideShoppingCart.jsp' frameborder='0'></iframe>";
	break;
	}
}
function resetButton(){
	var buttons = document.getElementsByTagName("input");
	var buttonsCount = buttons.length;
	for (var i = 0; i <= buttonsCount-1; i+=1) {
	   var buttonId= buttons[i].id;
	   var currentColor=document.getElementById(buttonId).style.backgroundColor;
	   if(toHexColor(currentColor)=="#1e8449"){
		   document.getElementById(buttonId).style.backgroundColor="#e6b981";
		  break;  
	   } 
	}	
}
function toHexColor( color ) {
	    return color.replace( /rgba?\(([^\)]+)\)|#([a-f0-9]{6}|[a-f0-9]{3})/ig, function( m, rgb, hex ) {
	        if ( rgb = /([0-9\.]+)(\%?)\s*,\s*([0-9\.]+)(\%?)\s*,\s*([0-9\.]+)(\%?)\s*(?:,\s*([0-9\.]+))?/g.exec( rgb || "" ) ) {
	            hex = parseInt( rgb[2] ? rgb[1] * 2.55 : rgb[1] ).toString( 16 ).replace( /^(.)$/, '0$1' ) +
	                parseInt( rgb[4] ? rgb[3] * 2.55 : rgb[3] ).toString( 16 ).replace( /^(.)$/, '0$1' ) +
	                parseInt( rgb[6] ? rgb[5] * 2.55 : rgb[5] ).toString( 16 ).replace( /^(.)$/, '0$1' );
	            m = rgb[ 7 ] == "" || rgb[ 7 ] === undefined ? 1 : parseFloat( rgb[ 7 ] );
	        } else if ( hex && ( m = 1 ) ) {
	            hex = hex.replace( /^(.)(.)(.)$/, "$1$1$2$2$3$3" );
	        } else {
	            return m;
	        }
	        return "#" + hex;
	    });
	}
	
function changeBg(color){
	var body = document.getElementById("container");
	var count = body.getElementsByTagName("div").length;
	for(var i=0;i<=count;i++){
	document.getElementsByTagName("div")[i].style.backgroundColor =color;
	}
}