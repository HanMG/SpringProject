<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
	<head>
		<meta charset="UTF-8">
		<title>삭제 재확인</title>
		<script type="text/javascript" src="${root}/resources/Jquery/jquery-3.4.1.js"></script>
		<script type="text/javascript">
			$(function(){
				$('._deleteCheckBtn').on('click',function(){
					var couponCode = $('input[name=couponCode]').val();
					var url = "${root}/coupon/couponDeleteOk.go?couponCode="+couponCode;
					$.ajax({
						url: url,
						type: 'POST',
						dataType: 'json',
						success: function(data){
							var check = data.check;
							if(check == 1){
								opener.alert("쿠폰이 삭제되었습니다.");
							} else {
								opener.alert("쿠폰 삭제가 정상처리되지 않았습니다.")
							}
							self.close();
						}, error : function(request,status,error){
							console.log("실패");
					        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
				});				
			})
		</script>
	</head>
	<body>
		<p><strong>${couponCode} ${couponName}</strong> 쿠폰 상품 (을)를 <br>
			정말로 삭제하시겠습니까?</p>
		<form>
			<input type="hidden" name="couponCode" value="${couponCode}">
			<input type="hidden" name="pageNumber" value="${pageNumber}">
			<input class="_deleteCheckBtn" type="button" value="삭제">
			<a href="javascript:self.close()">취소</a>
		</form>
		<a href="javascript:self.close()">닫기</a>
	</body>
</html>