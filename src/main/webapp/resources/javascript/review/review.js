// 유효성 검사.
function reviewForm(obj) {
	if (obj.reviewScore.value == "") {
		alert("리뷰 스코어를 입력해주세요.");
		obj.reviewScore[0].focus();
		return false;
	}
	if (obj.reviewCont.value == "") {
		alert("리뷰 내용을 입력해주세요.");
		obj.reviewCont.focus();
		return false;
	}
}

//삭제 이미지 파일명 저장.
function delImage(tdId, imgName) {
	//alert(tdId + "," + imgName);
	document.getElementById("deleteImg").value += imgName + ",";
	document.getElementById(tdId).style.display = "none";
}
