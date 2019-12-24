<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
}
.button {
    color: #FFFFFF;
    border: #EFB730 solid 1px;
    background-color: #EFB730;
}
#title {
	width: 100vh;
	height: 50px;
	line-height: 50px;
}
#title > span {
	margin-left: 60px;
	font-size: 23px;
}
#content {
	width: 100vh;
	overflow: hidden;
	margin: 0 auto;
}
#list {
	width: 100vh;
	margin: 0 auto;
}
/* 멤버 모달 */
#content_modal {
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -400px;
	margin-top: -450px;
	background: #F2F4EF;
	width: 800px;
	border-radius: 5px;
	background: tomato;
	overflow: hidden;
}
.content_modal {
	width: 800px;
	overflow: hidden;
	background: skyblue;
}
.title_modal {
	width: 800px;
	height: 50px;
	line-height: 50px;
	font-size: 30px;
	border-bottom: 1px dotted;
	font-weight: bold;
	background: olive;
}
.title_modal > span:first-child {
	margin-left: 40px;
}

/* 내역관련 */
.purchase {
	overflow: hidden;
	width: 500px; 
	border-bottom: 1px dotted;
	margin: 10px auto;
	background: tomato;
}
.purchase > div {
	margin-top: 10px;
	margin-left: 30px;
}
.purchase > div span:nth-child(1) {
	display: block;
	font-size: 20px;
	
}
.purchase > div > input[type=text] {
	display: inline-block;
	width: 400px;
	height: 20px;
	font-size: 20px;
}
.purchase > div > .button {
	width: 120px;
	height: 50px;
}
.btn > .button {
	font-size: 23px;
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
  margin-right: 15px;
}
.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}


.purchaseModal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

</style>
<script type="text/javascript">
	function purchaseDelete(root, couponCode, couponName, pageNumber){
		var url = root + "/purchase/purchaseDelete.go?couponCode="+couponCode+"&couponName="+couponName+"&pageNumber="+pageNumber;
		open(url, "", "width= 500, height=300, scrollbars=yes");
	} 
</script>
</head>
<body>
	<div id="content">
		<div id="title">
			<span>구매관리</span>
		</div>
		<div id="list">
			<table id="example" class="display" style="width:100%">
				<thead>
					<tr>
						<th>구매코드</th>
						<th>쿠폰코드</th>
						<th>멤버코드</th>
						<th>구매날짜</th>
						<th>구매가격</th>
						<th>휴대폰</th>
						<!-- <th>쿠폰상태</th> -->
					</tr>				
				</thead>
				<tbody>
				<c:if test="${count > 0}">
				<c:forEach var="purchaseDto" items="${purchaseList}" begin="0">
					<tr id="purchaseClick ${purchaseDto.purchaseCode}">
						<th>${purchaseDto.purchaseCode}</th>
						<th>${purchaseDto.couponCode}</th>
						<th>${purchaseDto.memberCode}</th>
						<th><fmt:formatDate value="${purchaseDto.purchaseDate}" pattern="YYYY년 MM월 dd일 HH:mm" /></th>
						<th>${purchaseDto.couponCostsale}원</th>
						<th>${purchaseDto.purchasePhone}</th>
					</tr>
				</c:forEach>
				</c:if>
				</tbody>
			</table>
		</div>	
	</div>
	
	
	<!-- 구매 모달 -->
	
	<div id="purchaseModal" class="purchaseModal">
		<div id="content_modal">
			<div class="content_modal">
				<div class="title_modal">
					<span>구매 관리</span>
					<span class="close _close">&times;</span>
				</div>
				<form action="${root}/purchase/purchaseDeleteOk.go" method="post" name="deleteForm">
				<div class="purchase">
					<div>
						<span class="pCode">구매코드 : purchaseCode</span>
						<input type="hidden" value="${purchaseCode}" name="purchaseCode"/>
					</div>
					<div>
						<span class="cCode">쿠폰코드 : couponCode</span>
						<input type="hidden" value="${couponCode}" name="couponCode"/>
					</div>
					<div>
						<span class="mCode">멤버코드 : memberCode</span>
						<input type="hidden" value="${memberCode}" name="memberCode"/>
					</div>
					<div>
						<span class="pDate">구매날짜 : ${purchaseDate}</span>
					</div>
					<div>
						<span class="pDate">구매가격 : ${couponCostsale}</span>
					</div>
					<div>
						<span class="pPhone">휴대폰 : ${purchasePhone}</span>
					</div>
					<!-- <div>
						<span>쿠폰상태</span>
						<input type="radio" name="purchaseStatus" value="y"><label>활성화</label>
						<input type="radio" name="purchaseStatus" value="n"><label>비활성화</label>
					</div> -->
					<div class="btn">
						<input class="button" type="submit" value="삭제하기">
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		/*  게시판  클릭시 작동 */
		$(function(){
			$('#list tbody tr').on('click', function(){
				$('.purchaseModal').show();
			});
			$('._close').click(function(){
				$('.purchaseModal').hide();
			});	
		})
		
	</script>
	
</body>
</html>