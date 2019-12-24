<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<html>
<head>
<meta charset="UTF-8">
<title>Eat The Jeju</title>
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