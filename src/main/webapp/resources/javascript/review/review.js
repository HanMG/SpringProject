// 리뷰 쓰기 유효성 검사
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
	if(obj.imgFile.value == ""){
		alert("최소 1개 이상의 이미지를 업로드해주세요!");
		return false;
	}	
}

// 리뷰 수정 유효성 검사 
function reviewUpForm(obj){
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
	if ($("#imgDiv").find("td").length == 0 && obj.imgFile.value == ""){
		alert("최소 1개 이상의 이미지를 업로드해주세요!!");
		return false;
	}
}


//삭제 이미지 파일명 저장
function delImage(tdId, imgName) {
	//alert(tdId + "," + imgName);
	document.getElementById("deleteImg").value += imgName + ",";
	//document.getElementById(tdId).style.display = "none";
	$("#"+tdId).remove();
}


// 리뷰 삭제
function userDelete(root, foodCode, reviewCode){
	let isOk = confirm("정말로 리뷰를 삭제하시겠습니까?");
	if(isOk == true){
	let url = root+"/review/userDelete.go?reviewCode="+reviewCode+"&foodCode="+foodCode;		
	location.href=url;	
	}
}	

// 리뷰 수정
function userUpdate(root, foodCode, reviewCode){
	let url = root+"/review/update.go?reviewCode="+reviewCode+"&foodCode="+foodCode;
	location.href=url;
}