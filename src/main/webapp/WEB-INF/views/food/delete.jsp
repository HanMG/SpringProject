<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>음식점정보삭제</title>
</head>
<body>
	<c:if test="${check > 0 }">
		<script>			
			location.href="${root}/admin/food.go";
			alert("삭제되었습니다.");
		</script>
	</c:if>
	<c:if test="${check == 0 }">
		<script>			
			location.href="${root}/admin/food.go";
			alert("ERROR ! 삭제되지않았습니다.");
		</script>
	</c:if>
</body>
</html>