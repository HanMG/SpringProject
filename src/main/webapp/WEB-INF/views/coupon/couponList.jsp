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
#content {
	margin : 10px auto;
	overflow: hidden;
	max-width: 1000px;
	margin: 0 auto;
	margin-top: 40px;
}
.title {
	font-size: 30px;
}
#next {
	display: flex;
	flex-direction: row;
	flex-flow: row wrap;
	margin: 0 auto;
}

.list {
	width: 300px;
	height: 250px;
	cursor: pointer;
	box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 10px;
	margin-right: 10px;
	display: flex;
	flex-direction: column;
	margin-bottom: 10px;
}
.list > div:nth-child(1) {
	width: 300px;
	height: 200px;
	background-repeat: no-repeat;
	background-size: 100% 100%;
	position: relative;
}
.list > div:nth-child(1) > span {
	display: inline-block;
	position: absolute;
	bottom: 5px;
	right: 15px;
	font-size: 23px;
	font-weight: bold;
	color: white;
	margin-left: auto;
	
}
.list > div:nth-child(1) > span:nth-child(2) {
	bottom: 35px;
	font-size: 14px;
}
.list > div:nth-child(2) {
	font-size: 20px;
	color: #030305;
}
.list > div:nth-child(3) {
	font-size: 14px;
	color: #9b9b9b;
}
.list > div:nth-child(4) {
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
		                var foodCode = "${root}/coupon/couponRead.go?couponCode="+data[i].couponCode+"&&pageNumber=1";
		                var image = "${root}/resources/ftp/"+data[i].imageName;
		                console.log(image);
		                var list = "<div class='list' onclick="+"'location.href=\""+foodCode+"\"'>";
		                        list += "<div style="+"'background-image: url(\""+image+"\")';>";
		                            list += '<span>'+data[i].couponCostsale+'</span>';
		                            list += '<span style="text-decoration:line-through;">'+data[i].couponCostori+'</span>';
		                        list += '</div>';
		                        list += '<div>';
		                            list += '<span>'+data[i].couponName+'</span>';
		                        list += '</div>';
		                        list += '<div>';
		                        list += '<span>'+data[i].couponStartdate+ '~' +data[i].couponEnddate +'</span>';
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
		<!-- 검색 했을 경우 : 템플릿 들어갈 것-->
		<!-- <div>
			<input type="text" name="search">
		</div> -->
		<div>
			
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
		</div><!-- // #content -->
	</body>
</html>


