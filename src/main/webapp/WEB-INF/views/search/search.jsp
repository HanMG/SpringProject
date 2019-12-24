<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-autocomplete/1.0.7/jquery.auto-complete.css"> -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}
a {
	text-decoration: none;
}
/* html, body {
	width : 100vh;
	height: 100vh;
	background-image: url("main_2.jpg");
	min-height: 100%;
} */
html { 
	background: url(main_2.jpg) no-repeat center center fixed; 
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}
#search {
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -50px;
	margin-top: -25px;
}
#menu {
	float: right;
}
#menu > a {
	display : inline-block;
	margin: 30px;
}
</style>
</head>
<body>
	<div id="search">
		<input type="text" id="searchInput" name="searchInput" placeholder="검색어를 입력하여 주세요" />
		<input type="button" id="searchButton" value="검색">
	</div>
	
</body>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-autocomplete/1.0.7/jquery.auto-complete.min.js"></script> -->
<script type="text/javascript">

var url = null;

function search() {
	var param = $("#searchInput").val()
	url = "${root}/searchKeyword.go?keyword=" + param;
	location.href = url;
}

$("#searchInput").keypress(function(event) {
	if (event.which == 13) {
		search();
	}
})

$("#searchButton").click(function() {
	search();
})

$(document).ready(function() {
	$("#searchInput").on("change", function() {
		// 1.
		getKeywordList($("#testInput").val());
		
		$('#testInput').autocomplete({
// 		    source: countries,
		    
		});
		
		// 2.
		/* $('#testInput').autocomplete({
		    source: function() {
				$.ajax~~~
			},
		    
		}); */
	});
	
	
});

function getKeywordList(val) {
	/* $.ajax(function() {
		data : {"keyword" : val}
	}).success(data){
		
		
		for (var i = 0; i < data.resyltList.length; i++) {
			countries[i] = data.resyltList.foodName;
		}
	} */
	
	/* $.ajax({
		url:"/searchKeyword.do",
		type:"GET",
		data : {"keyword" : $("#testInput").val()},
		dataType:"json",
		success:function(data) {debugger;
			
			for (var i = 0; i < data.resyltList.length; i++) {
				countries[i] = data.resyltList.foodName;
			}
		}
	}) */
	
}
</script>
</html>