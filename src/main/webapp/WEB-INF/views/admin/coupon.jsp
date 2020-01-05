<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.ui-datepicker {
	background: #fff;
}
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

#title>span {
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
/* 쿠폰관련 */
#content_modal {
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -400px;
	margin-top: -400px;
	background: #F2F4EF;
	width: 800px;
	border-radius: 5px;
	overflow: hidden;
	]
}

.content_modal {
	width: 800px;
	overflow: hidden;
}


.title_modal {
	width: 800px;
	height: 50px;
	line-height: 50px;
	font-size: 30px;
	font-weight: bold;
	text-align: center;
}


/* 쿠폰관련 */
.coupon {
	overflow: hidden;
	width: 600px;
	margin: 10px auto;
}

.coupon>div {
	margin-top: 5px;
}

.coupon>div span:nth-child(1), .foodBtn {
	font-size: 23px;
	display: inline-block;
	width: 150px;
	line-height: 50px;
}

.coupon>div>input[type=text] {
	display: inline-block;
	width: 445px;
	height: 50px;
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
.buttonSize {
	font-size: 23px;
	width: 280px;
	height: 50px;
	color: #FFFFFF;
	border: #343A40 solid 1px;
	background-color: #343A40;
}
.span {
	font-size: 23px;
}
.listBtn {
	font-size: 23px;
	width: 180px;
	height: 50px;
	color: #FFFFFF;
	border: #343A40 solid 1px;
	background-color: #343A40;
}
.menuBtn {
	float: right;
	font-size: 23px;
	height: 50px;
    width: 120px;
    line-height: 50px;
    color: #FFFFFF;
    border: #343A40 solid 1px;
    background-color: #343A40;
    margin: 5px;
}
.date > input {
}


</style>
<script type="text/javascript" src="${root}/resources/javascript/coupon/coupon.js"></script>

<script type="text/javascript">
			//유효성 체크
			function insertForm(obj){
				var formCheck = true;
				
				if(obj.couponName.value==""){
					alert("등록하실 쿠폰상품명을 입력해주세요.");
					obj.couponName.focus();
					return false;
				}
				if(obj.foodCode.value==""){
					alert("등록하실 음식점명을 입력해주세요.");
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
				
				var radioCheck = false;
				for (var i=0; i < obj.couponStatus.length; i++){
					if(obj.couponStatus[i].checked == true){
						radioCheck = true;
					}
				}
				
				if(radioCheck == false){
					alert("상품 활성화 상태를 선택해주세요.");
					return false;
				}
			}
	
			//음식점코드 리스트 출력
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
				$.datepicker.setDefaults({
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
				});
				$('#datepickStart').datepicker();
				$('#datepickEnd').datepicker();
				
				$('#datepickStartUp').datepicker();
				$('#datepickEndUp').datepicker();
			})
		</script>
</head>
<body>
	<c:set var="cInsert" value="0" />
	<div id="content">
		<div id="title">
			<span>쿠폰 관리</span>
			<button class="menuBtn _open" id="couponInClick">쿠폰등록</button>
		</div>
		<div id="list">
			<input type="hidden" name="pageNumber" value="${pageNumber}">
			<table id="example" class="display" style="width: 100%">
				<thead>
					<tr>
						<th>쿠폰코드</th>
						<th>음식점코드</th>
						<th>쿠폰명</th>
						<th>유효기간</th>
						<th>할인가</th>
						<th>가격</th>
						<th>쿠폰 활성화 상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="couponDto" items="${couponList}" begin="0"
						step="1">
						<tr id="couponClick">
							<th id="sendCouponCode">${couponDto.couponCode}</th>
							<th>${couponDto.foodCode}</th>
							<th>${couponDto.couponName}</th>
							<th>
								<fmt:parseDate value="${couponDto.couponStartdate}" var="startDate" pattern="yyyy-MM-dd" />
								<fmt:formatDate value="${startDate}" pattern="yyyy년  MM월  dd일" /> ~ 
								<fmt:parseDate value="${couponDto.couponEnddate}" var="endDate" pattern="yyyy-MM-dd " />
								<fmt:formatDate value="${endDate}" pattern="yyyy년  MM월  dd일 " />
							</th>
							<th>${couponDto.couponSalerate}</th>
							<th>${couponDto.couponCostsale}</th>
							<th>${couponDto.couponStatus}</th>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

<script type="text/javascript">
	$(function(){
		$('body').delegate('#couponClick', 'click', function(e){
			$('#couponModal').css("display","block");
			var couponId = $(this).children('#sendCouponCode').text();
			var sendData = "couponCode="+couponId;
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
					$('#couponModal input[name=couponStartdate]').val(data.couponStartdate);
					$('#couponModal input[name=couponEnddate]').val(data.couponEnddate);
					$('#couponModal input[name=couponCostsale]').val(data.couponCostsale);
					$('#couponModal input[name=couponSalerate]').val(data.couponSalerate);
					$('#couponModal input[name=couponCostori]').val(data.couponCostori);
					$('#couponModal textarea[name=couponIntro]').text(data.couponIntro);
					
					$("input:radio[name='couponStatus']:input[value="+data.couponStatus+"]").attr("checked", true);
					
					//$('.couponModal').show();
				}, error : function(request,status,error){
					console.log("실패");
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			})
		});

		$('._closeUpdate').click(function(){
			$('#couponModal').css("display","none");
		});
	})
