<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
	<head>
		<meta charset="UTF-8">
		<title>쿠폰 상품 등록</title>
		<script type="text/javascript" src="${root}/resources/javascript/coupon.js"></script>
		<script type="text/javascript">
		//유효성 체크
		function insertForm(obj){
			alert("insertForm Ok");
		}

		//식당코드 리스트 출력
		function foodcodeRead (root){
			var url = root + "/coupon/searchFoodCode.go";
			open(url, "", "width= 500, height=500, scrollbars=yes");
		}
		</script>
	</head>
	<body>
		<form action="${root}/coupon/couponInsertOk.go" method="post" enctype="multipart/form-data" 
		onsubmit="return insertForm(this)" name="couponForm">
				<%-- <input type="hidden" name="sequenceLevel" value="${sequenceLevel}" /> --%>
				<ul class="write_box">
					<li>
						<p>상품명(쿠폰명)</p>
						<p>
							<input type="text" name="couponName">
						</p>
					</li>
					<li>
						<p>식당명</p>
						<p>
							<input type="text" name="foodCode">
							<input type="button" value="식당검색" onclick="foodcodeRead('${root}')">
						</p>
					</li>
					<li>
						<p>유효 기간</p>
						<p>
							<input type="text" name="couponStartdate">
							<span>~</span>
							<input type="text" name="couponEnddate">
						</p>
					</li>
					<li>
						<p>상품 소개</p>
						<p>
							<textarea rows="10" cols="10" name="couponIntro"></textarea>
						</p>
					</li>
					<li>
						<p>상품 가격(할인 전 가격)</p>
						<p>
							<input type="text" name="couponCostori">
						</p>
					</li>
					<li>
						<p>할인율</p>
						<p>
							<input type="text" name="couponSalerate">
						</p>
					</li>
					<li>
					<li>
						<p>판매 가격(할인된 가격)</p>
						<p>
							<input type="text" name="couponCostsale">
						</p>
					</li>
					<li>
						<p>상품 대표 이미지</p>
						<p>
							<input type="file" name="file">
							<span></span>
						</p>
					</li>
					<li>
						<p class="col1">
							<input class="btn" type="submit" value="상품 등록" />
							<input class="btn" type="reset" value="다시 작성" />
							<input class="btn" type="button" value="이전 화면으로" onclick="location.href='${root}/coupon/couponList.do'" />
						</p>
					</li>
				</ul>
			</form>
	</body>
</html>