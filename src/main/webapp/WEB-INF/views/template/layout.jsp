<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set> 
<html>
<head>
<meta charset="UTF-8">
<title>Eat The Jeju</title>
<!-- css 관련 -->
<link rel="stylesheet" type="text/css" href="${root}/resources/css/radioButton.css" />
<link rel="stylesheet" href="${root}/resources/css/slideshow.css" />
<link rel="icon" type="image/png" sizes="16x16" href="${root}/resources/css/favicon-16x16.png/">
<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 필요한 스크립트 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="${root}/resources/jquery/jquery-3.4.1.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- jQuery UI -->
<script type="text/javascript" src="${root}/resources/jquery/ui/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/jquery/ui/jquery-ui.css" />
<!-- AJAX (xhr) -->
<script type="text/javascript" src="${root}/resources/xhr.js"></script>
<!-- 카카오  -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f30f46c40f26ed513be4c81611d91389&libraries=services"></script>
<style type="text/css">
@font-face {
  font-family: 'Noto Sans KR';
  font-style: normal;
  font-weight: 100;
  src: url(${root}/resources/fonts/NotoSansKR-Thin.woff2) format('woff2'),
       url(${root}/resources/fonts/NotoSansKR-Thin.woff) format('woff'),
       url(${root}/resources/fonts/NotoSansKR-Thin.otf) format('opentype');
}
@font-face {
  font-family: 'Noto Sans KR';
  font-style: normal;
  font-weight: 300;
  src: url(${root}/resources/fonts/NotoSansKR-Light.woff2) format('woff2'),
       url(${root}/resources/fonts/NotoSansKR-Light.woff) format('woff'),
       url(${root}/resources/fonts/NotoSansKR-Light.otf) format('opentype');
}
@font-face {
   font-family: 'Noto Sans KR';
   font-style: normal;
   font-weight: 400;
   src: url(${root}/resources/fonts/NotoSansKR-Regular.woff2) format('woff2'),
        url(${root}/resources/fonts/NotoSansKR-Regular.woff) format('woff'),
        url(${root}/resources/fonts/NotoSansKR-Regular.otf) format('opentype');
 }
@font-face {
   font-family: 'Noto Sans KR';
   font-style: normal;
   font-weight: 500;
   src: url(${root}/resources/fonts/NotoSansKR-Medium.woff2) format('woff2'),
        url(${root}/resources/fonts/NotoSansKR-Medium.woff) format('woff'),
        url(${root}/resources/fonts/NotoSansKR-Medium.otf) format('opentype');
 }
@font-face {
   font-family: 'Noto Sans KR';
   font-style: normal;
   font-weight: 700;
   src: url(${root}/resources/fonts/NotoSansKR-Bold.woff2) format('woff2'),
        url(${root}/resources/fonts/NotoSansKR-Bold.woff) format('woff'),
        url(${root}/resources/fonts/NotoSansKR-Bold.otf) format('opentype');
 }
@font-face {
   font-family: 'Noto Sans KR';
   font-style: normal;
   font-weight: 900;
   src: url(${root}/resources/fonts/NotoSansKR-Black.woff2) format('woff2'),
        url(${root}/resources/fonts/NotoSansKR-Black.woff) format('woff'),
        url(${root}/resources/fonts/NotoSansKR-Black.otf) format('opentype');
 } 
input::-webkit-input-placeholder {
	font-family: Noto Sans KR;
}

html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
	font-family: Noto Sans KR;
	font-weight: 500;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
	display: block;
}
ol, ul, a {
	list-style: none;
	text-decoration: none;
	color: #030305;
}
a {
	color: #EFB730;
}
button {
	color: #FFFFFF;
    border: #EFB730 solid 1px;
    background-color: #EFB730;
    cursor: pointer;
    border-radius: 7px;
}
.button {
	color: #FFFFFF;
    border: #EFB730 solid 1px;
    background-color: #EFB730;
    border-radius: 5px;
}
img {
	object-fit: cover;
}
input {
	outline: none;
}
</style>
</head>
<body>
<!-- header/menu -->
<!-- content -->
<div class="container">
	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="content"/>
	<tiles:insertAttribute name="footer"/>
</div>
<!-- footer -->
</body>
<%-- <tiles:insertAttribute name="script"/> --%>

</html>