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
	width: 1240px;
	overflow: hidden;
}
.title {
	width: 1240px;
	height: 50px;
	line-height: 50px;
	font-size: 30px;
	margin: 40px;
}
.title > span {
	margin-left: 50px;
}
.tag {
	width: 1240px;
	height: 50px;
	line-height: 50px;
	text-align: center;
}
.tag > button {
	width: 120px;
	height: 40px;
	margin: 0 10px;
}
.list {
	overflow: hidden;
	width: 1200px; 
	margin: 0 20px;
}
.page {
	width: 1150px;
	margin: 25px;
	overflow: hidden;
}
.page > div {
	width: 550px;
	height: 430px;
	float: left;
	margin: 10px;
	box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 10px;
}
.page img {
	height: 350px;
    width: 550px;
}
.page strong, .page span {
	margin: 0 5px;
	display: inline-block;
	color: #9b9b9b;
}
.page strong {
	width: 420px;
	font-size: 23px;
	color: #EFB730;
}
.page span {
	width: 100px;
	font-size: 14px;
	display: inline-block;
	float: right;
}

.page > div > div:last-child > span:first-child{
	width: 420px;
	float: none;
}
.page > div > div:last-child > span:last-child{
	width: 100px;
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
			<button class="button"><a href="#">#우도</a></button>
			<button class="button"><a href="#">#우도</a></button>
			<button class="button"><a href="#">#우도</a></button>
			<button class="button"><a href="#">#우도</a></button>
			<button class="button"><a href="#">#우도</a></button>
			<button class="button"><a href="#">#우도</a></button>
			<button class="button"><a href="#">#우도</a></button>
			<button class="button"><a href="#">#우도</a></button>
			<button class="button"><a href="#">#흑돼지</a></button>
			<button class="button"><a href="#">#고기국수</a></button>
		</div>
		<div class="list">
	<%-- 	<div class="test" style="width: 430px; height: 300px; float: left; background: skyblue; margin: 10px">
			<div>
				<img class="img" alt="" src="" onerror="this.src='${root}/resources/css/list.jpg'">
			</div>
			<div>
				<div>
					<strong>가게명</strong>
					<span>종류</span>
					<span>대표메뉴</span>
				</div>
				<div>
					<span>주소</span>
				</div>
			</div>
		</div> --%>
			<div class="page"></div>
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
						cont += "<strong>"+data[i].foodName+"</strong> <span>"+data[i].foodKind+"</span>";
					cont += "</div>";
					cont += "<div>";
						cont += "<span>"+data[i].foodAddr+"</span> <span>"+data[i].foodMenu+"</span>";
					cont += "</div>";
					
/* 						cont += "<img src='"+${root}+"/resources/ftp/"+data[i].imageName+"' style='width: 400px; height: 400px;' />"; */
					
				cont += "</div>"
				
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