function e(id) {
	return document.getElementById(id);
}

function es(name){
	return document.getElementsByTagName(name);
}

function ajaxGet(url,a,b,c) {
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if(xhr.readyState ==4 ){
			if( xhr.status == 200 ) {
				a(xhr.responseText);
			} else if ( xhr.status == 404 ) {
				if( b ){
					b();
				}
			} else if ( xhr.status == 500 ) {
				if ( c ) {
					c();
				}
			}
		}
	};
	xhr.open("GET",url,true);
	xhr.send(null);
}
