<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>기프티콘 리스트</title>
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
	line-height: 50px;
	font-size: 30px;
	margin-top: 40px;
}
.title > span {
	margin-left: 220px;
}
.eat {
	overflow: hidden;
	width: 800px; 
	margin: 30px 170px;
	
}
.list {
	width: 780px;
	height: 430px;
	float: left;
	margin: 10px;
}
.list > div:nth-child(1) {
	width: 650px;
	margin: 0 65px;
	height: 300px;
	background-repeat: no-repeat;
	background-size: 100% 100%;
	position: relative;
}
.list > div:nth-child(1) > span {
	float: right;
	display: inline-block;
	position: absolute;
	bottom: 5px;
	right: 15px;
	font-size: 23px;
	font-weight: bold;
	color: white;
	
}
.list > div:nth-child(1) > span:nth-child(2) {
	bottom: 35px;
	font-size: 14px;
}
.list > div:nth-child(2) {
	width: 650px;
	margin: 0 65px;
	font-size: 23px;
	color: #030305;
	margin-top: 10px;
}
.list > div:nth-child(3) {
	width: 650px;
	margin: 0 65px;
	font-size: 14px;
	color: #9b9b9b;
	margin-top: 10px;
}
.list > div:nth-child(4) {
	width: 650px;
	margin: 0 65px;
	margin-top: 10px;
}
.list > div:nth-child(4) > .button {
	width: 150px;
	height: 50px;
	font-size: 23px;
	float: right;
	text-align: center;
	line-height: 50px;
}
.list button {
	float: right;
	margin: 0 10px;
	width: 100px;
}
</style>
<script type="text/javascript" src="${root}/resources/javascript/lib/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${root}/resources/xhr.js"></script>
<!-- Ajax -->
<script type="text/javascript">
	var pageNumber = 1;
	
	$(function(){
		toServer(pageNumber);
	});
	
	$(window).scroll(function(){
		if($(window).scrollTop() >= $(document).height()-$(window).height()){
			pageNumber++;
			toServer(pageNumber);
		}
	})
	
	//pageNumber 던져주는 곳
	function toServer(pageNumber){
		var param = "pageNumber=" + pageNumber;
		console.log("param:" +param);
		sendRequest("GET","couponListAjax.go", fromServer, param);
	}
	
	//받기
	function fromServer(data){
		if(xhr.readyState == 4 && xhr.status == 200){
			var data = JSON.parse(xhr.responseText);
			console.log(data);
			console.log("length:"+ data.length);
			
			for(var i=0; i< data.length; i++){
				var list = '<div class="list"><div><span>'+data[i].couponName+'</span></div>';
				list += '<div><img alt="쿠폰 이미지" src="'+data[i].imageName+'"></div><div><span>${couponDto.couponName}</span></div>';
				list += '<div><span>사용가능기간: '+data[i].couponStartdate+'부터 '+data[i].couponEnddate+'까지</span></div>';
				list += '<div><span style="text-decoration:line-through;">원가격: '+data[i].couponCostori+'</span></div>';
				list += '<div><span>할인가격:'+data[i].couponCostsale+'</span><a href="${root}/coupon/couponRead.go?couponCode='+data[i].couponCode+'${couponDto.couponCode}&pageNumber='+pageNumber+'">구매하기</a></div>';
				$('#next').append(list);
			}
		}
	}
		
	function addNext(couponListNext){
		console.log(couponListNext);
		
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
		<!-- 검색 했을 경우 : 템플릿 들어갈 것-->
		<div>
			<input type="text" name="search">
		</div>
		<div>
			
		</div>
		<div class="eat">
			<c:if test="${count == 0}">
				<div>
					<p>판매중인 쿠폰이 없습니다</p>
				</div>
			</c:if>
			<c:if test="${count > 0}">
				<c:forEach var="couponDto" items="${couponList}" begin="0" step="1">
				<div id="inner" class="list" style="cursor:pointer;" onclick="location.href='${root}/food/read.go?foodCode=${couponDto.foodCode}'">
					<div style="background-image: url('${path}${couponDto.imageName}'), url('${root}/resources/css/list.jpg');">
						<%-- <img alt="쿠폰 이미지" src="${path}${couponDto.imageName}" onerror="this.src='${root}/resources/css/list.jpg'"> --%>
						<span>\ ${couponDto.couponCostsale}</span>
						<span style="text-decoration:line-through;">\ ${couponDto.couponCostori}</span>
					</div>
					<div>
						<span>${couponDto.couponName}</span>
					</div>
					<div>
						<span>${couponDto.couponStartdate} ~ ${couponDto.couponEnddate}</span>
					</div>
					<div>
						<p>판매중인 쿠폰이 없습니다</p>
					</div>
				</div>
				</c:forEach>
				</c:if>
				
				<c:if test="${count > 0}">
					<div id="next"></div>
				</c:if>
			</div>
		</div><!-- // #content -->
	</body>
</html>


