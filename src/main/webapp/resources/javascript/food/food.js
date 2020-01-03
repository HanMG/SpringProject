// 음식점 등록시 
function foodInForm(obj){
	let foodKind1 = $("#foodKind1").val();
	let foodKind2 = $("#foodKind2").val();
	let foodKind = foodKind1 +" > " +foodKind2;	
	if(!foodKind1 == ""){
		$("#foodKind").val(foodKind);
	}	
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
	if(obj.foodArea.value == ""){
		alert("지역을 확인해주세요!");		
		return false;
	}
	if (obj.foodPhone.value == "") {
		alert("전화번호를 입력하세요.");
		obj.foodPhone.focus();
		return false;
	}	
	if(foodKind1 == ""){
		alert("종류를 선택해주세요!!");		
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
function foodUpForm(obj) {	
	let foodKindUp1 = $("#foodKindUp1").val();
	let foodKindUp2 = $("#foodKindUp2").val();
	let foodKindUp = foodKindUp1 +" > " +foodKindUp2;	
	if(!foodKindUp1 == ""){
		$("#foodKindUp").val(foodKindUp);
	}		
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
	if(obj.foodArea.value == ""){
		alert("지역을 확인해주세요!");		
		return false;
	}
	if (obj.foodPhone.value == "") {
		alert("전화번호를 입력하세요.");
		obj.foodPhone.focus();
		return false;
	}	
	if(foodKindUp1 == ""){
		alert("종류를 선택해주세요!!");		
		return false;
	}
	if(!$("#imgWrapper").find("img")){
		if(obj.imgFile.value == ""){
			alert("대표 이미지를 최소 1개 이상 넣어주세요!!");
			obj.imgFile.focus();
			return false;
		}
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

// 동적 셀렉트박스 , 음식종류 대분류 소분류
function kindChange(text){
	 
	let kor = ["꽃등심/등심/육회","낙지","냉면","닭볶음탕/닭갈비/닭발","돼지갈비/갈매기살","떡","떡볶이/순대/튀김/만두","라면/칼국수/국수/수제비","불고기/갈비살/차돌박이","비빔밥/돌솥밥/쌈밥","삼겹살/목살","삼계탕/백숙/찜닭","설렁탕/곰탕/도가니탕","순대국","순두부","오리 훈제/구이/로스/탕","전복","족발/보쌈","죽","찌개/전골/국/탕","찌개/전골/국/탕","철판구이/볶음밥","치킨/훈제","파전/모듬전/빈대떡","한정식","해물탕/해물요리/꽃게","해장국/국밥","회","그밖에또다른것"];
	let chn = ["중국음식","그밖에또다른것"];
	let jp = ["일본음식/초밥","씨푸드","샤브샤브","그밖에또다른것"];
	let west = ["남미음식","돈가스","브런치","스테이크하우스","유로피언레스토랑","이태리레스토랑","지중해음식","패밀리레스토랑","패스트푸드","퓨전레스토랑","프렌치레스토랑","햄버거","그밖에또다른것"];
	let cafe = ["카페/커피숍","맥주/호프","이자까야","아이스크림","실내포장마차","소주","사케","베이커리/제과점","호텔바","포장마차","와인","바","도넛","그밖에또다른것"];
	let etc = ["카페테리아/식당","카레","인도음식","뷔페","동남아음식","그밖에또다른것"];  
	var selectItem = $("#"+text+"1").val();
	 
	var changeItem;
	  
	if(selectItem == "한식"){
	 	changeItem = kor;
	}
	else if(selectItem == "중식"){
	 	changeItem = chn;
	}
	else if(selectItem == "일식"){
	 	changeItem =  jp;
	}
	else if(selectItem == "양식"){
		changeItem = west;
	}
	else if(selectItem == "카페/술"){
		changeItem = cafe;
	}
	else if(selectItem == "기타"){
		changeItem = etc;
	}
	 
	$("#"+text+"2").empty();
	if(changeItem != null){ 
		for(let i = 0; i < changeItem.length; i++){                
			let option = $("<option>"+changeItem[i]+"</option>");
		    $("#"+text+"2").append(option);
	    }	 
	}
}	