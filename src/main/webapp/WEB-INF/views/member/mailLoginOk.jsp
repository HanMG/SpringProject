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
		<c:set var="memberCode" value="${memberDto.memberCode}" scope="session"/>
		<script type="text/javascript">
			alert("로그인 되었습니다.");
			location.href = document.referrer;
			//history.go(-2);
			/* 뒤로가기 하면서 새로고침이 되었으나 웹브라우저에서 뒤로가기 버튼을 누르면 로그인이 되었습니다. 
			알림창이 떠서 수정해야한다. */
		</script>
	</c:if>
	<c:if test="${check == 0}">
		<script type="text/javascript">
			alert("로그인 되지 않았습니다.");
			location.href="${root}/index.jsp";
		</script>
	</c:if>

</body>
</html>