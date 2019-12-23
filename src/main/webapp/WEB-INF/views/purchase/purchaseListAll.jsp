<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<meta charset="UTF-8">
<title>구매내역</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
}

#content {
	margin: 10px auto;
	width: 1240px;
	overflow: hidden;
}

.history {
	width: 800px;
	overflow: hidden;
	margin: 220px;
	background: olive;
}

.title {
	width: 800px;
	height: 50px;
	background: tomato;
	line-height: 50px;
	font-size: 30px;
	border-bottom: 1px dotted;
}

.eat {
	width: 800px;
	overflow: hidden;
	background: skyblue;
}

.info_1 {
	width: 170px;
	height: 170px;
	float: left;
}

.info_1>img {
	width: 150px;
	height: 150px;
	margin: 10px;
}

.info_2 {
	width: 630px;
	min-height: 170px; /* modify */
	float: left;
}

.info_2 span {
	margin: 10px;
	display: inline-block;
}

.info_2 button {
	float: right;
	margin-right: 20px;
	width: 50px;
	height: 30px;
}
</style>
<script type="text/javascript">
	function purchaseDelete(root, couponCode, couponName, pageNumber){
		var url = root + "/purchase/purchaseDelete.go?couponCode="+couponCode+"&couponName="+couponName+"&pageNumber="+pageNumber;
		open(url, "", "width= 500, height=300, scrollbars=yes");
	} 
	

</script>
</head>
<body>
	<div id="content">
		<div class="history">
			<div class="title">
				<span>구매된 EAT딜</span>
			</div>
			<c:if test="${count == 0 || purchaseList.size() == 0}">
				<p>EAT딜이 없습니다.</p>
			</c:if>
			
			<c:if test="${count > 0}">
				<c:forEach var="purchaseDto" items="${purchaseList}" begin="0"
					step="1">
					<div class="eat">
						<div class="info_1">
							<img alt="쿠폰이미지" src="list.jpg">
						</div>
						<div class="info_2">
							<div>
								<span>쿠폰명: ${purchaseDto.couponName}</span>
							</div>
							<div>
								<span>쿠폰유효기간</span>
								<fmt:formatDate value="${purchaseDto.purchaseDate}"
									pattern="YYYY년 MM월 dd일" />
								부터
								<fmt:formatDate value="${purchaseDto.purchaseDate}"
									pattern="YYYY년 MM월 dd일" />
								까지
							</div>
							<div>
								<span>가격: ${purchaseDto.couponCostori}원</span>
							</div>
							<div>
								<span>쿠폰구매일</span>
								<fmt:formatDate value="${purchaseDto.purchaseDate}"
									pattern="YYYY년 MM월 dd일 HH:mm" />
							</div>
							<div>
								<span>할인가: ${purchaseDto.couponCostsale}원</span>
								<a href="javascript:purchaseDelete('${root}','${purchaseDto.couponCode}','${purchaseDto.couponName}','${pageNumber}')">취소</a>
							</div>
							<div>
								<span id="selPhone">입력받은 번호: ${purchaseDto.purchasePhone}</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
			<!-- 페이지네이트 -->
			<c:if test="${count > 0}">
				<div>
					<fmt:parseNumber var="pageCount" integerOnly="true" value="${count/boardSize + (count % boardSize == 0 ? 0 : 1)}" />
					<c:set var="pageBlock" value="${10}" />
					<fmt:parseNumber var="result" value="${(currentPage - 1)/pageBlock}" integerOnly="true" />
					<c:set var="startPage" value="${result*pageBlock+1}" />
					<c:set var="endPage" value="${startPage + pageBlock - 1}" />
					<c:if test="${endPage > pageCount}">
						<c:set var="endPage" value="${pageCount}" />
					</c:if>
	
					<%-- 이전 --%>
					<c:if test="${startPage > pageBlock}">
						<a href="${root}/purchase/purchaseList.go?pageNumber=${startPage - pageBlock}">[이전]</a>
					</c:if>
	
					<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
						<a href="${root}/purchase/purchaseList.go?pageNumber=${i}">[${i}]</a>
					</c:forEach>
	
					<%-- 다음 --%>
					<c:if test="${endPage < pageCount}">
						<a href="${root}/purchase/purchaseList.go?pageNumber=${startPage + pageBlock}">[다음]</a>
					</c:if>
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>