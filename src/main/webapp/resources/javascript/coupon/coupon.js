/**
 * coupon.js
 */

//가격계산


//유효성 체크
function insertForm(obj){
	//쿠폰소개는 null이 가능
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
		alert("할인율");
		obj.couponSalerate.focus();
		return false;
	}
	
}


//식당코드 선택 페이지 열기
function foodcodeRead (root){
	var url = root + "/coupon/searchFoodCode.go";
	open(url, "", "width= 500, height=500, scrollbars=yes");
}


//식당코드 기입
function sendFoodCode(foodCode, foodName, foodAddr){
	opener.couponForm.foodCode.value= foodCode;
	open.couponForm.foodName.value= foodName;
	self.close();
}