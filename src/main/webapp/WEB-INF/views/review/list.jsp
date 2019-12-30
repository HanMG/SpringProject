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
<style type="text/css">
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
            <div class="re_2">
               <div>
                  <span>${foodReviewDto.memberName}</span>
               </div>

               <div onclick="myReview('${foodReviewDto.reviewCode}')">
                  <!-- ${root}/review/read.go?reviewCode=${foodReviewDto.reviewCode}  -->
                  <a href="javascript:void(0)" class="reviewInfoClick">
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
					<a href="javascript:void(0)" onclick="userUpdate('${root}','${foodReviewDto.foodCode}','${foodReviewDto.reviewCode}')">수정</a>
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
</body>
</html>