//Fuente: http://lawrence.ecorp.net/inet/samples/regexp-format.php
/*
 * function return2br(dataStr) {
    return dataStr.replace(/(\r\n|[\r\n])/g, "<br>");
   }
 */
function return2br(dataStr) {
	var datatira = "";
	for (i=0; i<dataStr.length; i++) {
		if (dataStr.charAt(i)=='\n') {
			datatira=datatira+"&";
		}
		else {
		  datatira=datatira+dataStr.charAt(i);	 
	    }
	}
	return datatira;
}