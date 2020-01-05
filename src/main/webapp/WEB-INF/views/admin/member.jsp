<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    border: #343A40 solid 1px;
    background-color: #343A40;
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
	margin-left: -300px;
	margin-top: -300px;
	background: #F2F4EF;
	width: 600px;
	border-radius: 5px;
	overflow: hidden;
}
.content_modal {
	width: 600px;
	overflow: hidden;
}
.title_modal {
	width: 600px;
	height: 50px;
	line-height: 50px;
	font-size: 30px;
	font-weight: bold;
	text-align: center;
}

/* 회원관련 */
.member {
	overflow: hidden;
	width: 500px; 
	margin: 10px auto;
}
.member > div {
	margin-top: 10px;
}
.member > div span:nth-child(1) {
	font-size: 23px;
	display: inline-block;
	width: 120px;
	line-height: 50px;
}
.member > div > input[type=text] {
	display: inline-block;
	width: 375px;
	height: 50px;
	font-size: 23px;
}
.member > div > .button {
	width: 230px;
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
.span {
	font-size: 23px;
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
	                     <th><fmt:formatDate value="${memberList.memberDate}" pattern="YYYY년 MM월 dd일 HH:mm" /></th>
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
					<div>
						<span>멤버코드</span>
						<span class="span" id="memberCode"></span>
						<input type="hidden" value="" name="memberCode" id="memberHidden">
					</div>
					<div>
						<span>이름</span>
						<input type="text" id="memberName" name="memberName" value="">
					</div>
					<div>
						<span>이메일</span>
						<input type="hidden" value="" name="memberMail" class="memberMail"/>
						<input type="text" class="memberMail" name="mail" value="" disabled="disabled"/>
					</div>
					<div>
						<span>휴대폰</span>
						<input type="text" id="memberPhone" name="memberPhone" value="">
					</div>
					<div>
						<span>가입일</span>
						<span class="span" id="memberDate"></span>
					</div>
					<div>
						<span>회원상태</span>
						<input type="radio" name="memberStatus" value="Y"><label class="span">활성화</label>
						<input type="radio" name="memberStatus" value="N"><label class="span">비활성화</label>
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
			$("#memberCode").text(data.memberCode);
			$("#memberDate").text(data.memberDate);
			$("#memberHidden").val(data.memberCode);
			$("#memberName").val(data.memberName);
			$(".memberMail").val(data.memberMail);
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




