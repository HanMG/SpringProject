<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>맛집 리스트</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}
a {
	text-decoration: none;
}
#content {
	margin : 10px auto;
	width: 1240px;
	overflow: hidden;
}
.title {
	width: 1240px;
	height: 50px;
	background: tomato;
	line-height: 50px;
	font-size: 30px;
	border-bottom: 1px dotted;
}
.tag {
	width: 1240px;
	height: 50px;
	background: tomato;
	line-height: 50px;
	border-bottom: 1px dotted;
	text-align: center;
}
.tag > button {
	width: 120px;
	height: 40px;
	margin: 0 10px;
}
.list {
	overflow: hidden;
	width: 900px; 
	margin: 30px 170px;
	background: tomato;
}
.page {
	width: 400px;
	height: 300px;
	margin: 25px;
	float: left;
}
.page > div {
	width: 400px;
	height: 300px;
	text-align: center;
	position: relative;
}
.page > div > span {
	display: block;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}
</style>
</head>
<body>
	<div id="content">
		<div class="title">
			<span>믿고 보는 맛집 리스트</span>
		</div>
		<div class="tag">
			<button><a href="#">#인기Top10</a></button>
			<button><a href="#">#애월</a></button>
			<button><a href="#">#성산</a></button>
			<button><a href="#">#함덕</a></button>
			<button><a href="#">#우도</a></button>
			<button><a href="#">#흑돼지</a></button>
			<button><a href="#">#고기국수</a></button>
		</div>
		<div class="list">
			<div class="page"></div>
		</div>
	</div>
</body>
<script type="text/javascript" src="${root}/resources/javascript/lib/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${root}/resources/xhr.js"></script>
<script type="text/javascript">
var tagType = "";
var tagValue = "";
var root = "${root}";

function updateList() {
	$.ajax({
		type : "POST",
		url : root + "/food/listAjax.go",
		data : { "tagType" : tagType, "tagValue" : tagValue},
		dataType : "json",
		success : function (data) {
			var cont = "";
			for (var i = 0; i < data.length; i++) {
				cont += "<div style='background-image: url(" + data[i].imagePath + ")'>";
				cont += "<span>"+data[i].foodName+"</span><span>"+data[i].foodMenu+"</span>";
				cont += "</div>";
			}
			$(".page").html(cont);
		},
		error: function (request, status, error) {
			var str = 'code: '+request.status+'\n';
			str += 'message: ' + request.responseText+'\n';
			str += 'error: ' + error;
			alert(str);
		}
	});
}

$(function() {
	updateList();
});

$('button').click(function() {
	tagValue = $(this).find('a').text().substring(1);
	if (tagValue == "애월" || tagValue == "성산" || tagValue == "함덕" || tagValue == "우도") {
		tagType = "addr";
	} else if (tagValue == "흑돼지" || tagValue == "고기국수") {
		tagType = "menu";
	} else {
		tagType = "read";
		tagValue = "refresh";
	}
	updateList();
});
</script>
</html>