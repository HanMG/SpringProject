<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
	<head>
		<meta charset="UTF-8">
		<title>삭제 페이지</title>
		<script type="text/javascript" src="${root}/resources/jquery/jquery-3.4.1.js"></script>
		<script type="text/javascript">
		$(function(){
			$("#purchaseDelBtn_cus").on('click', function(){
				var purchaseCode = $('input[name=purchaseCode]').val();
				var delUrl = "${root}/purchase/purchaseDeleteOk.go?purchaseCode="+purchaseCode;
				$.ajax({
					url: delUrl,
					type: 'POST',
					dataType: 'json',
					success: function(data){
						var check = data.check;
						if(check == 1){
							opener.alert("구매취소 완료되었습니다.");
							opener.location.reload();
						} else {
							opener.alert("정상처리 실패; 관리자 문의 요망; 구매 취소 가능 여부 확인해주세요.")
						}
						self.close();
					}, error : function(request,status,error){
						console.log("실패");
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				})
			});
		})
	</script>
	</head>
	<body>
		<p><strong>구매번호: ${purchaseCode}<br>${couponName}</strong> 쿠폰 (을)를 <br>
			정말로 취소 요청하시겠습니까?</p>
		<form>
			<input type="hidden" name="purchaseCode" value="${purchaseCode}">
			<input id="purchaseDelBtn_cus" type="button"  value="상품 취소 신청">
		</form>
		<a href="javascript:self.close()">닫기</a>
		
	</body>
</html>