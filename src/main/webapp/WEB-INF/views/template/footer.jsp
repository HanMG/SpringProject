<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#footer {
	width: 1240px;
	height: 300px;
	background-color: #3E3E3E;
	margin: 0 auto;
}
#footer > div {
	float: left;
}
#footer > div:first-child {
	width: 400px;
	height: 300px;
}
#footer > div > img {
	width: 300px;
	height: 200px;
	margin: 50px;
	
}
#footer > div:last-child {
	width: 740px;
	height: 200px; 
	margin: 50px;
}
</style>
</head>
<body>
	<div id="footer">
		<div>
			<img alt="로고" src="${root}/resources/css/list.jpg">
		</div>
		<div>
			<p>
				㈜ 망고플레이트
				서울특별시 서초구 강남대로99길 53, 6층 (잠원동, 삼우빌딩) <br/>
				대표이사: OH JOON HWAN(오준환)	<br/>
				사업자 등록번호: 211-88-92374 [사업자정보확인]	<br/>
				통신판매업 신고번호: 2014-서울강남-02615	<br/>
				고객센터: 02-565-5988	<br/>
				© 2019 MangoPlate Co., Ltd. All rights reserved.	<br/>
			</p>
		</div>
	</div>
</body>
</html>