</script>
	<!-- 쿠폰 모달 -->
	<div id="couponModal" class="couponModal">
		<div id="content_modal">
			<div class="content_modal">
				<div class="title_modal">
					<span>쿠폰 관리</span> <span class="close _closeUpdate">&times;</span>
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
							<span>음식점코드</span>
							<input type="text" name="foodCode">
							<input class="button foodBtn" type="button" value="음식점검색" onclick="foodcodeRead('${root}')">
							<input type="text" name="foodName" disabled>
						</div>
						<div>
							<span>쿠폰내용</span>
							<textarea rows="5" cols="60" name="couponIntro" style="vertical-align: top;"></textarea>
						</div>
						<div class="date">
							<span>유효기간</span>
							<!-- 달력로 대체예정  -->
							<input style="width: 195px;" id="datepickStartUp" type="text" name="couponStartdate" value="${couponDto.couponStartdate}">
							~
							<input style="width: 195px;" id="datepickEndUp" type="text" name="couponEnddate">
						</div>
						<div>
							<span>원가격</span>
							<input class="cost" type="text" name="couponCostori">
						</div>
						<div>
							<span>할인율</span>
							<input class="saleRate" type="text" name="couponSalerate" maxlength="3">
						</div>
						<div>
							<span>할인가</span>
							<input type="text" name="couponCostsale">
						</div>
						<div>
							<span>쿠폰 이미지</span>
							<input type="file" name="imageFile">
							<span style="margin-left: 150px;" id="imageName"></span>
						</div>
						<div>
							<span>쿠폰 상태</span>
							<input type="radio" name="couponStatus" value="Y"><label class="span" >활성화</label>
							<input type="radio" name="couponStatus" value="N"><label class="span" >비활성화</label>
						</div>
						<div class="btn">
							<input class="listBtn" type="submit" value="수정하기">
							<input class="listBtn" type="reset" value="초기화">
							<a style="line-height: 48px; display: inline-block;" class="listBtn" href="javascript:couponDeleteCheck('${root}','upCouponCode.value','upCouponName.value','${pageNumber}')">삭제하기</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			$('._deleteCheckBtn').on('click',function(){
				if(confirm("정말로 삭제하시겠습니까?")){
					var couponCode = $('input[name=couponCode]').val();
					var url = "${root}/coupon/couponDeleteOk.go?couponCode="+couponCode;
					$.ajax({
						url: url,
						type: 'POST',
						dataType: 'json',
						success: function(data){
							var check = data.check;
							if(check == 1){
								alert("쿠폰이 삭제되었습니다.");
							} else {
								alert("쿠폰 삭제가 정상처리되지 않았습니다.")
							}
							$('#couponModal').hide();
						}, error : function(request,status,error){
							console.log("실패");
					        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
				} else {
					return false;
				}
			});				
		})
	
		$(function(){
			$('.couponModal .cost, .couponModal .saleRate').on('change', function(){
				var oriCost = parseInt($('.couponModal input[name=couponCostori]').val() || 0);
				var salePer = parseInt($('.couponModal input[name=couponSalerate]').val() || 0);
				var result = Math.ceil((oriCost - (oriCost * (salePer * 0.01))));
				
				$('.couponModal input[name=couponCostsale]').val(result);
			});
			
			$('.couponInModal .cost, .couponInModal .saleRate').on('change', function(){
				var oriCost = parseInt($('.couponInModal input[name=couponCostori]').val() || 0);
				var salePer = parseInt($('.couponInModal input[name=couponSalerate]').val() || 0);
				var result = Math.ceil((oriCost - (oriCost * (salePer * 0.01))));
				
				$('.couponInModal input[name=couponCostsale]').val(result);
			});
		})
	</script>
	<script type="text/javascript">
	 $(function(){
		 /*  쿠폰 등록 클릭시 작동 */
		$('._open').click(function(){
			$('.couponInModal').show();	
		});
		$('._close').click(function(){
			$('.couponInModal').hide();
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
							<span>음식점코드</span>
							<input type="text" name="foodCode"> 
							<input class="button foodBtn" type="button" value="음식점검색" onclick="foodcodeRead('${root}','${cInsert}')">
							<input type="text" name="foodName" disabled>
						</div>
						<div>
							<span>쿠폰내용</span>
							<textarea rows="5" cols="60" name="couponIntro" style="vertical-align: top;"></textarea>
						</div>
						<div class="date">
							<span>유효기간</span>
							<!-- 달력로 대체예정  -->
							<input style="width: 195px;" id="datepickStart" type="text" name="couponStartdate">
							~
							<input style="width: 195px;" id="datepickEnd" type="text" name="couponEnddate">
						</div>
						<div>
							<span>원가격</span>
							<input class="cost" type="text" name="couponCostori">
						</div>
						<div>
							<span>할인율</span>
							<input class="saleRate" type="text" name="couponSalerate" maxlength="3">
						</div>
						<div>
							<span>할인가</span>
							<input type="text" name="couponCostsale">
						</div>
						<div>
							<span>쿠폰 이미지</span>
							<input type="file" name="imageFile">
						</div>
						<div class="btn">
							<input class="_close buttonSize" type="submit" value="등록하기"></input>
							<input class="buttonSize" type="reset" value="초기화"></input>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>