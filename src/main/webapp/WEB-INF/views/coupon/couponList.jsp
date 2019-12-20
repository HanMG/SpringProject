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
				background: tomato;
				line-height: 50px;
				font-size: 30px;
				border-bottom: 1px dotted;
			}
			.eat {
				overflow: hidden;
				width: 900px; 
				margin: 30px 170px;
				background: tomato;
			}
			.list {
				width: 430px;
				height: 430px;
				background: skyblue;
				float: left;
				margin: 10px;
			}
			.list img {
				width: 300px;
				height: 300px;
				margin-top: 10px;
			}
			.list > div {
				width: 300px;
				margin: 0 65px;
			}
			.list span {
				
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
		<!-- 
		<script type="text/javascript">
			var pageNumber = 1;
				
			$(function(){
				toServer(pageNumber);
			});
			$(window).scroll(function(){
				if($(window).scrollTop() >= $(document).height()-$(window).height()){
					toServer(pageNumber);
					pageNumber++;
					console.log(pageNumber);
					//$('.list').append()
				}
			})
			
			function toServer(pageNumber){
				var param = "pageNumber=" + pageNumber;
				sendRequest("GET","couponList.go", fromServer, param);
			}
			
			function fromServer(){
				if(xhr.readyState == 4 && xhr.status == 200){
					console.log("pageNumber: "+ pageNumber);
					//var list = getElementsByClassName("list");
					if(pageNumber > 1){
						document.getElementById("inner").innerHTML = xhr.responseText;						
					}
				}
			}
		</script> -->
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
				<h3>[검색어]로 검색한 결과입니다.</h3>
			</div>
			<div class="eat">
				<c:if test="${count == 0}">
					<div>
						<p>판매중인 쿠폰이 없습니다</p>
					</div>
				</c:if>
				<c:if test="${count > 0}">
					<c:forEach var="couponDto" items="${couponList}" begin="0" step="1">
					<div id="inner" class="list">
						<div>
							<img alt="쿠폰 이미지" src="${root}/resources/ftp/${couponDto.imageName}">
						</div>
						<div>
							<span>${couponDto.couponName}</span>
						</div>
						<div>
							<span>사용가능기간: ${couponDto.couponStartdate}부터 ${couponDto.couponEnddate} 까지</span>
						</div>
						<div>
							<span style="text-decoration:line-through;">원가격: ${couponDto.couponCostori}</span>
						</div>
						<div>
							<span>할인가격: ${couponDto.couponCostsale}</span>
							<a href="${root}/coupon/couponRead.go?couponCode=${couponDto.couponCode}&pageNumber=${pageNumber}">구매하기</a>
						</div>
					</div>
					</c:forEach>
				</c:if>
			</div>
		</div><!-- // #content -->
	</body>
</html>


