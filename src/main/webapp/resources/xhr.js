/**
 * xhr.js
 */

function createXHR(){
	if(window.XMLHttpRequest){
		return new XMLHttpRequest();
	} else {
		return new ActiveXObject("Microsoft.XMLHTTP");
	}
}

var xhr = null;

function sendRequest(method, url, callback, param){
	
	var httpMethod = method.toUpperCase();
	if(httpMethod != "GET" && httpMethod != "POST"){
		httpMethod = "GET";		//에러방지
	}
	
	var httpParam = (param == null || param == "") ? null : param;
	
	var httpUrl = url;
	
	if(httpMethod == "GET" && httpParam != null){
		httpUrl += "?" + httpParam;
	}
	
	xhr = createXHR();
	xhr.open(httpMethod, httpUrl, true);
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send(httpMethod == "POST" ? httpParam : null);
	xhr.onreadystatechange = callback;	//콜백함수 처리
}