<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${check == 1}">
	<c:set var="adminId" value="${adminDto.adminId}" scope="session"/>
		<script type="text/javascript">
			alert("로그인 되었습니다.");
			location.href="${root}/admin/main.go";
		</script>
	</c:if>
	<c:if test="${check == 0}">
		<script type="text/javascript">
			alert("로그인 되지 않았습니다.");
			location.href = document.referrer;
		</script>
	</c:if>

</body>
</html>