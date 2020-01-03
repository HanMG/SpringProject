<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
	<head>
		<meta charset="UTF-8">
		<title>쿠폰 상품 등록</title>
		<script type="text/javascript" src="${root}/resources/jquery/jquery-3.4.1.js"></script>
		<script type="text/javascript" src="${root}/resources/jquery/ui/jquery-ui.js"></script>
		<script type="text/javascript" src="${root}/resources/javascript/coupon/coupon.js"></script>
		<script type="text/javascript">
			//유효성 체크
			function insertForm(obj){
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
				
				if(obj.imageFile.value==""){
					alert("이미지를 첨부해주세요.");
					obj.imageFile.focus();
					return false;
				}
			}
	
			//음식점코드 리스트 출력
			function foodcodeRead (root){
				var url = root + "/coupon/searchFoodCode.go";
				open(url, "", "width= 500, height=500, scrollbars=yes");
			}
			
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
				})
				$('#datepickStart').datepicker();
				$('#datepickEnd').datepicker();
				//$('#datepickStart').datepicker('setDate', 'today');
				//$('#datepickEnd').datepicker('setDate','+1D');
			})
			
		</script>
	</head>
	<body>
		<form action="${root}/coupon/couponInsertOk.go" method="post" enctype="multipart/form-data" 
		onsubmit="return insertForm(this)" name="couponForm" autocomplete="off">
				<ul class="write_box">
					<li>
						<p>상품명(쿠폰명)</p>
						<p>
							<input type="text" name="couponName">
						</p>
					</li>
					<li>
						<p>음식점명</p>
						<p>
							<input type="text" name="foodCode">
							
							<input type="button" value="음식점검색" onclick="foodcodeRead('${root}')">
						</p>
						<p><input type="text" name="foodName" disabled></p>
					</li>
					<li>
						<p>유효 기간</p>
						<p>
							<input id="datepickStart" type="text" name="couponStartdate">
							<span>~</span>
							<input id="datepickEnd"  type="text" name="couponEnddate">
						</p>
					</li>
					<li>
						<p>상품 소개</p>
						<p>
							<textarea rows="10" cols="10" name="couponIntro">123</textarea>
						</p>
					</li>
					<li>
						<p>상품 가격(할인 전 가격)</p>
						<p>
							<input id="cost" type="text" name="couponCostori">
						</p>
					</li>
					<li>
						<p>할인율</p>
						<p>
							<input id="saleRate" type="text" name="couponSalerate" maxlength="3">
						</p>
					</li>
					<li>
						<p>판매 가격(할인된 가격)</p>
						<p>
							<input id="" type="text" name="couponCostsale">
						</p>
					</li>
					<li>
						<p>상품 대표 이미지</p>
						<p>
							<input type="file" name="imageFile">
							<span></span>
						</p>
					</li>
					<li>
						<p class="col1">
							<input class="btn" type="submit" value="상품 등록" />
							<input class="btn" type="reset" value="다시 작성" />
							<input class="btn" type="button" value="이전 화면으로" onclick="location.href='${root}/coupon/couponList.do'" />
						</p>
					</li>
				</ul>
			</form>
	</body>
	<script>
		$(function(){
			$('#cost, #saleRate').on('change', function(){
				
				var oriCost = parseInt($('input[name=couponCostori]').val() || 0);
				var salePer = parseInt($('input[name=couponSalerate]').val() || 0);
				var result = Math.ceil((oriCost - (oriCost * (salePer * 0.01))));
				
				$('input[name=couponCostsale]').val(result);
			});
		});
	</script>
</html>

