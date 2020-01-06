<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Eat The Jeju</title>
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
	<tiles:insertAttribute name="header" />
	<!-- content -->
	<div id="content-wrapper">

		<div class="container-fluid">
			<tiles:insertAttribute name="content" />
		</div>
		<tiles:insertAttribute name="footer" />
	</div>
	<!-- /.container-fluid -->	
	</div>
	<!-- /#wrapper -->
</body>
</html>