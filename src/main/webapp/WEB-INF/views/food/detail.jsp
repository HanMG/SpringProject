<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="UTF-8">
<title>음식점상세페이지</title>
<style>
.fa {
  font-size: 25px;
  cursor: pointer;
  user-select: none;
}

.fa:hover {
  color: darkblue;
}
</style>
</head>
<body>	
	<i onclick="favorite(this)" class="fa fa-heart-o"></i>

	<script>
		function favorite(x) {
			if(x.className === "fa fa-heart-o"){
				x.className = "fa fa-heart";				
			}else{
				x.className = "fa fa-heart-o";
			}			
		}
	</script>
</body>
</html>