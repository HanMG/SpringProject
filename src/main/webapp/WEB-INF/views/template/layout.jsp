<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
<meta charset="UTF-8">
<title>Eat The Jeju</title>
</head>
<body>
<!-- header/menu -->
<tiles:insertAttribute name="header"/>
<tiles:insertAttribute name="menu"/>
<!-- content -->
<tiles:insertAttribute name="content"/>
<!-- footer -->
<tiles:insertAttribute name="footer"/>
</body>
</html>