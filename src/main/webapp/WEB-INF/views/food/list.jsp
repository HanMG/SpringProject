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
.button {
    color: #FFFFFF;
    border: #EFB730 solid 2px;
    border-radius: 5px;
    background-color: transparent;
    font-size: 23px;
    box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 10px;
}
.button > a {
	color: #EFB730;
}
#content {
	margin : 10px auto;
	overflow: hidden;
	max-width : 1000px;
	margin-top: 40px;
}
.title {
	font-size: 30px;
}
.tag {
	text-align: center;
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	
}
.tag > button {
	width: 120px;
	height: 40px;
	margin: 0 10px;
}
.list {
	display: flex;
	flex-flow: row wrap;
	margin: 0 auto;
}

.list > div {
	width: 300px;
	margin: 10px 0;
	box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 10px;
	margin-right: 10px;
	flex-direction: column;
	flex: auto;
}
.list img {
	height: 300px;
    width: 300px;
}
.list strong, .page span {
	margin: 0 5px;
	color: #9b9b9b;
}
.list strong {
	font-size: 23px;
	color: #EFB730;
}
.list span {
	font-size: 14px;
}
/* 
.page > div > span {
	display: block;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
} */

.test {
	width: 430px;
	height: 300px;
	float: left;
	background: skyblue;
	margin: 10px;
}
.img {
	width: 430px;
	height: 250px;
}

</style>
</head>
<body>
	<div id="content">
		<div class="title">
			<span>믿고 보는 맛집 리스트</span>
		</div>
		<div class="tag">
			<button class="button"><a href="#">#TOP10</a></button>
			<button class="button"><a href="#">#애월</a></button>
			<button class="button"><a href="#">#성산</a></button>
			<button class="button"><a href="#">#함덕</a></button>
			<button class="button"><a href="#">#우도</a></button>
			<button class="button"><a href="#">#흑돼지</a></button>
			<button class="button"><a href="#">#고기국수</a></button>
		</div>
		<div class="list">
		</div>
		
	</div>
</body>
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
			var image = "${root}/resources/css/list.jpg";
			for (var i = 0; i < data.length; i++) {
				var foodCode = "${root}/food/read.go?foodCode="+data[i].foodCode;
				/* cont += "<div style='background-image: url(" + data[i].imagePath + ")'>";
				cont += "<span>"+data[i].foodName+"</span><span>"+data[i].foodMenu+"</span>";
				cont += "</div>"; */
				
				cont += "<div style='cursor: pointer;' onclick="+"'location.href=\""+foodCode+"\"'>";
					cont += "<div>";
						cont += '<img src='+image+'/>';
					cont += "</div>";
					cont += "<div>";
						cont += "<strong>"+data[i].foodName+"</strong>";
					cont += "</div>";
					cont += "<div>";
						cont += "<span>"+data[i].foodKind+"</span>";
					cont += "</div>";
					cont += "<div>";
						cont += "<span>"+data[i].foodMenu+"</span>";
					cont += "</div>";
					cont += "<div>";
						cont += "<span>"+data[i].foodAddr+"</span>";
					cont += "</div>";
					
/* 						cont += "<img src='"+${root}+"/resources/ftp/"+data[i].imageName+"' style='width: 400px; height: 400px;' />"; */
					
				cont += "</div>"
				
			}
			$(".list").html(cont);
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