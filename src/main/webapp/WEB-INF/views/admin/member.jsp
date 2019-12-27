<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>      
<!DOCTYPE html>
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
	width: 100%;
	height: 50px;
	line-height: 50px;
}
#title > span {
	margin-left: 60px;
	font-size: 23px;
}
#content {
	width: 100%;
	overflow: hidden;
	margin: 0 auto;
}
#list {
	width: 100%;
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

/* 회원관련 */
.member {
	overflow: hidden;
	width: 500px; 
	border-bottom: 1px dotted;
	margin: 10px auto;
	background: tomato;
}
.member > div {
	margin-top: 10px;
	margin-left: 30px;
}
.member > div span:nth-child(1) {
	display: block;
	font-size: 20px;
	
}
.member > div > input[type=text] {
	display: inline-block;
	width: 400px;
	height: 20px;
	font-size: 20px;
}
.member > div > .button {
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


.memberModal {
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

</head>
<body>
	<div id="content">
		<div id="title">
			<span>회원관리</span>
		</div>
		<div id="list">
			<table id="example" class="display" style="width:100%">
				<thead>
					<tr>
						<th>멤버코드</th>
						<th>이메일</th>
						<th>닉네임</th>
						<th>가입일</th>
						<th>휴대폰번호</th>
						<th>회원상태</th>
					</tr>				
				</thead>
					<tbody>
					<c:forEach var="memberList" items="${memberList}">
						<tr class="memberClick" onclick="getMember('${memberList.memberCode}')">
							<th>${memberList.memberCode}</th>
							<th>${memberList.memberMail}</th>
							<th>${memberList.memberName}</th>
							<th>${memberList.memberDate}</th>
							<th>${memberList.memberPhone}</th>
							<th>${memberList.memberStatus}</th>
						</tr>
					</c:forEach>
				<tbody>
					<c:forEach var="memberList" items="${memberList}">
	                  <tr class="memberClick" onclick="getMember('${memberList.memberCode}')">
	                     <th>${memberList.memberCode}</th>
	                     <th>${memberList.memberMail}</th>
	                     <th>${memberList.memberName}</th>
	                     <th>${memberList.memberDate}</th>
	                     <th>${memberList.memberPhone}</th>
	                     <th>${memberList.memberStatus}</th>
	                  </tr>
               		</c:forEach>
				</tbody>
			</table>
		</div>	
	</div>
	
	
	<!-- 멤버 모달 -->
	<div id="memberModal" class="memberModal">
		<div id="content_modal">
			<div class="content_modal">
				<div class="title_modal">
					<span>회원 관리</span>
					<span class="close">&times;</span>
				</div>
				<form action="${root}/admin/adminUpdateOk.go" method="post">
				<div class="member">
					<input type="hidden" id="memberCode" value="${memberDto.memberCode}" name="memberCode"/>	
					<div>
						<span id="memberCode">멤버코드 : ${memberDto.memberCode}</span>
					</div>
					<div>
						<span>이름</span>
						<input type="text" id="memberName" name="memberName" value="">
					</div>
					<div>
						<span>이메일</span>
						<input type="hidden" value="" name="memberMail"/>
						<input type="text" id="memberMail" name="mail" value="" disabled="disabled"/>
					</div>
					<div>
						<span>휴대폰</span>
						<input type="text" id="memberPhone" name="memberPhone" value="">
					</div>
					<div>
						<span id="memberDate">가입일 : ${memberDto.memberDate}</span>
					</div>
					<div>
						<span>회원상태</span>
						<input type="radio" name="memberStatus" value="y"><label>활성화</label>
						<input type="radio" name="memberStatus" value="n"><label>비활성화</label>
					</div>
					<div class="btn">
						<input class="button" type="submit" value="수정하기"></input>
						<input class="button" type="reset" value="초기화"></input>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
<script type="text/javascript">
/*  게시판  클릭시 작동 */

$(".memberClick").click(function(){
   $("#memberModal").css("display","block");
});

var memberModal = document.getElementById("memberModal");
var span = document.getElementsByClassName("close")[0];
span.onclick = function() {
	memberModal.style.display = "none";
	}
	
function getMember(memberCode){
	var url = "${root}/admin/getMember.go?memberCode=" + memberCode;
	$.ajax({
		url : url,
		type : "GET",
		dataType : "json",
		success : function(data){
			console.log(data);
			$("#memberCode").text("멤버코드 : " + data.memberCode);
			$("#memberDate").text("가입일 : " + data.memberDate);
			$("#memberCode").val(data.memberCode);
			$("#memberName").val(data.memberName);
			$("#memberMail").val(data.memberMail);
			$("#memberPhone").val(data.memberPhone);
			$("input:radio[name='memberStatus']:input[value="+data.memberStatus+"]").attr("checked", true);
		},
		error:function(request,status,error){
			console.log("code = " + request.status + "message = " + request.responseText + "error = " + error);
		}
	});
}
	
</script>
	
</body>
</html>




