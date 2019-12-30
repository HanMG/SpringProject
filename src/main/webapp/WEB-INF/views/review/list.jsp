<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>리뷰리스트</title>
<script>

	var reViewInfoModal = $("#reViewInfoModal");
	var close_reViewInfo = $(".close_reViewInfo");
	$(function(){

		var reviewInfoClick = $(".reviewInfoClick");
		for (var i = 0; i < reviewInfoClick.length; i++) {
			reviewInfoClick[i].onclick = function() {
				reViewInfoModal.css("display","block");
			}
		}
		close_reViewInfo[0].onclick = function() {
			reViewInfoModal.css("display","none");
		}
	});

</script>
<style type="text/css">
/* 리뷰 상세내용 */
#content_reViewInfo{
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -500px;
	margin-top: -400px;
	background: #F2F4EF;
	width: 1000px;
	height: 700px;
	border-radius: 5px;
}
.reViewInfoModal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
.icon {
	width: 10px;
	height: 10px;
}
.emoticon{
	width: 48px;
	height: 48px;
}
</style>
</head>
<body>
	<div class="re_1">
		<span>리뷰(${reviewCountDto.whole})</span> <a href="javascript:void(0)"
			onclick="reviewList('${root}','1')"><span>별로(${reviewCountDto.bad})</span></a>
		<a href="javascript:void(0)" onclick="reviewList('${root}','3')"><span>괜찮다(${reviewCountDto.soso})</span></a>
		<a href="javascript:void(0)" onclick="reviewList('${root}','5')"><span>맛있다(${reviewCountDto.good})</span></a>
		<a href="javascript:void(0)" onclick="reviewList('${root}','0')"><span>전체(${reviewCountDto.whole})</span></a>
	</div>
	<c:choose>
		<c:when test="${foodReviewList != null}">

			<c:forEach var="foodReviewDto" items="${foodReviewList}">
				<div class="re_2 reviewInfoClick">
					<div>
						<span>${foodReviewDto.memberName}</span>
					</div>
	
	
					<div>
						<!-- ${root}/review/read.go?reviewCode=${foodReviewDto.reviewCode}  -->
						<a href="#" >
							<div class="reviewCont">
								<span><fmt:formatDate value="${foodReviewDto.reviewDate}"
										pattern="yyyy-MM-dd" /></span> <span>${foodReviewDto.reviewCont}</span>
							</div>
							<div class="reviewImg">
								<c:set var="img"
									value="${fn:split(foodReviewDto.imageName,',')}" />
								<c:forEach var="imgList" items="${img}">
									<img src="${root}/resources/ftp/${imgList}" alt=""
										style="width: 100px; height: 100px;"
										onerror="this.src='${root}/resources/css/list.jpg'" />
								</c:forEach>
							</div>
						</a>
					</div>

					<div>
						<c:choose>
							<c:when test="${foodReviewDto.reviewScore == 5}">
								<img class="emoticon" alt="" src="${root}/resources/css/emoticon_5.png">
								<br/><span>맛있다</span>
							</c:when>
							<c:when test="${foodReviewDto.reviewScore == 3}">
								<img class="emoticon" alt="" src="${root}/resources/css/emoticon_3.png">
								<br/><span>괜찮다</span>
							</c:when>
							<c:when test="${foodReviewDto.reviewScore == 1}">
								<img class="emoticon" alt="" src="${root}/resources/css/emoticon_1.png">
								<br/><span>별로</span>
							</c:when>
						</c:choose>
						<%-- <span>(${foodReviewDto.reviewScore})</span> --%>
					</div>
					<c:if test="${memberCode == foodReviewDto.memberCode}">
						<div>
						</div>
						<div>
							<a href="${root}/review/update.go?foodCode=${foodDto.foodCode}&reviewCode=${foodReviewDto.reviewCode}">수정</a>
							<a href="javascript:void(0)" onclick="userDelete('${root}','${foodReviewDto.foodCode}','${foodReviewDto.reviewCode}')">삭제</a>									
						</div>
					</c:if>
				</div>
			</c:forEach>

		</c:when>
		<c:when test="${foodReviewList == null}">
			<div class="re_2">
				<div>첫 리뷰의 주인공이 되어주세요!!</div>
			</div>
		</c:when>
	</c:choose>
	<!-- 리뷰 상세내용(큰이미지) 모달 -->
	<div id="reViewInfoModal" class="reViewInfoModal">
		<div id="content_reViewInfo">
			<div class="reViewInfo">
				<div class="title_reViewInfo">
					<span>리뷰 작성</span>
					<span class="close_reViewInfo">&times;</span>
				</div>
				<div class="info">
					<p><strong>${foodDto.foodName}</strong>에 대한 솔직한 리뷰 입니다.</p>
					<div>
						<div id="reviewCont"></div>
						<div id="reviewScore"></div>
						<div id="fileDiv">
							<c:if test="${listImage != null}">
								<table style="text-align:center;">
									<tr>
										<c:forEach var="imageDto" items="${listImage}">							
											<td><img src="${root}/resources/ftp/${imageDto.imageName}"
												alt="image" style="width: 100px; height: 100px;" onerror="this.src='${root}/resources/css/list.jpg'" /><br /><label>${fn:substringAfter(imageDto.imageName,'_')}</label>								
											</td>
										</c:forEach>
									</tr>
								</table>
							</c:if>			
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>