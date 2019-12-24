// 유효성 검사
function foodForm(obj) {
	var start = document.getElementById("start").value;
	var end = document.getElementById("end").value;
	if (start != null && end != null) {
		obj.foodTime.value = start + "~" + end;
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
	if (obj.foodPhone.value == "") {
		alert("전화번호를 입력하세요.");
		obj.foodPhone.focus();
		return false;
	}
	/*
	 * if(obj.foodKind.value==""){ alert("음식종류를 입력하세요."); return false; }
	 * if(obj.foodMenu.value==""){ alert("대표메뉴를 입력하세요."); obj.foodMenu.focus();
	 * return false; } if(obj.foodTime.value==""){ alert("영업시간을 입력하세요."); return
	 * false; }
	 */
	if (obj.foodIntro.value == "") {
		alert("가게 소개를 입력하세요.");
		obj.foodIntro.focus();
		return false;
	}
}