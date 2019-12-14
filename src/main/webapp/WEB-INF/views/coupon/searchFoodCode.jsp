<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
	<head>
		<meta charset="UTF-8">
		<title>식당코드 검색</title>
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
		
		//식당코드 기입
		function sendFoodCode(foodCode, foodName, foodAddr){
			//var add = foodCode + " " + foodName + " " +foodAddr;
			
			//open.couponForm.foodCode.value= foodCode;
			//self.close();
		}
		</script>
	</head>
	<body>
		<form action="${root}/coupon/searchFoodCodeOk.go" method="get">
			<div>
				<input type="text" name="foodName">
				<input type="submit" value="검색">
			</div>
		</form>
		<ul>
			<c:if test="${foodCodeList.size() == 0}">
				<li>검색결과가 없습니다.</li>
			</c:if>
			<c:if test="${foodCodeList.size() > 0}">
				<p>${foodName}로 검색한 결과입니다. 해당 코드를 선택해주세요.</p>
				<c:forEach var="foodCodeList" items="${foodCodeList}">
				<li>
					<a href="javascript:sendFoodCode('${foodCodeList.foodCode}}','${foodCodeList.foodName}}','${foodCodeList.foodAddr}}')">
						${foodCodeList.foodCode},
						${foodCodeList.foodName},
						${foodCodeList.foodAddr}
					</a>
				</li>
				</c:forEach>
			</c:if>
			
		</ul>
		
	</body>
</html>