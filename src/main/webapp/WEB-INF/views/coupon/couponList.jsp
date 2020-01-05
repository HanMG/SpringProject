<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>기프티콘 리스트</title>
<style type="text/css">
#content {
	margin: 10px auto;
	overflow: hidden;
	max-width: 1000px;
	margin: 0 auto;
	margin-top: 40px;
}

.title {
	font-size: 30px;
	padding-bottom: 20px;
}

#next {
	display: flex;
	flex-direction: row;
	flex-flow: row wrap;
	margin: 0 auto;
}

.list {
	/* width: 300px;
	height: 250px; */
	width: 313px;
	cursor: pointer;
	box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 10px;
	margin-right: 10px;
	display: flex;
	flex-direction: column;
	margin-bottom: 50px;
	padding: 8px;
	padding-bottom: 12px;
}

.list:first-child, .list:nth-child(3n+1) {
	margin-left: 10px;
}

.list>div:nth-child(1) {
	position: relative;
}

.list>div:nth-child(1):after{
	content:"";
	background-color: rgba(0,0,0,0.08);
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
	left:0;
	right: 0;
	bottom: 0;
}
.list>div:nth-child(1):hover:after{
	background: transparent;
}
.list>div:nth-child(1) > img {
	width: 300px;
    height: 200px;
}

.list>div:nth-child(1)>span {
    position: absolute;
    font-size: 17px;
    font-weight: bold;
    color: white;
    background: #EFB730;
    padding: 3px 10px;
    left: 0px;
    z-index: 1;
    top: 0;
}

.list>div:nth-child(2) {
	padding-top: 8px;
	font-size: 20px;
	color: #030305;
}

.list>div:nth-child(3) > span:first-child {
	font-size: 18px;
	color: #EFB730;
}
.list>div:nth-child(3) > span:last-child {
	font-size: 13px;
	color: #9b9b9b;
}
.list>div:nth-child(4) {
	font-size: 12px;
	color: #9b9b9b;
}


.list>div:nth-child(3) {
	font-size: 14px;
}
.list>div:nth-child(3) > span:first-child {
	font-size: 18px;
	color: #EFB730;
}
.list>div:nth-child(3) > span:last-child {
	font-size: 13px;
	color: #9b9b9b;
}
.list>div:nth-child(4) {
	font-size: 12px;
	color: #9b9b9b;
}

.goTop {
	font-size: 22px;
	width: 50px;
	color: #EFB730;
	text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.2);
	text-align: center;
	position: fixed;
	bottom: 30px;
	right: 100px;
}

</style>
<script type="text/javascript" src="${root}/resources/jquery/jquery-3.4.1.js"></script>
<script type="text/javascript" src="${root}/resources/xhr.js"></script>
<!-- Ajax -->
<script type="text/javascript">
	var pageNumber = 1;

	$(function() {
		toServer(pageNumber);
	});
	$(window).scroll(
			function() {
				if ($(window).scrollTop() >= $(document).height()
						- $(window).height()) {
					pageNumber++;
					toServer(pageNumber);
				}
			})

	//pageNumber 던져주는 곳
	function toServer(pageNumber) {
		var param = "pageNumber=" + pageNumber;
		console.log("param:" + param);
		sendRequest("GET", "couponListAjax.go", fromServer, param);
	}

	//받기
	function fromServer(data) {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var data = JSON.parse(xhr.responseText);
			console.log(data);
			console.log("length:" + data.length);
			var root = "${root}";
			var err = root + "/resources/css/list.jpg";
			for (var i = 0; i < data.length; i++) {
				var foodCode = "${root}/coupon/couponRead.go?couponCode="
						+ data[i].couponCode + "&&pageNumber=1";
				var image = "${root}/resources/ftp/" + data[i].imageName;
				console.log(image);
				var list = "<div class='list' onclick="+"'location.href=\""+foodCode+"\"'>";
					list += "<div>";
						list += "<img alt='음식 이미지' src='"+image+"' onerror='this.src=\""+err+"\"'>";
						list += '<span>' + data[i].couponSalerate + ' %</span>';
					list += '</div>';
					list += '<div>';
						list += '<span>' + data[i].couponName + '</span>';
					list += '</div>';
					list += '<div>';
						list += '<span>' + data[i].couponCostsale + '</span> <span style="text-decoration:line-through;">'
						+ data[i].couponCostori + '</span>';
					list += '</div>';
					list += '<div>';
						list += '<span>' + data[i].couponStartdate + '~'
								+ data[i].couponEnddate + '</span>';
					list += '</div>';
				list += '</div>';
				$('#next').append(list);
			}
		}
	}
</script>
</head>
<body>
	<input type="hidden" name="pageNumber" value="${pageNumber}">
	<!-- 판매 중인 쿠폰 리스트 불러오기  -->
	<div id="content">
		<div class="title">
			<span>EAT 딜</span>
		</div>
		<div class="eat">
			<c:if test="${count == 0}">
				<div>
					<p>판매중인 쿠폰이 없습니다</p>
				</div>
			</c:if>
			<c:if test="${count > 0}">
				<div id="next"></div>
			</c:if>
		</div>
		<a href="#header" class="goTop">TOP</a>
	</div>
	<!-- // #content -->
</body>
</html>


