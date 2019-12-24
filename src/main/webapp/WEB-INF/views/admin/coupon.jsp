<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	width: 100vh;
	height: 50px;
	line-height: 50px;
}
#title > button {
	float: right;
	font-size: 23px;
	color: black;
	background: white;
	border: #CED4DA solid 1px;
	border-radius: 5px;
	
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
/* 쿠폰관련 */
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
	overflow: hidden;]
	
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

/* 쿠폰관련 */
.coupon {
	overflow: hidden;
	width: 500px; 
	border-bottom: 1px dotted;
	margin: 10px auto;
	background: tomato;
}
.coupon > div {
	margin-top: 5px;
	margin-left: 30px;
}
.coupon > div span:nth-child(1) {
	display: block;
	font-size: 20px;
	
}
.coupon > div > input[type=text] {
	display: inline-block;
	width: 400px;
	height: 20px;
	font-size: 20px;
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
.btn > .button {
	font-size: 23px;
	width: 120px;
	height: 50px;
}

.couponModal, .couponInModal {
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
			<span>쿠폰 관리</span>
			<button class="button" id="couponInClick">쿠폰등록</button>
		</div>
		<div id="list">
			<table id="example" class="display" style="width:100%">
				<thead>
					<tr>
						<th>쿠폰코드</th>
						<th>가게코드</th>
						<th>쿠폰명</th>
						<th>쿠폰내용</th>
						<th>유효기간</th>
					</tr>				
				</thead>
				<tbody>
					<tr id="couponClick">
						<th>couponCode</th>
						<th>foodCode</th>
						<th>couponName</th>
						<th>couponIntro</th>
						<th>couponStartdate ~ couponEnddate</th>
					</tr>
					<tr>
						<th>couponCode</th>
						<th>foodCode</th>
						<th>couponName</th>
						<th>couponIntro</th>
						<th>couponStartdate ~ couponEnddate</th>
					</tr>
				</tbody>
			</table>
		</div>	
	</div>
	
	
	<!-- 쿠폰 모달 -->
	<div id="couponModal" class="couponModal">
		<div id="content_modal">
			<div class="content_modal">
				<div class="title_modal">
					<span>쿠폰 관리</span>
					<span class="close">&times;</span>
				</div>
				<form action="#" method="post">
				<div class="coupon">
					<div>
						<span>쿠폰코드 : couponCode</span>
					</div>
					<div>
						<span>가게코드</span>
						<input type="text" name="foodCode">
						<input class="button" type="button" value="식당검색" onclick="">
					</div>
					<div>
						<span>쿠폰명</span>
						<input type="text" name="couponName" value=""/>
					</div>
					<div>
						<span>쿠폰내용</span>
						<textarea rows="3" cols="55" name="couponIntro"></textarea>
					</div>
					<div>
						<span>유효기간</span>
						<!-- 달력로 대체예정  -->
						<input type="text" name="couponStartdate" value="">
						<input type="text" name="couponEnddate" value="">
					</div>
					<div>
						<span>원가격</span>
						<input type="text" name="couponCostori" value="">
					</div>
					<div>
						<span>할인가</span>
						<input type="text" name="couponCostsale" value="">
					</div>
					<div>
						<span>할인율</span>
						<input type="text" name="couponSalerate" value="">
					</div>
					<div>
						<span>음식점소개</span>
						<textarea name="foodIntro" id="" cols="55" rows="3" placeholder="소개"></textarea>
					</div>
					<div>
						<span>쿠폰 이미지</span>
						<input type="file" name="imageFile" value="">
					</div>
					<div>
						<span>쿠폰상태</span>
						<input type="radio" name="couponStatus" value="y"><label>활성화</label>
						<input type="radio" name="couponStatus" value="n"><label>비활성화</label>
					</div>
					<div class="btn">
						<input class="button" type="submit" value="수정하기"></input>
						<input class="button" type="reset" value="초기화"></input>
						<button class="button">삭제하기</button>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 쿠폰 등록 모달 -->
	<div id="couponInModal" class="couponInModal">
		<div id="content_modal">
			<div class="content_modal">
				<div class="title_modal">
					<span>쿠폰 등록</span>
					<span class="close">&times;</span>
				</div>
				<form action="#" method="post">
				<div class="coupon">
					<div>
						<span>쿠폰코드</span>
						<input type="text" name="couponCode" value=""/>
					</div>
					<div>
						<span>가게코드</span>
						<input type="text" name="foodCode" value="">
						<input class="button" type="button" value="식당검색" onclick="">
					</div>
					<div>
						<span>쿠폰명</span>
						<input type="text" name="couponName" value=""/>
					</div>
					<div>
						<span>쿠폰내용</span>
						<textarea rows="3" cols="55" name="couponIntro"></textarea>
					</div>
					<div>
						<span>유효기간</span>
						<!-- 달력로 대체예정  -->
						<input type="text" name="couponStartdate" value="">
						<input type="text" name="couponEnddate" value="">
					</div>
					<div>
						<span>원가격</span>
						<input type="text" name="couponCostori" value="">
					</div>
					<div>
						<span>할인가</span>
						<input type="text" name="couponCostsale" value="">
					</div>
					<div>
						<span>할인율</span>
						<input type="text" name="couponSalerate" value="">
					</div>
					<div>
						<span>음식점소개</span>
						<textarea name="foodIntro" id="" cols="55" rows="3" placeholder="소개"></textarea>
					</div>
					<div>
						<span>쿠폰 이미지</span>
						<input type="file" name="imageFile" value="">
					</div>
					<div>
						<span>쿠폰상태</span>
						<input type="radio" name="couponStatus" value="y"><label>활성화</label>
						<input type="radio" name="couponStatus" value="n"><label>비활성화</label>
					</div>
					<div class="btn">
						<input class="button" type="submit" value="등록하기"></input>
						<input class="button" type="reset" value="초기화"></input>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
<script type="text/javascript">
/*  게시판  클릭시 작동 */
var couponModal = document.getElementById("couponModal");
var couponClick = document.getElementById("couponClick");
var span = document.getElementsByClassName("close")[0];
couponClick.onclick = function() {
	couponModal.style.display = "block";
	}
span.onclick = function() {
	couponModal.style.display = "none";
	}
/*  쿠폰 등록 클릭시 작동 */
var couponInModal = document.getElementById("couponInModal");
var couponInClick = document.getElementById("couponInClick");
var span = document.getElementsByClassName("close")[1];
couponInClick.onclick = function() {
	couponInModal.style.display = "block";
	}
span.onclick = function() {
	couponInModal.style.display = "none";
	}
</script>
	
</body>
</html>