<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% request.getAttribute("javax.servlet.forward.request_uri"); %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>리뷰상세페이지</title>
<script src="${root}/resources/jquery/jquery-3.4.1.js"></script>
</head>
<body onload="reviewUpdate()">
	<p>
		<strong>${foodName}</strong>에 대한 솔직한 리뷰 입니다.
	</p>
	<div>
		평점: ${reviewDto.reviewScore} <br /><br />
		내용 : ${reviewDto.reviewCont} <br /><br />
		<div id="fileDiv">
			<c:if test="${listImage != null}">
				<table style="text-align:center;">
					<tr>
						<c:forEach var="imageDto" items="${listImage}">							
							<td><img src="${root}/resources/ftp/${imageDto.imageName}"
								alt="image" style="width: 100px; height: 100px;" onerror="this.src='${root}/resources/css/list.jpg'" /><br /><label>${fn:substringAfter(imageDto.imageName,'_')}</label>								
							</td>
						</c:forEach>
					</tr>
				</table>
			</c:if>			
		</div>
	</div>
</body>
</html>