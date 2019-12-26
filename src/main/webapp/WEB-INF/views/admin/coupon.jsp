<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

#title>button {
	float: right;
	font-size: 23px;
	color: black;
	background: white;
	border: #CED4DA solid 1px;
	border-radius: 5px;
}

#title>span {
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
	overflow: hidden;
	]
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

.title_modal>span:first-child {
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

.coupon>div {
	margin-top: 5px;
	margin-left: 30px;
}

.coupon>div span:nth-child(1) {
	display: block;
	font-size: 20px;
}

.coupon>div>input[type=text] {
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

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.btn>.button {
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
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
</style>
<script type="text/javascript" src="${root}/resources/javascript/coupon/coupon.js"></script>
<script type="text/javascript" src="${root}/resources/Jquery/jquery-3.4.1.js"></script>
<script type="text/javascript" src="${root}/resources/Jquery/ui/jquery-ui.js"></script>
<script type="text/javascript">
			//유효성 체크
			function insertForm(obj){
				if(obj.couponName.value==""){
					alert("등록하실 쿠폰상품명을 입력해주세요.");
					obj.couponName.focus();
					return false;
				}
				if(obj.foodCode.value==""){
					alert("등록하실 식당명을 입력해주세요.");
					obj.foodCode.focus();
					return false;
				}
				if(obj.couponStartdate.value==""){
					alert("쿠폰의 유효기간 시작일을 입력해주세요.");
					obj.couponStartdate.focus();
					return false;
				}
				if(obj.couponEnddate.value==""){
					alert("쿠폰의 유효기간 마감일을 입력해주세요.");
					obj.couponEnddate.focus();
					return false;
				}
				if(obj.couponCostori.value==""){
					alert("판매금액을 입력해주세요.");
					obj.couponCostori.focus();
					return false;
				}
				if(obj.couponSalerate.value==""){
					alert("할인율을 입력해주세요");
					obj.couponSalerate.focus();
					return false;
				}
				if(obj.couponSalerate.value < 0 || obj.couponSalerate.value > 100){
					alert("0부터 100으로 입력해주세요.");
					obj.couponSalerate.focus();
					return false;
				}
				
				if(obj.formSort.value == "in"){
					if(obj.imageFile.value==""){
						alert("이미지를 첨부해주세요.");
						obj.imageFile.focus();
						return false;
					}
				}
			}
	
			//식당코드 리스트 출력
			function foodcodeRead(root, cInsert){
				console.log(cInsert);
				if(cInsert == null){
					cInsert = 2;
					console.log("cInsert: "+ cInsert);
				}
				if(cInsert == 0){
					console.log("cInsert: " +cInsert);
				}
				cInsert = cInsert;
				var url = root + "/coupon/searchFoodCode.go?cInsert="+cInsert;
				open(url, "", "width= 500, height=500, scrollbars=yes");
			}
			
			//데이터 피커
			$(function(){
				/* $('#datepickStart', '#datepickEnd').datetimepicker({
					dateFormat: 'yy-mm-dd',
					showOn: 'both',
					prevText: '이전',
				    nextText: '다음',
					monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			    	dayNames: ['일','월','화','수','목','금','토'],
				    dayNamesShort: ['일','월','화','수','목','금','토'],
				    dayNamesMin: ['일','월','화','수','목','금','토'],
				    showMonthAfterYear: true,
				    showButtonPanel:true,
				    changeMonth: true,
				    changeYear: true,
				    yearSuffix: '년'
				}); */
				$('#datepickStart').datepicker();
				$('#datepickEnd').datepicker();
				//$('#datepickStart').datepicker('setDate', 'today');
				//$('#datepickEnd').datepicker('setDate','+1D');
				
				
			})
		</script>
</head>
<body>
	<c:set var="cInsert" value="0" />
	<div id="content">
		<div id="title">
			<span>쿠폰 관리</span>
			<button class="button _open" id="couponInClick">쿠폰등록</button>
		</div>
		<div id="list">
			<input type="hidden" name="pageNumber" value="${pageNumber}">
			<table id="example" class="display" style="width: 100%">
				<thead>
					<tr>
						<th>쿠폰코드</th>
						<th>가게코드</th>
						<th>쿠폰명</th>
						<th>유효기간</th>
						<th>할인가</th>
						<th>가격</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="couponDto" items="${couponList}" begin="0"
						step="1">
						<tr>
							<th id="sendCouponCode">${couponDto.couponCode}</th>
							<th>${couponDto.foodCode}</th>
							<th>${couponDto.couponName}</th>
							<th>${couponDto.couponStartdate}~
								${couponDto.couponEnddate}</th>
							<th>${couponDto.couponSalerate}</th>
							<th>${couponDto.couponCostsale}</th>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

<script type="text/javascript">
	$(function(){
		$('#list tbody tr').on('click', function(){
			var couponId = $(this).children('#sendCouponCode').text();
			//var cId = $(this).attr("id");
			var sendData = "couponCode="+couponId+"&pageNumber="+${pageNumber};
			var dataUrl = "${root}/coupon/couponUpdate.go?"+sendData;
			$.ajax({
				url: dataUrl,
				type: 'GET',
				dataType:'json',
				success: function(data){
					//var obj = JSON.parse(data);
					$('#couponModal input[name=couponCode]').val(data.couponCode);
					$('#couponModal input[name=couponName]').val(data.couponName);
					$('#couponModal input[name=foodCode]').val(data.foodCode);
					$('#couponModal input[name=foodName]').val(data.foodName);
					$('#couponModal #imageName').text(data.imageName);
					$('#couponModal input[name=couponEnddate]').val(data.couponEnddate);
					$('#couponModal input[name=couponStartdate]').val(data.couponStartdate);
					$('#couponModal input[name=couponCostsale]').val(data.couponCostsale);
					$('#couponModal input[name=couponSalerate]').val(data.couponSalerate);
					$('#couponModal input[name=couponCostori]').val(data.couponCostori);
					$('#couponModal textarea[name=couponIntro]').text(data.couponIntro);
					
					$('.couponModal').show();
				}, error : function(request,status,error){
					console.log("실패");
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			})
		});
		
		
	})
</script>
	<!-- 쿠폰 모달 -->
	<div id="couponModal" class="couponModal">
		<div id="content_modal">
			<div class="content_modal">
				<div class="title_modal">
					<span>쿠폰 관리</span> <span class="close _close_update">&times;</span>
				</div>
				<form action="${root}/coupon/couponUpdateOk.go" method="post"
					enctype="multipart/form-data" onsubmit="return insertForm(this)" name="couponForm">
					
					<input type="hidden" id="upCouponCode" name="couponCode" />
					<input type="hidden" name="pageNumber" value="${pageNumber}" />
					<div class="coupon">
						<div>
							<span>쿠폰명</span>
							<input id="upCouponName" type="text" name="couponName" />
						</div>
						<div>
							<span>가게코드</span>
							<input type="text" name="foodCode">
							<input class="button" type="button" value="식당검색" onclick="foodcodeRead('${root}')">
							<input type="text" name="foodName" disabled>
						</div>
						<div>
							<span>쿠폰내용</span>
							<textarea rows="3" cols="55" name="couponIntro"></textarea>
						</div>
						<div>
							<span>유효기간</span>
							<!-- 달력로 대체예정  -->
							<input id="datepickStart" type="text" name="couponStartdate"
								value="${couponDto.couponStartdate}">
							<input id="datepickEnd" type="text" name="couponEnddate">
						</div>
						<div>
							<span>원가격</span>
							<input id="cost" type="text" name="couponCostori">
						</div>
						<div>
							<span>할인율</span>
							<input id="saleRate" type="text" name="couponSalerate" maxlength="3">
						</div>
						<div>
							<span>할인가</span>
							<input type="text" name="couponCostsale">
						</div>
						<div>
							<span>쿠폰 이미지</span>
							<input type="file" name="imageFile">
							<span id="imageName"></span>
						</div>
						<div class="btn">
							<input class="button" type="submit" value="수정하기">
							<input class="button" type="reset" value="초기화">
							<a class="button" href="javascript:couponDeleteCheck('${root}','upCouponCode.value','upCouponName.value','${pageNumber}')">삭제하기</a>
							<!-- <button class="button">삭제하기</button> -->
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		//쿠폰 삭제 확인
		function couponDeleteCheck(root, couponCode, couponName, pageNumber){
			//var couponCode = 
			
			var url = root + "/coupon/couponDelete.go?couponCode="+upCouponCode.value+"&couponName="+upCouponName.value+"&pageNumber="+pageNumber;
			open(url, "", "width= 400, height=200, scrollbars=no");
		}
	
		$(function(){
			$('.couponModal #cost, .couponModal #saleRate').on('change', function(){
				var oriCost = parseInt($('.couponModal input[name=couponCostori]').val() || 0);
				var salePer = parseInt($('.couponModal input[name=couponSalerate]').val() || 0);
				var result = Math.ceil((oriCost - (oriCost * (salePer * 0.01))));
				
				$('.couponModal input[name=couponCostsale]').val(result);
			});
			
			$('.couponInModal #cost, .couponInModal #saleRate').on('change', function(){
				var oriCost = parseInt($('.couponInModal input[name=couponCostori]').val() || 0);
				var salePer = parseInt($('.couponInModal input[name=couponSalerate]').val() || 0);
				var result = Math.ceil((oriCost - (oriCost * (salePer * 0.01))));
				
				$('.couponInModal input[name=couponCostsale]').val(result);
			});
		})
	</script>

	<!-- 쿠폰 등록 모달 -->
	<div id="couponInModal" class="couponInModal">
		<div id="content_modal">
			<div class="content_modal">
				<div class="title_modal">
					<span>쿠폰 등록</span> <span class="close _close">&times;</span>
				</div>
				<form action="${root}/coupon/couponInsertOk.go" method="post" enctype="multipart/form-data" onsubmit="return insertForm(this)"
					name="couponFormInsert" autocomplete="off">
					<input type="hidden" name="formSort" value="in" />
					<div class="coupon">
						<div>
							<span>쿠폰명</span> <input type="text" name="couponName" />
						</div>
						<div>
							<span>가게코드</span>
							<input type="text" name="foodCode"> 
							<input class="button" type="button" value="식당검색" onclick="foodcodeRead('${root}','${cInsert}')">
							<input type="text" name="foodName" disabled>
						</div>
						<div>
							<span>쿠폰내용</span>
							<textarea rows="3" cols="55" name="couponIntro"></textarea>
						</div>
						<div>
							<span>유효기간</span>
							<!-- 달력로 대체예정  -->
							<input id="datepickStartInsert" type="text" name="couponStartdate">
							<input id="datepickEndInsert" type="text" name="couponEnddate">
						</div>
						<div>
							<span>원가격</span> <input id="cost" type="text"
								name="couponCostori">
						</div>
						<div>
							<span>할인율</span> <input id="saleRate" type="text"
								name="couponSalerate" maxlength="3">
						</div>
						<div>
							<span>할인가</span> <input type="text" name="couponCostsale">
						</div>
						<div>
							<span>쿠폰 이미지</span> <input type="file" name="imageFile">
						</div>
						<!-- <div>
						<span>쿠폰상태</span>
						<input type="radio" name="couponStatus" value="y"><label>활성화</label>
						<input type="radio" name="couponStatus" value="n"><label>비활성화</label>
					</div> -->
						<div class="btn">
							<input class="button _close" type="submit" value="등록하기"></input>
							<input class="button" type="reset" value="초기화"></input>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	 $(function(){
		 /*  쿠폰 등록 클릭시 작동 */
		$('._open').click(function(){
			$('.couponInModal').show();	
		});
		$('._close').click(function(){
			$('.couponInModal').hide();
		});
		
		/*  게시판  클릭시 작동 */
		$('#list tbody tr').click(function(){
			//$('.couponModal').show();
		});
		$('._close_update').click(function(){
			$('.couponModal').hide();
		});
	 })
	</script>
</body>
</html>