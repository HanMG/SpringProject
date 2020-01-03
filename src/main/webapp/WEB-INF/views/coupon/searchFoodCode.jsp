<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
	<head>
		<meta charset="UTF-8">
		<title>음식점코드 검색</title>
		<script type="text/javascript" src="${root}/resources/javascript/coupon/coupon.js"></script>
		<script type="text/javascript">
		//유효성 체크
		function searchForm(obj){
			if(obj.foodName.value==""){
				alert("검색하실 음식점명을 입력해주세요.");
				obj.foodName.focus();
				return false;
			}
		}

		//음식점코드 리스트 출력
		/* function foodcodeRead (root){
			var url = root + "/coupon/searchFoodCode.go";
			open(url, "", "width= 800, height=500, scrollbars=yes");
		} */
		
		//음식점코드 기입
		function sendFoodCode(foodCode, foodName, foodAddr, cInsert){
			if(cInsert == 0){
				opener.couponFormInsert.foodCode.value= foodCode;
				opener.couponFormInsert.foodName.value= foodName;
			} else if(cInsert == 2){
				opener.couponForm.foodCode.value= foodCode;
				opener.couponForm.foodName.value= foodName;
			}
			self.close();
		} 
		</script>
	</head>
	<body>
		<form action="${root}/coupon/searchFoodCode.go" method="get" onsubmit="return searchForm(this)">
			<div>
				<input type="hidden" name="cInsert" value="${cInsert}">
				<input type="text" name="foodName">
				<input type="submit" value="검색">
			</div>
		</form>
		<ul>
			<c:if test="${foodCodeList.size() == 0}">
				<li><strong>${foodName}</strong>와(과) 관련된 검색결과가 없습니다.</li>
			</c:if>
			<c:if test="${foodCodeList.size() > 0}">
				<p><strong>▼ ${foodName}</strong>(으)로 검색한 결과입니다. 해당 코드를 선택해주세요.</p>
				
				<c:forEach var="searchFoodCodeDto" items="${foodCodeList}">
				<li>
					<a href="javascript:sendFoodCode('${searchFoodCodeDto.foodCode}','${searchFoodCodeDto.foodName}','${searchFoodCodeDto.foodAddr}','${cInsert}')">
						- ${searchFoodCodeDto.foodCode} / ${searchFoodCodeDto.foodName} / ${searchFoodCodeDto.foodAddr}
					</a>
				</li>
				</c:forEach>
			</c:if>
		</ul>
		<a href="javascript:self.close()">닫기</a>
	</body>
</html>