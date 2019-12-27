// 음식점 등록시 
function foodInForm(obj){
	if (obj.foodName.value == "") {
		alert("음식점명을 입력하세요.");
		obj.foodName.focus();
		return false;
	}
	if (obj.foodAddr.value == "") {
		alert("음식점주소를 입력하세요.");
		obj.foodAddr.focus();
		return false;
	}
	if(!$('input:radio[name=foodArea]').is(':checked')){
		alert("지역을 확인해주세요!");		
		return false;
	}
	if (obj.foodPhone.value == "") {
		alert("전화번호를 입력하세요.");
		obj.foodPhone.focus();
		return false;
	}
	if(obj.imgFile.value == ""){
		alert("대표 이미지를 최소 1개 이상 넣어주세요!!");
		obj.imgFile.focus();
		return false;
	}	
	if (obj.foodIntro.value == "") {
		alert("음식점 소개를 입력하세요.");
		obj.foodIntro.focus();
		return false;
	}
	
	if(!$('input:radio[name=foodStatus]').is(':checked')){
		alert("식당 상태를 확인해주세요!");
		return false;
	}	
}

// 음식점 업데이트 시 
function foodForm(obj) {	

	if (obj.foodName.value == "") {
		alert("음식점명을 입력하세요.");
		obj.foodName.focus();
		return false;
	}
	if (obj.foodAddr.value == "") {
		alert("음식점주소를 입력하세요.");
		obj.foodAddr.focus();
		return false;
	}
	if(!$('input:radio[name=foodArea]').is(':checked')){
		alert("지역을 확인해주세요!");		
		return false;
	}
	if (obj.foodPhone.value == "") {
		alert("전화번호를 입력하세요.");
		obj.foodPhone.focus();
		return false;
	}	
	if(obj.imgFile.value == ""){
		alert("대표 이미지를 최소 1개 이상 넣어주세요!!");
		obj.imgFile.focus();
		return false;
	}	
	if (obj.foodIntro.value == "") {
		alert("음식점 소개를 입력하세요.");
		obj.foodIntro.focus();
		return false;
	}	
	if(!$('input:radio[name=foodStatus]').is(':checked')){
		alert("등록상태를 확인해주세요!");
		return false;
	}	
}

//식당 삭제
function foodDelete(root, foodCode){
	let isOk = confirm("정말로 삭제하시겠습니까?");
	if(isOk == true){
		let url = root+"/food/delete.go?foodCode="+foodCode;
		//alert(url);
		location.href=url;
	}
}