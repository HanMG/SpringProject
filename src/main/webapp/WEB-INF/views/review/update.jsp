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
<title>리뷰수정</title>
<script src="${root}/resources/Jquery/jquery-3.4.1.js"></script>
<script>
	function reviewUpdate() {
		$("input:radio[name='reviewScore']:radio[value='${reviewDto.reviewScore}']").prop('checked', true);
	}
	function delImage(tdId,imgName) {
		alert(tdId+","+imgName);
		document.getElementById("deleteImg").value += imgName+",";
		document.getElementById(tdId).style.display = "none";
	}
</script>
</head>
<body onload="reviewUpdate()">
	<p>
		<strong>${foodName}</strong>에 대한 솔직한 리뷰를 써주세요.
	</p>
	<form action="${root}/review/updateOk.go" method="POST"	enctype="multipart/form-data">
		<input type="hidden" name="reviewCode" value="${reviewDto.reviewCode }" />
		<input type="hidden" name="foodCode" value="${reviewDto.foodCode}" /> 
		<input type="hidden" name="memberCode" value="${reviewDto.memberCode }" />
		 <label for="good">맛있어요</label>
		 <input	type="radio" id="good" name="reviewScore" value="5" />
		 <label	for="soso">괜찮아요</label>
		 <input type="radio" id="soso" name="reviewScore" value="3" /> 
		 <label for="bad">별로에요</label>
		 <input	type="radio" id="bad" name="reviewScore" value="1" />
		<textarea name="reviewCont" id="" cols="30" rows="10"
			style="width: 100%; height: 100px; resize: none;"
			placeholder="식당의 분위기, 서비스가 궁금해요!">${reviewDto.reviewCont}</textarea>
		<div id="fileDiv">
			<c:if test="${listImage != null}">
				<table>
					<tr>
						<c:forEach var="imageDto" items="${listImage}">			
							<c:set var="tdId" value="${fn:substringBefore(imageDto.imageName,'_')}"></c:set>				
							<c:set var="imgName" value="${fn:substringAfter(imageDto.imageName,'_')}"></c:set>
							<td id="${tdId}"><img src="${root}/resources/ftp/${imageDto.imageName}"
								alt="image" style="width: 100px; height: 100px;" /><br /><label>${imgName}</label><br />
								<input type="button" value="이미지삭제" onclick="delImage('${tdId}','${imageDto.imageName}')"/>
							</td>
						</c:forEach>						
					</tr>
				</table>
				<input type="hidden" name="deleteImg" id="deleteImg"/>
			</c:if>
			<input type="file" name="imgFile" multiple="multiple" accept="image/*" />
		</div>
		<input type="submit" value="수정" /> <input type="reset" value="취소" />
	</form>
</body>
</html>