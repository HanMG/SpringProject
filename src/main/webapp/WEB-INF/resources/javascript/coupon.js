/**
 * coupon.js
 */

//유효성 체크
function insertForm(obj){
	alert("insertForm Ok");
	
}


//식당코드 선택 페이지 열기
function foodcodeRead (root){
	var url = root + "/coupon/searchFoodCode.go";
	open(url, "", "width= 500, height=500, scrollbars=yes");
}


//식당코드 기입
function sendFoodCode(food_code, food_name, food_addr){
	var add = food_code + " " + food_name + " " +food_addr;
	
	open.couponForm.food_code.value= food_code;
	
}